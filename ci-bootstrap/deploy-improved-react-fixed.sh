#!/bin/bash
set -euo pipefail

echo "🚀 IMPROVED REACT DEPLOYMENT - FIXED VERSION..."
echo "=============================================="

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

# IMPROVED REACT: Build and deploy improved React application
echo "🚀 IMPROVED REACT: Building and deploying improved React application..."

# Check if we have the improved template
if [ -d "improved-template" ]; then
    echo "✅ Found improved template, building React app..."
    cd improved-template
    
    # Check if index.html exists
    if [ ! -f "index.html" ]; then
        echo "❌ index.html missing - creating it..."
        cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dar'ya's Kitchen - Authentic Italian Cuisine</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>
EOF
        echo "✅ index.html created"
    fi
    
    # Install dependencies if needed
    if [ ! -d "node_modules" ]; then
        echo "📦 Installing dependencies..."
        npm install
    else
        echo "✅ Dependencies already installed"
    fi
    
    # Build the React application
    echo "🔨 Building React application..."
    if npm run build; then
        echo "✅ React build successful!"
        
        # Check what was built
        if [ -d "dist" ]; then
            echo "✅ Found dist folder, copying files..."
            cp -r dist/* ../public_html/
            echo "✅ React build files copied from dist/"
        elif [ -d "build" ]; then
            echo "✅ Found build folder, copying files..."
            cp -r build/* ../public_html/
            echo "✅ React build files copied from build/"
        else
            echo "❌ No build output found"
            cd ..
            echo "⚠️ React build failed, creating enhanced HTML version..."
        fi
        
        cd ..
        
        if [ -f "public_html/index.html" ] && [ -s "public_html/index.html" ]; then
            echo "🎉 React app deployed successfully!"
            echo "📄 Final index.html size: $(wc -c < public_html/index.html) bytes"
            exit 0
        else
            echo "⚠️ React files not properly copied, creating HTML fallback..."
        fi
    else
        echo "❌ React build failed"
        cd ..
        echo "⚠️ React build failed, creating enhanced HTML version..."
    fi
else
    echo "⚠️ Improved template not found, creating enhanced HTML version..."
fi

# Create enhanced HTML with working steam animation
echo "🎨 Creating enhanced HTML version with steam animation..."
cat > public_html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dar'ya's Kitchen - Authentic Italian Cuisine</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Georgia', serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        
        .hero-container {
            text-align: center;
            max-width: 800px;
            padding: 2rem;
            position: relative;
        }
        
        .hero-title {
            font-size: 3.5rem;
            color: #2c3e50;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            animation: fadeInUp 1s ease-out;
        }
        
        .hero-subtitle {
            font-size: 1.5rem;
            color: #7f8c8d;
            margin-bottom: 2rem;
            animation: fadeInUp 1s ease-out 0.3s both;
        }
        
        .pizza-container {
            position: relative;
            margin: 3rem auto;
            width: 300px;
            height: 300px;
            animation: fadeInUp 1s ease-out 0.6s both;
        }
        
        .pizza {
            width: 100%;
            height: 100%;
            position: relative;
        }
        
        .pizza-base {
            fill: #f39c12;
            filter: drop-shadow(0 4px 8px rgba(0,0,0,0.2));
        }
        
        .pizza-crust {
            fill: #e67e22;
        }
        
        .pizza-sauce {
            fill: #e74c3c;
        }
        
        .pizza-cheese {
            fill: #f1c40f;
        }
        
        .pizza-toppings {
            fill: #27ae60;
        }
        
        .steam-container {
            position: absolute;
            top: -20px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 60px;
            pointer-events: none;
        }
        
        .steam {
            position: absolute;
            width: 8px;
            height: 20px;
            background: linear-gradient(to top, rgba(255,255,255,0.8), rgba(255,255,255,0.2));
            border-radius: 4px;
            animation: steamRise 3s infinite ease-out;
        }
        
        .steam:nth-child(1) {
            left: 20px;
            animation-delay: 0s;
        }
        
        .steam:nth-child(2) {
            left: 40px;
            animation-delay: 0.5s;
        }
        
        .steam:nth-child(3) {
            left: 60px;
            animation-delay: 1s;
        }
        
        .steam:nth-child(4) {
            left: 80px;
            animation-delay: 1.5s;
        }
        
        @keyframes steamRise {
            0% {
                opacity: 0;
                transform: translateY(0) scale(1);
            }
            20% {
                opacity: 1;
                transform: translateY(-10px) scale(1.2);
            }
            80% {
                opacity: 0.5;
                transform: translateY(-30px) scale(0.8);
            }
            100% {
                opacity: 0;
                transform: translateY(-40px) scale(0.6);
            }
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .cta-button {
            display: inline-block;
            padding: 1rem 2rem;
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-size: 1.2rem;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
            animation: fadeInUp 1s ease-out 0.9s both;
        }
        
        .cta-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(231, 76, 60, 0.4);
            background: linear-gradient(45deg, #c0392b, #e74c3c);
        }
        
        .cta-button:active {
            transform: translateY(0);
        }
        
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1.2rem;
            }
            
            .pizza-container {
                width: 250px;
                height: 250px;
            }
        }
    </style>
</head>
<body>
    <div class="hero-container">
        <h1 class="hero-title">Dar'ya's Kitchen</h1>
        <p class="hero-subtitle">Authentic Italian Cuisine Made with Love</p>
        
        <div class="pizza-container">
            <div class="steam-container">
                <div class="steam"></div>
                <div class="steam"></div>
                <div class="steam"></div>
                <div class="steam"></div>
            </div>
            
            <svg class="pizza" viewBox="0 0 100 100">
                <!-- Pizza base -->
                <circle class="pizza-base" cx="50" cy="50" r="45"/>
                
                <!-- Pizza crust -->
                <circle class="pizza-crust" cx="50" cy="50" r="40"/>
                
                <!-- Pizza sauce -->
                <circle class="pizza-sauce" cx="50" cy="50" r="35"/>
                
                <!-- Pizza cheese -->
                <circle class="pizza-cheese" cx="50" cy="50" r="30"/>
                
                <!-- Toppings -->
                <circle class="pizza-toppings" cx="35" cy="35" r="3"/>
                <circle class="pizza-toppings" cx="65" cy="35" r="3"/>
                <circle class="pizza-toppings" cx="35" cy="65" r="3"/>
                <circle class="pizza-toppings" cx="65" cy="65" r="3"/>
                <circle class="pizza-toppings" cx="50" cy="50" r="3"/>
            </svg>
        </div>
        
        <a href="#menu" class="cta-button">Explore Our Menu</a>
    </div>
    
    <script>
        // Add some interactive effects
        document.addEventListener('DOMContentLoaded', function() {
            const pizza = document.querySelector('.pizza');
            const steam = document.querySelectorAll('.steam');
            
            // Pizza hover effect
            pizza.addEventListener('mouseenter', function() {
                this.style.transform = 'scale(1.05)';
                this.style.transition = 'transform 0.3s ease';
            });
            
            pizza.addEventListener('mouseleave', function() {
                this.style.transform = 'scale(1)';
            });
            
            // Random steam variations
            setInterval(() => {
                steam.forEach((s, index) => {
                    const randomDelay = Math.random() * 2;
                    const randomHeight = 15 + Math.random() * 10;
                    s.style.animationDelay = randomDelay + 's';
                    s.style.height = randomHeight + 'px';
                });
            }, 3000);
        });
    </script>
</body>
</html>
EOF

echo "✅ Enhanced HTML version created with steam animation!"
echo "📄 File size: $(wc -c < public_html/index.html) bytes"

echo ""
echo "🎉 DEPLOYMENT COMPLETED!"
echo "========================"
echo "Time: $(date)"
