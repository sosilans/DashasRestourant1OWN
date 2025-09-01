#!/bin/bash

# Debug deployment script for Dar'ya's Kitchen
# This script provides detailed diagnostics and error handling

set -euo pipefail

echo "🔍 DEBUG DEPLOYMENT SCRIPT"
echo "=========================="
echo "Timestamp: $(date)"
echo "User: $(whoami)"
echo "Working directory: $(pwd)"
echo ""

# Configuration
APP_PATH="${SERVER_PATH:-~/applications/ygrswjnpmw}"
DEPLOY_BRANCH="${DEPLOY_BRANCH:-main}"

echo "📋 Configuration:"
echo "  APP_PATH: $APP_PATH"
echo "  DEPLOY_BRANCH: $DEPLOY_BRANCH"
echo ""

# Check if we're in the right directory
echo "📁 Directory check:"
if [ -d "$APP_PATH" ]; then
    echo "✅ App directory exists: $APP_PATH"
    cd "$APP_PATH"
    echo "✅ Changed to app directory: $(pwd)"
else
    echo "❌ App directory not found: $APP_PATH"
    echo "Available directories:"
    ls -la ~/applications/ 2>/dev/null || echo "No applications directory found"
    exit 1
fi

echo ""

# Check disk space
echo "💾 Disk space check:"
df -h . | head -2
echo ""

# Check if power_site exists
echo "🔍 Laravel app check:"
if [ -d "power_site" ]; then
    echo "✅ power_site directory exists"
    if [ -f "power_site/artisan" ]; then
        echo "✅ Laravel artisan found"
    else
        echo "❌ Laravel artisan not found"
    fi
else
    echo "❌ power_site directory not found"
    echo "Creating Laravel application..."
    
    # Check if composer is available
    if ! command -v composer >/dev/null 2>&1; then
        echo "❌ Composer not found. Installing..."
        curl -sS https://getcomposer.org/installer | php
        sudo mv composer.phar /usr/local/bin/composer
    fi
    
    # Create Laravel app
    echo "Creating Laravel project..."
    composer create-project laravel/laravel power_site --prefer-dist --no-interaction || {
        echo "❌ Failed to create Laravel project"
        exit 1
    }
    
    echo "✅ Laravel application created"
fi

echo ""

# Check public_html
echo "🌐 Public HTML check:"
if [ -d "public_html" ]; then
    echo "✅ public_html directory exists"
    echo "Contents:"
    ls -la public_html/ | head -5
else
    echo "❌ public_html directory not found"
    echo "Creating public_html directory..."
    mkdir -p public_html
    echo "✅ public_html directory created"
fi

echo ""

# Deploy files
echo "📤 Deploying files..."
if [ -d "power_site/public" ]; then
    echo "Copying from power_site/public to public_html..."
    cp -a power_site/public/* public_html/ || {
        echo "❌ Failed to copy files"
        exit 1
    }
    echo "✅ Files copied successfully"
else
    echo "❌ power_site/public not found"
    exit 1
fi

echo ""

# Set permissions
echo "🔐 Setting permissions..."
chmod -R 755 public_html || echo "⚠️ Permission setting failed"
chmod 644 public_html/*.html 2>/dev/null || echo "⚠️ HTML permission setting failed"
chmod 644 public_html/*.php 2>/dev/null || echo "⚠️ PHP permission setting failed"
echo "✅ Permissions set"

echo ""

# Verify deployment
echo "✅ Verifying deployment..."
if [ -f "public_html/index.html" ] || [ -f "public_html/index.php" ]; then
    echo "✅ Main file exists"
    if [ -f "public_html/index.html" ]; then
        echo "📄 index.html size: $(wc -c < public_html/index.html) bytes"
    fi
    if [ -f "public_html/index.php" ]; then
        echo "📄 index.php size: $(wc -c < public_html/index.php) bytes"
    fi
else
    echo "❌ No main file found in public_html!"
    echo "Contents of public_html:"
    ls -la public_html/
    exit 1
fi

echo ""

# Test file check
echo "🧪 Test file check:"
if [ -f "public_html/test-deploy-file.html" ]; then
    echo "✅ Test file found: test-deploy-file.html"
    echo "📄 Test file size: $(wc -c < public_html/test-deploy-file.html) bytes"
else
    echo "❌ Test file not found"
fi

echo ""

# Final status
echo "🎉 DEPLOYMENT COMPLETED SUCCESSFULLY!"
echo "====================================="
echo "Timestamp: $(date)"
echo "Site should be available at: https://phpstack-1511050-5820602.cloudwaysapps.com/"
echo "Test file: https://phpstack-1511050-5820602.cloudwaysapps.com/test-deploy-file.html"
echo ""

# Create status file
echo "Deployment completed at: $(date)" > public_html/deploy-status.txt
echo "✅ Status file created"
