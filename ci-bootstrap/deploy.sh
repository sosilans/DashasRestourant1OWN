#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/power_site"

if [ -f artisan ]; then
  php -d detect_unicode=0 artisan down || true
  composer install --no-dev --prefer-dist --optimize-autoloader --no-interaction
  php artisan migrate --force --no-interaction
  php artisan db:seed --force --no-interaction || true
  php artisan config:cache
  php artisan route:cache
  php artisan view:cache
  php artisan up
else
  echo "power_site not found. Did you run the bootstrap workflow?" >&2
  exit 1
fi
