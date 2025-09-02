# Cursor Guardrails for this Template

This repo is a Vite + React static frontend intended to deploy to PHP/Cloudways as static files.

## Do / Don't
- DO keep `vite.config.ts` with `base: './'` for portable asset paths.
- DO put any Apache rewrite rules in `public/.htaccess` (copied to `build/`).
- DO use `npm run build` to produce `build/`.
- DON'T try to run Node server on Cloudways PHP—deploy the static `build/` only.
- DON'T move files out of `build/` on deploy—upload `index.html`, `assets/`, and `.htaccess` together.

## Node / Tooling
- Node 20.x recommended (see `.nvmrc`).
- Commands: `npm ci` → `npm run build`.

## Backend integration
- For forms/API, point fetch/axios to your PHP endpoints (absolute URLs).
- Keep frontend static; backend serves JSON (no SSR needed).

## Subfolder deploys
- Works from any subfolder because `base: './'`. If deep-link refresh returns 404, check `.htaccess` and `RewriteBase`.

## Artifacts
- `build/` is disposable and re-generated on each build. Do not edit by hand.

See `DEPLOY_CLOUDWAYS.md` for detailed deployment steps.
