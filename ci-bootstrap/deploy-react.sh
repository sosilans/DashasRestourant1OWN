#!/bin/bash
set -euo pipefail

echo "🚀 REACT DEPLOYMENT STARTING..."
echo "=================================="

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

# Create public_html if it doesn't exist
if [ ! -d "public_html" ]; then
    echo "📁 Creating public_html directory..."
    mkdir -p public_html
fi

# Check if React project exists
if [ -d "assets/design" ]; then
    echo "⚛️ React project found, building..."
    cd assets/design
    
    # Install dependencies if needed
    if [ ! -d "node_modules" ]; then
        echo "📦 Installing dependencies..."
        npm ci || npm install
    fi
    
    # Build React app
    echo "🔨 Building React application..."
    npm run build
    
    # Check if build was successful
    if [ -d "dist" ]; then
        echo "✅ Build successful, copying files..."
        
        # Go back to app directory
        cd ../..
        
        # Copy built files to public_html
        echo "📄 Copying built files to public_html..."
        cp -r assets/design/dist/* public_html/
        
        echo "✅ React app deployed successfully!"
    else
        echo "❌ Build failed, falling back to minimal deploy..."
        cd ../..
        
        # Fallback to minimal deploy
        if [ -f "final-test.html" ]; then
            cp final-test.html public_html/index.html
        fi
    fi
else
    echo "⚠️ React project not found, using minimal deploy..."
    
    # Copy HTML files as fallback
    for file in *.html; do
        if [ -f "$file" ]; then
            echo "Copying $file..."
            cp "$file" public_html/
        fi
    done
    
    # Create index.html if none exists
    if [ ! -f "public_html/index.html" ]; then
        echo "📝 Creating simple index.html..."
        cat > public_html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Dar'ya's Kitchen</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            text-align: center; 
            padding: 50px; 
            background: #f0f0f0;
        }
        h1 { color: #e74c3c; }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🍝 Dar'ya's Kitchen</h1>
        <p>Welcome to our Italian restaurant!</p>
        <p>Website is being updated. Please check back soon.</p>
        <p><small>Deployed: $(date)</small></p>
    </div>
</body>
</html>
EOF
    fi
fi

# Set permissions
echo "🔐 Setting permissions..."
chmod -R 755 public_html
chmod 644 public_html/*.html 2>/dev/null || true

# Show what we have
echo "📋 Files in public_html:"
ls -la public_html/

# Test if we can access the files
if [ -f "public_html/index.html" ]; then
    echo "✅ index.html exists and is accessible"
    echo "📄 File size: $(wc -c < public_html/index.html) bytes"
else
    echo "❌ index.html not found!"
fi

echo ""
echo "🎉 REACT DEPLOYMENT COMPLETED!"
echo "================================"
echo "Site should be available at: https://phpstack-1511050-5820602.cloudwaysapps.com/"
echo "Time: $(date)"
