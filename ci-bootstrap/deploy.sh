#!/usr/bin/env bash
set -euo pipefail

# APP_DIR points to .../applications/<id>/public_html
APP_DIR="${APP_DIR:-$HOME/applications/unknown/public_html}"
# Expand leading ~ in APP_DIR if present (from secrets)
APP_DIR="${APP_DIR/#\~/$HOME}"
# Auto-detect application path if not provided or missing
if [ ! -d "$APP_DIR" ] || [[ "$APP_DIR" == *"unknown"* ]]; then
  for cand in "$HOME"/applications/*/public_html; do
    if [ -d "$cand" ]; then APP_DIR="$cand"; break; fi
  done
fi
echo "[deploy] HOME=$HOME"
echo "[deploy] APP_DIR=$APP_DIR"
BASE_DIR="$(dirname "$APP_DIR")"   # .../applications/<id>
REPO_DIR="$APP_DIR"                 # rsync placed repo here

cd "$BASE_DIR"

# Bootstrap Laravel one level above public_html
if [ ! -f power_site/artisan ]; then
  echo "[deploy] Creating Laravel app in $BASE_DIR/power_site"
  COMPOSER_MEMORY_LIMIT=-1 composer create-project laravel/laravel power_site
  cd power_site
  COMPOSER_MEMORY_LIMIT=-1 composer require laravel/socialite spatie/laravel-permission filament/filament spatie/laravel-csp bepsvpt/secure-headers mews/purifier
  COMPOSER_MEMORY_LIMIT=-1 composer require laravel/breeze --dev
  php artisan breeze:install blade || true
  if command -v npm >/dev/null 2>&1; then
    npm ci || npm i || true
    npm run build || true
  else
    echo "[deploy] npm not found; skipping Vite build"
  fi
  php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider" --force || true
  # Overlay from repo (which lives in public_html)
  cp -a "$REPO_DIR/ci-bootstrap/." ./
else
  cd power_site
fi

# Prepare env
if [ -n "${SERVER_ENV:-}" ]; then
  echo "[deploy] Applying SERVER_ENV to .env"
  printf "%s\n" "$SERVER_ENV" > .env
  if ! grep -qE '^APP_KEY=.{10,}$' .env; then
    php artisan key:generate || true
  fi
else
  [ -f .env ] || cp .env.example .env
  php artisan key:generate || true
fi

# Install and migrate
composer install --no-dev --prefer-dist --optimize-autoloader --no-interaction
(php artisan migrate --force && php artisan db:seed --force) || echo "[deploy] Migration/seed skipped (check DB)."
php artisan config:cache || true
php artisan route:cache || true
php artisan view:cache || true

cd "$BASE_DIR"
# Replace public_html with symlink to Laravel public
if [ -d power_site/public ]; then
  if [ -L public_html ]; then rm -f public_html; elif [ -d public_html ]; then mv public_html public_html.bak.$(date +%s) || true; fi
  ln -s power_site/public public_html
  echo "[deploy] Symlinked public_html -> power_site/public"
fi


# Verify symlink; if not a symlink, fallback to copy
cd "$BASE_DIR"
if [ ! -L public_html ] || [ ! -e public_html/index.php ]; then
  echo "[deploy] Symlink not in place. Falling back to copy public/ into public_html"
  rm -rf public_html/*
  cp -a power_site/public/. public_html/
  if [ -f public_html/index.php ]; then
    sed -i "s#\../vendor/autoload.php#../power_site/vendor/autoload.php#" public_html/index.php || true
    sed -i "s#\../bootstrap/app.php#../power_site/bootstrap/app.php#" public_html/index.php || true
  fi
  ls -la public_html | sed -n '1,120p'
fi
