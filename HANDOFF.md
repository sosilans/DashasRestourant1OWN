# Project Handoff — NEWDariasItalianKitchen4

This document summarizes the current state of the codebase, infra, deploy, and how to operate/troubleshoot. It is written so another engineer/agent can take over without prior context.

## Repo
- GitHub: https://github.com/sosilans/NEWDariasItalianKitchen4 (branch: `main`)
- App stack: Laravel 11 (Vite), Breeze (Blade), Socialite, Spatie Permission, Filament (planned), HTMLPurifier, CSP/Secure Headers
- Frontend: Blade + CSS in `public/css/styles.css`, small JS in `public/js/main.js`

## High-level Architecture
- Public site (Blade): `power_site/resources/views/pages/home.blade.php` with layout `resources/views/layouts/app.blade.php`
- Auth: Breeze (Blade)
- Roles: Spatie (admin/user)
- Reviews: simple POST (status=pending), moderation planned in Filament
- Admin: Filament (to be finalized) at `/admin` guarded by role `admin`

## Server/Infra
- Hosting: Cloudways (PHP/Laravel), Server IP: `143.110.155.248`
- App path (APP_DIR): `~/applications/ygrswjnpmw/public_html`
- Laravel app path (autodetected by deploy):
  - Preferred: `~/applications/ygrswjnpmw/power_site` (next to `public_html`)
  - Fallback (if no write permission in parent): `~/applications/ygrswjnpmw/public_html/power_site`
- Webroot: `public_html` either symlinked to `power_site/public` or copied (fallback) by deploy script

## Deploy & CI
- Workflows in `.github/workflows/`:
  - `bootstrap-laravel.yml`: creates a fresh Laravel app into `power_site/`, installs packages, builds, tests; commits back to `main` (idempotent)
  - `deploy.yml`: deploys repo to Cloudways via SSH key or password; remote script handles bootstrap/migrations/symlink
  - `ci.yml`: runs tests against `power_site/` on pushes
- SSH auth: key preferred (`CLOUDWAYS_SSH_KEY`), password fallback (`CLOUDWAYS_SSH_PASS`)
- Remote script: `ci-bootstrap/deploy.sh` (idempotent)
  - Normalizes CRLF, auto-detects `APP_DIR` and writable base, creates/updates `power_site/`
  - `composer install`, `php artisan migrate --force && db:seed --force`, caches
  - Symlink `public_html -> power_site/public` when возможно, иначе копирует `public/` в `public_html` и правит `index.php`

### GitHub Secrets (required)
- `CLOUDWAYS_SSH_HOST` = server IP (143.110.155.248)
- `CLOUDWAYS_SSH_USER` = Master Credentials user (e.g. `master_…`)
- `CLOUDWAYS_SSH_KEY` = private key (OpenSSH) OR `CLOUDWAYS_SSH_PASS` = password
- `CLOUDWAYS_APP_DIR` = `~/applications/ygrswjnpmw/public_html`
- `SERVER_ENV` = multi-line .env (DB creds, APP_URL, ADMIN_EMAIL, etc.)

> Note: Secrets live under GitHub → Repo → Settings → Secrets and variables → Actions. Do not commit secrets to the repo. See `HANDOFF_PRIVATE.template.md`.

### Manual Deploy (fallback)
1) Push to `main` (workflow triggers automatically); or
2) Run workflow "Deploy to Cloudways" manually; or
3) From local: `ssh master@143.110.155.248` then run the deploy script content under `ci-bootstrap/deploy.sh` (same as workflow).

## Local Dev
- Requirements: PHP 8.3, Composer, Node 22
- Steps:
```
cd power_site
cp .env.example .env
php artisan key:generate
composer install
npm ci && npm run dev
php artisan serve
```

## App Structure (power_site/)
- `app/Http/Controllers/HomeController.php` — populates home (menu/hours/reviews)
- `app/Http/Controllers/ReviewController.php` — POST /reviews (auth only, status=pending)
- `resources/views/layouts/app.blade.php` — layout + CSS/JS includes
- `resources/views/pages/home.blade.php` — landing page
- Assets (placeholders): `public/assets/img/hero.svg`, `public/assets/img/about.svg`

## Migrations/Models (MVP)
- `reviews` (user_id, body, rating, status, timestamps)
- `site_blocks` (key, enabled, sort, json_content)
- `menu_items` (name, description, price_decimal, emoji, sort)
- `business_hours` (day, open_time, close_time, note)
- Roles/permissions: Spatie tables

## Admin / Roles
- Seeded roles: `admin`, `user`
- Seeded admin: email from `ADMIN_EMAIL` in `.env` (password defaults to `password`; rotate after first login)
- Admin panel: to be finalized via Filament resources (MenuItems, BusinessHours, SiteBlocks, Reviews, Users)

## Frontend Notes
- CSS: `public/css/styles.css` (dark theme, responsive grid)
- JS: `public/js/main.js` (burger toggle, GSAP intro)
- If Vite build exists (`public/build/manifest.json`), layout will load Vite assets automatically

## Known Decisions & Fixes
- Windows CRLF normalization for deploy (`sed`) + skip shebang line when piping to remote bash
- Auto-detect `APP_DIR` and choose writable `BASE_DIR` to avoid `mkdir(): Permission denied`
- Fallback to copy `public/` if symlink not allowed by host
- Placeholder SVGs to avoid 404s for media assets

## Troubleshooting
- `Permission denied` during composer create-project → host denies write in parent; deploy falls back to `public_html` base
- `#!/usr/bin/env` not found → CRLF; fixed by workflow piping `tail -n +2 | sed -e 's/\r$//'`
- Symlink issues → fallback copy; check `public_html/index.php` rewrites applied

## Security & Rotation
- Rotate Cloudways Master Credentials (password or SSH key)
- Update GitHub Secrets accordingly (`CLOUDWAYS_SSH_KEY` or `CLOUDWAYS_SSH_PASS`)
- Rotate DB creds in `SERVER_ENV` and on server
- Always keep secrets out of repo; use GitHub Secrets or a vault

## Backlog / Next Steps
- [ ] Wire Filament resources (MenuItems, BusinessHours, Reviews moderation, SiteBlocks, Users)
- [ ] Content builder for blocks (json_content)
- [ ] Replace placeholder images with real assets from template archive
- [ ] I18n hooks (optional), improve accessibility and Lighthouse
- [ ] Add more tests (roles/CRUD/forms), CI hardening

## Contact Points (where to look)
- GitHub Actions logs (Deploy to Cloudways) for all deploy steps and errors
- Cloudways SFTP/SSH (Master Credentials) → `~/applications/ygrswjnpmw/public_html`
- Laravel logs: `power_site/storage/logs`
