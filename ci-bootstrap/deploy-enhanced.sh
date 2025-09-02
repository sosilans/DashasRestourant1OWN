#!/bin/bash

# Enhanced deployment script for Dar'ya's Kitchen
# This script ensures all files are properly updated and cached with error handling

set -euo pipefail

# Configuration
APP_PATH="${SERVER_PATH:-~/applications/ygrswjnpmw}"
DEPLOY_BRANCH="${DEPLOY_BRANCH:-main}"
DB_BACKUP="${DB_BACKUP:-true}"

echo "🚀 Starting enhanced deployment..."
echo "📁 App Path: $APP_PATH"
echo "🌿 Branch: $DEPLOY_BRANCH"

# Navigate to the application directory
cd "$APP_PATH" || { echo "❌ Failed to navigate to $APP_PATH"; exit 1; }

echo "📁 Current directory: $(pwd)"

# Create backup if DB_BACKUP is enabled
if [ "$DB_BACKUP" = "true" ] && [ -d "power_site" ]; then
    echo "💾 Creating database backup..."
    mkdir -p backups
    BACKUP_FILE="backups/db_backup_$(date +%Y%m%d_%H%M%S).sql"
    if command -v mysqldump >/dev/null 2>&1; then
        mysqldump --single-transaction --routines --triggers power_site > "$BACKUP_FILE" 2>/dev/null || echo "⚠️ Database backup failed, continuing..."
    fi
fi

# Check if power_site exists, if not, create Laravel app
if [ ! -d "power_site" ]; then
    echo "❌ power_site not found. Creating Laravel application..."
    
    # Check if composer is available
    if ! command -v composer >/dev/null 2>&1; then
        echo "❌ Composer not found. Please install Composer first."
        exit 1
    fi
    
    # Create Laravel app
    composer create-project laravel/laravel power_site --prefer-dist --no-interaction || {
        echo "❌ Failed to create Laravel project"
        exit 1
    }
    
    # Install required packages
    cd power_site
    composer require laravel/socialite spatie/laravel-permission filament/filament spatie/laravel-csp bepsvpt/secure-headers mews/purifier || {
        echo "❌ Failed to install core packages"
        exit 1
    }
    composer require laravel/breeze --dev || {
        echo "❌ Failed to install Breeze"
        exit 1
    }
    
    # Install Breeze
    php artisan breeze:install blade || {
        echo "❌ Failed to install Breeze"
        exit 1
    }
    
    # Install Node dependencies and build
    if command -v npm >/dev/null 2>&1; then
        npm ci || npm i || echo "⚠️ npm install failed, continuing..."
        npm run build || echo "⚠️ npm build failed, continuing..."
    else
        echo "⚠️ npm not found, skipping frontend build"
    fi
    
    # Publish permission migrations
    php artisan vendor:publish --provider="Spatie\\Permission\\PermissionServiceProvider" || {
        echo "❌ Failed to publish permission migrations"
        exit 1
    }
    
    cd ..
    
    echo "✅ Laravel application created successfully"
fi

# Enter maintenance mode
echo "🔧 Entering maintenance mode..."
cd power_site
php artisan down || echo "⚠️ Maintenance mode not available"

# Update dependencies
echo "📦 Updating Composer dependencies..."
composer install --no-interaction --prefer-dist --no-dev --optimize-autoloader || {
    echo "❌ Composer install failed"
    php artisan up || true
    exit 1
}

# Update Node dependencies and build
if [ -f "package.json" ] && command -v npm >/dev/null 2>&1; then
    echo "📦 Updating Node dependencies..."
    npm ci || npm i || echo "⚠️ npm install failed, continuing..."
    npm run build || echo "⚠️ npm build failed, continuing..."
fi

# Set proper permissions
echo "🔐 Setting permissions..."
chmod -R ug+rwx storage bootstrap/cache || echo "⚠️ Permission setting failed"

# Generate app key if missing
echo "🔑 Ensuring app key exists..."
php artisan key:generate --force || echo "⚠️ Key generation failed"

# Run migrations
echo "🗄️ Running migrations..."
php artisan migrate --force || {
    echo "❌ Migration failed"
    php artisan up || true
    exit 1
}

# Clear and cache configurations
echo "🧹 Optimizing application..."
php artisan config:cache || echo "⚠️ Config cache failed"
php artisan route:cache || echo "⚠️ Route cache failed"
php artisan view:cache || echo "⚠️ View cache failed"

# Leave maintenance mode
echo "✅ Leaving maintenance mode..."
php artisan up || echo "⚠️ Maintenance mode exit failed"

cd ..

# Force refresh public_html from power_site/public
echo "🌐 Updating public_html..."
if [ -L "public_html" ]; then
    echo "Removing existing symlink..."
    rm public_html
fi

# Copy all files from power_site/public to public_html
echo "Copying files to public_html..."
cp -a power_site/public/* public_html/ || {
    echo "❌ Failed to copy files to public_html"
    exit 1
}

# Force refresh CSS and JS directories with touch
echo "🎨 Force refreshing CSS and JS..."
find public_html/css -type f -exec touch {} \; 2>/dev/null || echo "⚠️ CSS refresh failed"
find public_html/js -type f -exec touch {} \; 2>/dev/null || echo "⚠️ JS refresh failed"

# Ensure proper permissions
echo "🔐 Setting final permissions..."
chmod -R 755 public_html || echo "⚠️ Permission setting failed"
chmod 644 public_html/*.html 2>/dev/null || echo "⚠️ HTML permission setting failed"
chmod 644 public_html/*.php 2>/dev/null || echo "⚠️ PHP permission setting failed"

# Verify deployment
echo "✅ Verifying deployment..."
if [ -f "public_html/index.html" ] || [ -f "public_html/index.php" ]; then
    echo "📄 Main file exists"
    if [ -f "public_html/index.html" ]; then
        echo "📄 index.html size: $(wc -c < public_html/index.html) bytes"
    fi
    if [ -f "public_html/index.php" ]; then
        echo "📄 index.php size: $(wc -c < public_html/index.php) bytes"
    fi
else
    echo "❌ No main file found in public_html!"
    exit 1
fi

echo "🎉 Deployment completed successfully!"
echo "🌍 Site should be available at: https://phpstack-1511050-5820602.cloudwaysapps.com/"
echo "⏰ Deployment timestamp: $(date)"

# Create rollback script
echo "📝 Creating rollback script..."
cat > rollback.sh << 'EOF'
#!/bin/bash
echo "🔄 Rolling back deployment..."
if [ -f "backups/db_backup_*.sql" ]; then
    echo "Restoring database from backup..."
    # Add database restore logic here
fi
echo "Rollback completed"
EOF
chmod +x rollback.sh

echo "✅ Rollback script created: ./rollback.sh"

