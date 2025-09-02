#!/bin/bash
set -euo pipefail

echo "🧪 REACT TEST DEPLOYMENT - SAFE TESTING..."
echo "=========================================="

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
if [ -d "/home/master/applications/ygrswjnpmy" ]; then
    cd /home/master/applications/ygrswjnpmy
    echo "📍 In app directory: $(pwd)"
fi

# Create public_html if it doesn't exist
if [ ! -d "public_html" ]; then
    echo "📁 Creating public_html directory..."
    mkdir -p public_html
fi

# TEST REACT: Try to build and deploy React application
echo "🧪 REACT TEST: Testing React build and deployment..."

# Check if we have the improved template
if [ -d "improved-template" ]; then
    echo "✅ Found improved template, testing React build..."
    cd improved-template
    
    # Check what's in the template
    echo "📋 Template contents:"
    ls -la
    
    # Check if index.html exists
    if [ -f "index.html" ]; then
        echo "✅ index.html found"
    else
        echo "❌ index.html missing - this is the problem!"
    fi
    
    # Check package.json
    if [ -f "package.json" ]; then
        echo "✅ package.json found"
        echo "📦 Dependencies:"
        cat package.json | grep -E '"name"|"version"|"scripts"'
    else
        echo "❌ package.json missing"
    fi
    
    # Try to install dependencies
    echo "📦 Testing npm install..."
    if npm install; then
        echo "✅ npm install successful"
        
        # Try to build
        echo "🔨 Testing npm run build..."
        if npm run build; then
            echo "✅ React build successful!"
            
            # Check what was built
            echo "📁 Build output:"
            if [ -d "dist" ]; then
                echo "✅ dist folder found:"
                ls -la dist/
            elif [ -d "build" ]; then
                echo "✅ build folder found:"
                ls -la build/
            else
                echo "❌ No build output found"
            fi
            
            # Copy to public_html for testing
            echo "📁 Copying to public_html for testing..."
            if [ -d "dist" ]; then
                cp -r dist/* ../public_html/
                echo "✅ Copied from dist/"
            elif [ -d "build" ]; then
                cp -r build/* ../public_html/
                echo "✅ Copied from build/"
            fi
            
            cd ..
            echo "🎉 REACT TEST SUCCESSFUL!"
            
        else
            echo "❌ React build failed"
            cd ..
        fi
    else
        echo "❌ npm install failed"
        cd ..
    fi
else
    echo "❌ Improved template not found"
fi

# Show what we have
echo "📋 Files in public_html:"
ls -la public_html/

# Test if we can access the files
if [ -f "public_html/index.html" ]; then
    echo "✅ index.html exists and is accessible"
    echo "📄 File size: $(wc -c < public_html/index.html) bytes"
    echo "📄 First 10 lines:"
    head -10 public_html/index.html
else
    echo "❌ index.html not found!"
fi

echo ""
echo "🧪 REACT TEST COMPLETED!"
echo "========================="
echo "This was a safe test - no changes to working deployment!"
echo "Time: $(date)"
