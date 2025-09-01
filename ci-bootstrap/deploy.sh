#!/bin/bash

# Enhanced deployment script for Dar'ya's Kitchen
# This script ensures all files are properly updated and cached

set -e

echo "🚀 Starting deployment..."

# Navigate to the application directory
cd ~/applications/ygrswjnpmw

echo "📁 Current directory: $(pwd)"

# Check if power_site exists, if not, create Laravel app
if [ ! -d "power_site" ]; then
    echo "❌ power_site not found. Creating Laravel application..."
    
    # Create Laravel app
    composer create-project laravel/laravel power_site --prefer-dist --no-interaction
    
    # Install required packages
    cd power_site
    composer require laravel/socialite spatie/laravel-permission filament/filament spatie/laravel-csp bepsvpt/secure-headers mews/purifier
    composer require laravel/breeze --dev
    
    # Install Breeze
    php artisan breeze:install blade
    
    # Install Node dependencies and build
    npm ci || npm i
    npm run build
    
    # Publish permission migrations
    php artisan vendor:publish --provider="Spatie\\Permission\\PermissionServiceProvider"
    
    cd ..
    
    echo "✅ Laravel application created successfully"
fi

# Skip git pull since we're deploying from GitHub Actions
echo "⬇️  Skipping git pull - deploying from GitHub Actions..."

# Ensure power_site is up to date
echo "🔄 Updating power_site..."
# Copy overlay files from ci-bootstrap to power_site
if [ -d "ci-bootstrap" ]; then
    cp -a ci-bootstrap/* power_site/ 2>/dev/null || echo "Some overlay files copied"
fi

# Force refresh public_html from power_site/public
echo "🌐 Updating public_html..."
if [ -L "public_html" ]; then
    echo "Removing existing symlink..."
    rm public_html
fi

# Copy all files from power_site/public to public_html
echo "Copying files to public_html..."
cp -a power_site/public/* public_html/

# Force refresh CSS and JS directories with touch
echo "🎨 Force refreshing CSS and JS..."
find public_html/css -type f -exec touch {} \;
find public_html/js -type f -exec touch {} \;

# Ensure proper permissions
echo "🔐 Setting permissions..."
chmod -R 755 public_html
chmod 644 public_html/*.html
chmod 644 public_html/*.php

# Clear any potential caches
echo "🧹 Clearing caches..."
if [ -d "power_site/storage/framework/cache" ]; then
    rm -rf power_site/storage/framework/cache/*
fi

if [ -d "power_site/storage/framework/views" ]; then
    rm -rf power_site/storage/framework/views/*
fi

# Verify deployment
echo "✅ Verifying deployment..."
echo "Files in public_html:"
ls -la public_html/ | head -10

# Create test admin user
echo "🔐 Creating test admin user..."
if [ -f "create-admin.sh" ]; then
    chmod +x create-admin.sh
    ./create-admin.sh
else
    echo "⚠️  create-admin.sh not found, skipping admin creation"
fi

echo "CSS files:"
ls -la public_html/css/

echo "JS files:"
ls -la public_html/js/

echo "HTML files:"
ls -la public_html/*.html

# Check if index.html exists and has content
if [ -f "public_html/index.html" ]; then
    echo "📄 index.html exists with size: $(wc -c < public_html/index.html) bytes"
    echo "First few lines:"
    head -5 public_html/index.html
else
    echo "❌ index.html not found!"
    exit 1
fi

echo "🎉 Deployment completed successfully!"
echo "🌍 Site should be available at: https://phpstack-1511050-5820602.cloudwaysapps.com/"
echo "⏰ Deployment timestamp: $(date)"

