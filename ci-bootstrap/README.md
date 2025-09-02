# Power Site (Laravel) — Bootstrap Overlay

This folder provides overlay files that the GitHub Action copies into the generated Laravel app in `power_site/`.

- `README-app.md`: Setup and Cloudways notes
- `.env.example`: Environment variables template (no secrets)
- `deploy.sh`: Deployment script for Cloudways

After the first push to `main`, the workflow `Bootstrap Laravel` will:

1. Create Laravel 11 in `power_site/`.
2. Install Breeze (Blade), Socialite, spatie/permission, Filament, CSP, Secure Headers, HTMLPurifier.
3. Build frontend assets (Vite).
4. Publish permission migrations.
5. Copy these overlay files.
6. Commit everything back to `main`.
