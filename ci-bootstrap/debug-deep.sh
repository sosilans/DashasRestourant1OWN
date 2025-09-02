#!/bin/bash
set -euo pipefail

echo "🔍 DEEP DEBUG: Comprehensive problem diagnosis..."
echo "================================================"

# Show system info
echo "📍 Current directory: $(pwd)"
echo "👤 User: $(whoami)"
echo "📅 Time: $(date)"
echo "🐧 OS: $(uname -a)"
echo "💾 Disk space: $(df -h . | tail -1)"

# Check Node.js and npm
echo ""
echo "📦 NODE.JS DIAGNOSTICS:"
echo "----------------------"
if command -v node >/dev/null 2>&1; then
    echo "✅ Node.js version: $(node --version)"
else
    echo "❌ Node.js not found"
fi

if command -v npm >/dev/null 2>&1; then
    echo "✅ npm version: $(npm --version)"
else
    echo "❌ npm not found"
fi

# Check directories and permissions
echo ""
echo "📁 DIRECTORY STRUCTURE:"
echo "----------------------"
echo "Current directory contents:"
ls -la

echo ""
echo "ci-bootstrap contents:"
if [ -d "ci-bootstrap" ]; then
    ls -la ci-bootstrap/
else
    echo "❌ ci-bootstrap directory not found"
fi

echo ""
echo "improved-template contents:"
if [ -d "improved-template" ]; then
    ls -la improved-template/
    
    echo ""
    echo "📋 improved-template/src contents:"
    if [ -d "improved-template/src" ]; then
        ls -la improved-template/src/
    else
        echo "❌ src directory not found"
    fi
    
    echo ""
    echo "📋 improved-template/package.json:"
    if [ -f "improved-template/package.json" ]; then
        cat improved-template/package.json
    else
        echo "❌ package.json not found"
    fi
    
    echo ""
    echo "📋 improved-template/index.html:"
    if [ -f "improved-template/index.html" ]; then
        cat improved-template/index.html
    else
        echo "❌ index.html not found"
    fi
else
    echo "❌ improved-template directory not found"
fi

echo ""
echo "public_html contents:"
if [ -d "public_html" ]; then
    ls -la public_html/
    
    echo ""
    echo "📋 public_html/index.html (first 20 lines):"
    if [ -f "public_html/index.html" ]; then
        head -20 public_html/index.html
    else
        echo "❌ index.html not found in public_html"
    fi
else
    echo "❌ public_html directory not found"
fi

# Check environment variables
echo ""
echo "🔧 ENVIRONMENT VARIABLES:"
echo "------------------------"
echo "PATH: $PATH"
echo "NODE_ENV: ${NODE_ENV:-not set}"
echo "HOME: $HOME"

# Check file permissions
echo ""
echo "🔐 FILE PERMISSIONS:"
echo "-------------------"
if [ -d "improved-template" ]; then
    echo "improved-template permissions:"
    ls -ld improved-template/
    
    if [ -f "improved-template/package.json" ]; then
        echo "package.json permissions:"
        ls -l improved-template/package.json
    fi
    
    if [ -f "improved-template/index.html" ]; then
        echo "index.html permissions:"
        ls -l improved-template/index.html
    fi
fi

# Test npm commands
echo ""
echo "🧪 NPM COMMAND TESTS:"
echo "-------------------"
if [ -d "improved-template" ] && [ -f "improved-template/package.json" ]; then
    cd improved-template
    
    echo "Testing npm install..."
    if npm install --dry-run >/dev/null 2>&1; then
        echo "✅ npm install dry-run successful"
    else
        echo "❌ npm install dry-run failed"
    fi
    
    echo "Testing npm run build..."
    if npm run build --dry-run >/dev/null 2>&1; then
        echo "✅ npm run build dry-run successful"
    else
        echo "❌ npm run build dry-run failed"
    fi
    
    cd ..
else
    echo "⚠️ Cannot test npm commands - improved-template not ready"
fi

echo ""
echo "🔍 DEEP DEBUG COMPLETED!"
echo "========================"
echo "Time: $(date)"
