#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${APP_DIR:-$HOME/app/current}"
cd "$APP_DIR"

# Bootstrap Laravel if missing
if [ ! -f power_site/artisan ]; then
  echo "[deploy] Creating Laravel app in $APP_DIR/power_site"
  COMPOSER_MEMORY_LIMIT=-1 composer create-project laravel/laravel power_site
  cd power_site
  COMPOSER_MEMORY_LIMIT=-1 composer require laravel/socialite spatie/laravel-permission filament/filament spatie/laravel-csp bepsvpt/secure-headers mews/purifier
  COMPOSER_MEMORY_LIMIT=-1 composer require laravel/breeze --dev
  php artisan breeze:install blade
  npm ci || npm i
  npm run build
  php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider" --force
  # Overlay from repo
  cp -a ../ci-bootstrap/. ./
else
  cd power_site
fi

# Prepare env
if [ -n "${SERVER_ENV:-}" ]; then
  echo "[deploy] Applying SERVER_ENV to .env"
  printf "%s\n" "$SERVER_ENV" > .env
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

cd "$APP_DIR"
# Symlink public_html to Laravel public
if [ -d power_site/public ]; then
  if [ -L public_html ]; then rm -f public_html; elif [ -d public_html ]; then mv public_html public_html.bak.$(date +%s) || true; fi
  ln -s power_site/public public_html
fi
