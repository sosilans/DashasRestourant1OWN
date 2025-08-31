# HANDOFF_PRIVATE (Template)

This file is a template for private operational data.
Do NOT commit the filled version. Store securely (password manager or encrypted vault).

## GitHub Secrets (values)
- CLOUDWAYS_SSH_HOST: <IP>
- CLOUDWAYS_SSH_USER: <master_user>
- CLOUDWAYS_SSH_PASS: <password> (if not using SSH key)
- CLOUDWAYS_SSH_KEY: <OpenSSH private key PEM> (if using key)
- CLOUDWAYS_APP_DIR: ~/applications/ygrswjnpmw/public_html
- SERVER_ENV: (paste full .env contents)

## .env (paste here for reference)
APP_NAME="Daria's Italian Kitchen"
APP_ENV=production
APP_KEY=<generated_on_server>
APP_DEBUG=false
APP_URL=https://phpstack-1511050-5820602.cloudwaysapps.com

LOG_CHANNEL=stack
LOG_LEVEL=info

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=<db_name>
DB_USERNAME=<db_user>
DB_PASSWORD=<db_password>

FILESYSTEM_DISK=public
QUEUE_CONNECTION=database
SESSION_DRIVER=file
SESSION_LIFETIME=120

GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=
GOOGLE_REDIRECT_URI=${APP_URL}/auth/google/callback

APPLE_CLIENT_ID=
APPLE_CLIENT_SECRET=
APPLE_REDIRECT_URI=${APP_URL}/auth/apple/callback

ADMIN_EMAIL=<admin_email>

SECURE_HEADERS_ENABLED=true
CSP_ENABLED=true
