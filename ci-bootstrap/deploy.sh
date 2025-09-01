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
# Choose writable base dir for creating power_site
PARENT_DIR="$(dirname "$APP_DIR")"
BASE_DIR="$PARENT_DIR"
if mkdir -p "$PARENT_DIR/.deploy_w" 2>/dev/null; then
  rmdir "$PARENT_DIR/.deploy_w" 2>/dev/null || true
else
  BASE_DIR="$APP_DIR" # fallback to public_html
fi
echo "[deploy] BASE_DIR=$BASE_DIR"

REPO_DIR="$APP_DIR"                 # rsync placed repo here

cd "$BASE_DIR"

# Bootstrap Laravel one level above public_html
if [ ! -f power_site/artisan ]; then
  echo "[deploy] Creating Laravel app in $BASE_DIR/power_site"
  COMPOSER_MEMORY_LIMIT=-1 composer create-project laravel/laravel power_site
  cd power_site
  # Install required packages with versions compatible with Cloudways PHP
  COMPOSER_MEMORY_LIMIT=-1 composer require \
    laravel/socialite \
    spatie/laravel-permission:^6.0 \
    spatie/laravel-csp:^2.10 \
    bepsvpt/secure-headers:^9.0 \
    mews/purifier:^3.4 \
    --no-interaction --no-progress
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
  echo "[deploy] Refresh overlay"
  # When power_site is created in the parent of APP_DIR, ../ci-bootstrap does not exist.
  # Always copy from the checked-out repo at $REPO_DIR.
  cp -a "$REPO_DIR/ci-bootstrap/public/css/." ./public/css/ 2>/dev/null || true
  cp -a "$REPO_DIR/ci-bootstrap/public/js/." ./public/js/ 2>/dev/null || true
  cp -a "$REPO_DIR/ci-bootstrap/public/assets/." ./public/assets/ 2>/dev/null || true
  cp -a "$REPO_DIR/ci-bootstrap/resources/views/." ./resources/views/ 2>/dev/null || true
  cp -a "$REPO_DIR/ci-bootstrap/app/Http/Controllers/." ./app/Http/Controllers/ 2>/dev/null || true
  cp -a "$REPO_DIR/ci-bootstrap/routes/web.php" ./routes/web.php 2>/dev/null || true
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
if [ "$BASE_DIR" != "$APP_DIR" ]; then
  if [ -d power_site/public ]; then
    if [ -L public_html ]; then rm -f public_html; elif [ -d public_html ]; then mv public_html public_html.bak.$(date +%s) || true; fi
    ln -s power_site/public public_html
    echo "[deploy] Symlinked public_html -> power_site/public"
  fi
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


# Ensure webroot content is up-to-date when not using symlink
cd "$BASE_DIR"
if [ ! -L public_html ] && [ -d power_site/public ]; then
  echo "[deploy] Webroot is not a symlink. Syncing power_site/public -> public_html"
  if command -v rsync >/dev/null 2>&1; then
    rsync -a --delete power_site/public/ public_html/
  else
    rm -rf public_html/*
    cp -a power_site/public/. public_html/
  fi
  if [ -f public_html/index.php ]; then
    sed -i "s#\../vendor/autoload.php#../power_site/vendor/autoload.php#" public_html/index.php || true
    sed -i "s#\../bootstrap/app.php#../power_site/bootstrap/app.php#" public_html/index.php || true
  fi
  ls -la public_html | sed -n '1,120p'
fi

