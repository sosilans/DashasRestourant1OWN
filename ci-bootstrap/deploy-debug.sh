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
echo "  Current directory: $(pwd)"
echo ""

# Check if we're in the right directory
echo "📁 Directory check:"
if [ -d "$APP_PATH" ]; then
    echo "✅ App directory exists: $APP_PATH"
    cd "$APP_PATH"
    echo "✅ Changed to app directory: $(pwd)"
elif [ "$(pwd)" = "/home/master/applications/ygrswjnpmw/public_html" ]; then
    echo "✅ Already in public_html directory: $(pwd)"
    echo "✅ Moving to parent directory..."
    cd ..
    echo "✅ Now in: $(pwd)"
else
    echo "❌ App directory not found: $APP_PATH"
    echo "Current directory: $(pwd)"
    echo "Available directories:"
    ls -la ~/applications/ 2>/dev/null || echo "No applications directory found"
    echo "Trying to work from current directory..."
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
elif [ -d "public_html/power_site" ]; then
    echo "✅ power_site directory exists in public_html"
    if [ -f "public_html/power_site/artisan" ]; then
        echo "✅ Laravel artisan found in public_html"
    else
        echo "❌ Laravel artisan not found in public_html"
    fi
else
    echo "❌ power_site directory not found"
    echo "Creating Laravel application in public_html..."
    
    # Check if composer is available
    if ! command -v composer >/dev/null 2>&1; then
        echo "❌ Composer not found. Installing..."
        curl -sS https://getcomposer.org/installer | php
        sudo mv composer.phar /usr/local/bin/composer
    fi
    
    # Create Laravel app in public_html where we have write permissions
    echo "Creating Laravel project in public_html..."
    cd public_html
    composer create-project laravel/laravel power_site --prefer-dist --no-interaction || {
        echo "❌ Failed to create Laravel project in public_html"
        exit 1
    }
    cd ..
    
    echo "✅ Laravel application created in public_html/power_site"
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

# First, ensure we have a working Laravel structure
if [ -d "public_html/power_site" ]; then
    echo "✅ Laravel app found in public_html/power_site"
    
    # Install Laravel dependencies if needed
    if [ ! -f "public_html/power_site/vendor/autoload.php" ]; then
        echo "📦 Installing Laravel dependencies..."
        cd public_html/power_site
        composer install --no-dev --optimize-autoloader || {
            echo "❌ Failed to install dependencies"
            exit 1
        }
        cd ../..
    fi
    
    # Ensure .env file exists
    if [ ! -f "public_html/power_site/.env" ]; then
        echo "📝 Creating .env file..."
        cd public_html/power_site
        if [ -f ".env.example" ]; then
            cp .env.example .env
        else
            # Create basic .env file
            cat > .env << 'EOF'
APP_NAME="Dar'ya's Kitchen"
APP_ENV=production
APP_KEY=
APP_DEBUG=false
APP_URL=https://phpstack-1511050-5820602.cloudwaysapps.com

LOG_CHANNEL=stack
LOG_LEVEL=info

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=
DB_USERNAME=
DB_PASSWORD=

FILESYSTEM_DISK=public
QUEUE_CONNECTION=database
SESSION_DRIVER=file
SESSION_LIFETIME=120
EOF
        fi
        
        # Generate app key if not set
        if ! grep -q "APP_KEY=base64:" .env; then
            echo "🔑 Generating application key..."
            php artisan key:generate --force || echo "⚠️ Key generation failed"
        fi
        
        cd ../..
    fi
    
    # Copy Laravel public files to webroot
    if [ -d "public_html/power_site/public" ]; then
        echo "Copying Laravel public files to webroot..."
        cp -a public_html/power_site/public/* public_html/ || {
            echo "❌ Failed to copy Laravel files"
            exit 1
        }
        echo "✅ Laravel files copied successfully"
    else
        echo "❌ Laravel public directory not found"
        exit 1
    fi
    
elif [ -d "power_site/public" ]; then
    echo "Copying from power_site/public to public_html..."
    cp -a power_site/public/* public_html/ || {
        echo "❌ Failed to copy files"
        exit 1
    }
    echo "✅ Files copied successfully"
else
    echo "❌ No Laravel public directory found"
    echo "Available directories:"
    ls -la power_site/ 2>/dev/null || echo "No power_site directory"
    ls -la public_html/power_site/ 2>/dev/null || echo "No public_html/power_site directory"
    
    # Create a basic index.html as fallback
    echo "Creating fallback index.html..."
    cat > public_html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Dar'ya's Kitchen - Under Construction</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        h1 { color: #e74c3c; }
    </style>
</head>
<body>
    <h1>Dar'ya's Kitchen</h1>
    <p>Website is under construction. Please check back soon!</p>
</body>
</html>
EOF
    echo "✅ Fallback index.html created"
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
