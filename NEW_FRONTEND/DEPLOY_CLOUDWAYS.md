# Deploying this Vite React template to PHP/Cloudways

This project is a static Vite + React app. You do NOT need Node.js on the server at runtime—only to build locally.

## Build
- Node: 20.x (see `.nvmrc`)
- Commands:
  - `npm ci` (or `npm i`)
  - `npm run build`
- Output: `build/`

Vite config uses `base: './'` so all asset paths are relative. This makes the build portable in root or any subfolder.

## What to upload
Upload the CONTENTS of `build/` (not the folder itself) to your web root:
- Root site: `public_html/`
- Subfolder (e.g. /italian): `public_html/italian/`

This repo includes `public/.htaccess` which is copied to `build/.htaccess` to enable SPA routing on Apache (Cloudways). If you deploy into a subfolder, you can optionally set `RewriteBase` inside `.htaccess`:

```
# Example for /italian/
RewriteBase /italian/
```

## SPA routing
The `.htaccess` sends unknown routes to `index.html` so React Router (or client-side routing) works with deep links.

## Common pitfalls
- Do not change `base` in `vite.config.ts` unless you know you need an absolute path. Relative `./` is safest for PHP hosting.
- Always upload `.htaccess` with `index.html` and `assets/`.
- If you see 404s on refresh, your `.htaccess` wasn’t uploaded or Apache overrides are disabled.

## Quick verify
1) Build locally: `npm run build`
2) Open `build/index.html` in a simple static server OR upload to Cloudways
3) Test:
   - Home page loads
   - Navigate to another route and refresh (should not 404)

## Updating
- Rebuild locally, then re-upload the new `build/` contents. No server restarts required.

---

If you need a ZIP for transfer, create it (Windows PowerShell):

```
Compress-Archive -Path .\build\* -DestinationPath .\build_portable.zip -Force
```
