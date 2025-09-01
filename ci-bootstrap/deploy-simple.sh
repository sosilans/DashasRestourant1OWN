#!/bin/bash

# Simple deployment script for Dar'ya's Kitchen
# This script ensures files are properly deployed to public_html

set -euo pipefail

echo "🚀 Starting SIMPLE deployment..."

# Configuration
echo "📋 Configuration:"
echo "  Current directory: $(pwd)"
echo "  User: $(whoami)"
echo "  Date: $(date)"
echo ""

# Navigate to the application directory
echo "📁 Directory navigation:"
if [ "$(pwd)" = "/home/master/applications/ygrswjnpmw/public_html" ]; then
    echo "✅ Already in public_html, moving to parent directory..."
    cd ..
    echo "✅ Now in: $(pwd)"
elif [ -d "/home/master/applications/ygrswjnpmw" ]; then
    echo "✅ Navigating to application directory..."
    cd /home/master/applications/ygrswjnpmw
    echo "✅ Now in: $(pwd)"
else
    echo "⚠️ Working from current directory: $(pwd)"
fi

echo ""

# Check public_html
echo "🌐 Public HTML check:"
if [ -d "public_html" ]; then
    echo "✅ public_html directory exists"
    echo "Contents before deployment:"
    ls -la public_html/ | head -5
else
    echo "❌ public_html directory not found"
    echo "Creating public_html directory..."
    mkdir -p public_html
    echo "✅ public_html directory created"
fi

echo ""

# Create Laravel app if needed
echo "🔍 Laravel app check:"
if [ ! -d "public_html/power_site" ]; then
    echo "❌ Laravel app not found. Creating..."
    
    # Create Laravel app in public_html
    cd public_html
    composer create-project laravel/laravel power_site --prefer-dist --no-interaction || {
        echo "❌ Failed to create Laravel project"
        # Create fallback index.html
        cat > index.html << 'EOF'
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
        exit 0
    }
    cd ..
    echo "✅ Laravel app created in public_html/power_site"
fi

echo ""

# Copy files to webroot
echo "📤 Copying files to webroot..."
if [ -d "public_html/power_site/public" ]; then
    echo "Copying Laravel public files..."
    cp -a public_html/power_site/public/* public_html/ || {
        echo "❌ Failed to copy Laravel files"
        exit 1
    }
    echo "✅ Laravel files copied successfully"
else
    echo "❌ Laravel public directory not found"
    exit 1
fi

echo ""

# Copy any HTML files from root
echo "📄 Copying HTML files..."
if [ -f "emergency-fix.html" ]; then
    cp emergency-fix.html public_html/
    echo "✅ emergency-fix.html copied"
fi

if [ -f "test-fixed-deploy.html" ]; then
    cp test-fixed-deploy.html public_html/
    echo "✅ test-fixed-deploy.html copied"
fi

if [ -f "diagnose-site.html" ]; then
    cp diagnose-site.html public_html/
    echo "✅ diagnose-site.html copied"
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
echo "Files in public_html:"
ls -la public_html/ | head -10

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
    echo "Creating emergency index.html..."
    cat > public_html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Dar'ya's Kitchen - Emergency</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        h1 { color: #e74c3c; }
    </style>
</head>
<body>
    <h1>Dar'ya's Kitchen</h1>
    <p>Emergency page - deployment in progress</p>
</body>
</html>
EOF
    echo "✅ Emergency index.html created"
fi

echo ""

# Final status
echo "🎉 SIMPLE DEPLOYMENT COMPLETED!"
echo "==============================="
echo "Timestamp: $(date)"
echo "Site should be available at: https://phpstack-1511050-5820602.cloudwaysapps.com/"
echo ""

# Create status file
echo "Simple deployment completed at: $(date)" > public_html/deploy-status.txt
echo "✅ Status file created"

