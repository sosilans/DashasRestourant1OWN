# Daria's Italian Kitchen — Laravel App

This app lives in `power_site/` and targets a Cloudways PHP/Laravel stack.

- Auth: Breeze (Blade)
- Admin: Filament
- Roles: spatie/laravel-permission
- Social: Socialite (Google/Apple placeholders)
- Security: CSP + Secure Headers + HTML Purifier hooks

## Setup

1) Copy `.env.example` to `.env` and set values
2) `php artisan key:generate`
3) Configure DB and run:

```
php artisan migrate --force
php artisan db:seed --force
```

4) Build assets

```
npm ci
npm run build
```

## Cloudways Deploy

Use `deploy.sh` from repo root on the server (or GitHub Actions with SSH):
- composer install --no-dev --optimize-autoloader
- php artisan migrate --force
- php artisan config:cache && php artisan route:cache && php artisan view:cache
- npm ci && npm run build (if needed)
