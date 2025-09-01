#!/bin/bash
set -euo pipefail

echo "🔍 DIAGNOSTIC DEPLOYMENT STARTING..."
echo "====================================="

# Show current location
echo "📍 Current directory: $(pwd)"
echo "👤 User: $(whoami)"
echo "📅 Time: $(date)"

# Ensure we're in the right place
if [ "$(pwd)" = "/home/master/applications/ygrswjnpmw/public_html" ]; then
    echo "✅ Already in public_html, going to parent..."
    cd ..
    echo "📍 Now in: $(pwd)"
fi

# Go to app directory
if [ -d "/home/master/applications/ygrswjnpmw" ]; then
    cd /home/master/applications/ygrswjnpmw
    echo "📍 In app directory: $(pwd)"
fi

# Check what files we have
echo "📋 Files in current directory:"
ls -la

echo ""
echo "📁 Checking assets/design directory..."
if [ -d "assets/design" ]; then
    echo "✅ assets/design found"
    ls -la assets/design/
    
    echo ""
    echo "📦 Checking package.json..."
    if [ -f "assets/design/package.json" ]; then
        echo "✅ package.json found"
        cat assets/design/package.json | grep -E "(name|version|scripts)"
    else
        echo "❌ package.json not found"
    fi
    
    echo ""
    echo "🔧 Checking if Node.js is available..."
    if command -v node &> /dev/null; then
        echo "✅ Node.js found: $(node --version)"
    else
        echo "❌ Node.js not found - this explains why React build failed"
    fi
    
    echo ""
    echo "📦 Checking if npm is available..."
    if command -v npm &> /dev/null; then
        echo "✅ npm found: $(npm --version)"
    else
        echo "❌ npm not found - this explains why React build failed"
    fi
    
    echo ""
    echo "📁 Checking if node_modules exists..."
    if [ -d "assets/design/node_modules" ]; then
        echo "✅ node_modules found"
        ls -la assets/design/node_modules/ | head -5
    else
        echo "❌ node_modules not found - dependencies not installed"
    fi
    
    echo ""
    echo "🔨 Attempting React build for diagnostic..."
    cd assets/design
    
    if command -v npm &> /dev/null; then
        echo "📦 Installing dependencies..."
        npm install --silent
        
        echo "🔨 Building React app..."
        npm run build
        
        if [ -d "dist" ]; then
            echo "✅ Build successful! dist/ directory created"
            ls -la dist/
            
            echo ""
            echo "📄 Content of dist/index.html:"
            head -20 dist/index.html
            
            echo ""
            echo "🔙 Going back to app directory..."
            cd ../..
            
            echo "📄 Copying built files to public_html..."
            cp -r assets/design/dist/* public_html/
            
            echo "✅ React app deployed successfully!"
        else
            echo "❌ Build failed - no dist/ directory created"
            cd ../..
        fi
    else
        echo "❌ npm not available, cannot build React app"
        cd ../..
    fi
else
    echo "❌ assets/design directory not found"
fi

echo ""
echo "📁 Checking public_html contents..."
if [ -d "public_html" ]; then
    echo "✅ public_html directory exists"
    ls -la public_html/
    
    echo ""
    echo "📄 Checking index.html..."
    if [ -f "public_html/index.html" ]; then
        echo "✅ index.html exists"
        echo "📏 File size: $(wc -c < public_html/index.html) bytes"
        echo "📄 First 10 lines:"
        head -10 public_html/index.html
    else
        echo "❌ index.html not found"
    fi
else
    echo "❌ public_html directory not found"
fi

echo ""
echo "🔍 DIAGNOSTIC COMPLETED!"
echo "========================="
echo "Time: $(date)"
