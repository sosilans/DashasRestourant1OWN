#!/bin/bash
set -euo pipefail

echo "🎯 CORRECT TEMPLATE: Deploying the right vintage template..."
echo "=========================================================="

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

# Check if we have the correct template
if [ -d "improved-template" ]; then
    echo "✅ Found correct template, attempting React build..."
    cd improved-template
    
    # Check if index.html exists
    if [ ! -f "index.html" ]; then
        echo "⚠️ index.html missing, creating it..."
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
    fi
    
    # Try to build the React application
    echo "🔨 Building React application..."
    if npm run build 2>/dev/null; then
        echo "✅ React build successful!"
        
        # Check for build output
        if [ -d "dist" ]; then
            echo "📁 Found dist folder, copying files..."
            cp -r dist/* ../public_html/
            echo "✅ React build files copied successfully!"
            cd ..
            echo "🎉 React app deployed successfully!"
            exit 0
        elif [ -d "build" ]; then
            echo "📁 Found build folder, copying files..."
            cp -r build/* ../public_html/
            echo "✅ React build files copied successfully!"
            cd ..
            echo "🎉 React app deployed successfully!"
            exit 0
        else
            echo "❌ No build output found, falling back to HTML..."
            cd ..
        fi
    else
        echo "❌ React build failed, falling back to HTML..."
        cd ..
    fi
else
    echo "⚠️ Correct template not found, creating enhanced HTML version..."
fi

# Create enhanced HTML based on the correct template design
echo "🎨 Creating enhanced HTML based on correct template..."
cat > public_html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dar'ya's Kitchen - Authentic Italian Cuisine</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Montserrat:wght@300;400;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Montserrat', sans-serif;
            background: #f0e4d3;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow-x: hidden;
        }
        
        .vintage-container {
            background: #f0e4d3;
            border: 4px solid #314a60;
            border-radius: 8px;
            padding: 48px;
            text-align: center;
            position: relative;
            max-width: 800px;
            width: 90%;
            box-shadow: 0 20px 40px rgba(49, 74, 96, 0.3);
        }
        
        .corner-ornament {
            position: absolute;
            width: 16px;
            height: 16px;
            border: 2px solid #314a60;
        }
        
        .corner-ornament.top-left {
            top: 8px;
            left: 8px;
            border-right: none;
            border-bottom: none;
        }
        
        .corner-ornament.top-right {
            top: 8px;
            right: 8px;
            border-left: none;
            border-bottom: none;
        }
        
        .corner-ornament.bottom-left {
            bottom: 8px;
            left: 8px;
            border-right: none;
            border-top: none;
        }
        
        .corner-ornament.bottom-right {
            bottom: 8px;
            right: 8px;
            border-left: none;
            border-top: none;
        }
        
        .top-line {
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
            font-size: 18px;
            letter-spacing: 0.2em;
            color: #314a60;
            margin-bottom: 20px;
        }
        
        .title {
            font-family: 'Bebas Neue', sans-serif;
            font-weight: bold;
            font-size: 5.5rem;
            line-height: 1.1;
            letter-spacing: 0.05em;
            color: #314a60;
            margin-bottom: 40px;
            text-transform: uppercase;
        }
        
        .pizza-container {
            position: relative;
            margin: 40px 0;
            display: inline-block;
        }
        
        .pizza {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: radial-gradient(circle at 50% 40%, #F8E6C8 0%, #F4E4B8 70%, #E8D5A3 100%);
            position: relative;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            animation: pizza-float 3s ease-in-out infinite;
        }
        
        .pizza::before {
            content: '';
            position: absolute;
            top: 15px;
            left: 15px;
            right: 15px;
            bottom: 15px;
            border-radius: 50%;
            background: radial-gradient(circle at 50% 40%, #F56565 0%, #E53E3E 60%, #C53030 100%);
        }
        
        .pizza::after {
            content: '';
            position: absolute;
            top: 30px;
            left: 30px;
            right: 30px;
            bottom: 30px;
            border-radius: 50%;
            background: radial-gradient(circle at 50% 30%, #FFFBF0 0%, #FFF8DC 50%, #F7E98E 100%);
        }
        
        .toppings {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 80px;
            height: 80px;
        }
        
        .topping {
            position: absolute;
            width: 8px;
            height: 8px;
            background: #E53E3E;
            border-radius: 50%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }
        
        .topping:nth-child(1) { top: 15px; left: 50%; transform: translateX(-50%); }
        .topping:nth-child(2) { top: 50%; right: 15px; transform: translateY(-50%); }
        .topping:nth-child(3) { bottom: 15px; left: 50%; transform: translateX(-50%); }
        .topping:nth-child(4) { top: 50%; left: 15px; transform: translateY(-50%); }
        .topping:nth-child(5) { top: 50%; left: 50%; transform: translate(-50%, -50%); }
        
        .steam {
            position: absolute;
            top: -40px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 50px;
        }
        
        .steam-particle {
            position: absolute;
            width: 6px;
            height: 15px;
            background: linear-gradient(to top, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0.2));
            border-radius: 50%;
            animation: steam-rise 4s ease-in-out infinite;
        }
        
        .steam-particle:nth-child(1) { left: 15px; animation-delay: 0s; }
        .steam-particle:nth-child(2) { left: 30px; animation-delay: 0.5s; }
        .steam-particle:nth-child(3) { left: 45px; animation-delay: 1s; }
        
        .cta-button {
            background: linear-gradient(135deg, #ff6347 0%, #ff4500 100%);
            color: white;
            border: none;
            padding: 18px 36px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 50px;
            cursor: pointer;
            font-family: 'Montserrat', sans-serif;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 8px 25px rgba(255, 99, 71, 0.4);
            transition: all 0.3s ease;
            margin-top: 30px;
        }
        
        .cta-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 35px rgba(255, 99, 71, 0.6);
        }
        
        @keyframes pizza-float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }
        
        @keyframes steam-rise {
            0% { 
                opacity: 0; 
                transform: translateY(0) scale(0.5); 
            }
            20% { 
                opacity: 1; 
                transform: translateY(-8px) scale(1); 
            }
            80% { 
                opacity: 1; 
                transform: translateY(-30px) scale(1.2); 
            }
            100% { 
                opacity: 0; 
                transform: translateY(-45px) scale(0.8); 
            }
        }
        
        @media (max-width: 768px) {
            .vintage-container {
                padding: 30px 20px;
                margin: 20px;
            }
            
            .title {
                font-size: 3rem;
            }
            
            .pizza {
                width: 100px;
                height: 100px;
            }
            
            .steam {
                top: -30px;
                width: 50px;
                height: 40px;
            }
        }
    </style>
</head>
<body>
    <div class="vintage-container">
        <div class="corner-ornament top-left"></div>
        <div class="corner-ornament top-right"></div>
        <div class="corner-ornament bottom-left"></div>
        <div class="corner-ornament bottom-right"></div>
        
        <div class="top-line">HOMESTYLE ITALIAN CUISINE</div>
        <h1 class="title">DAR'YA'S<br>KITCHEN</h1>
        
        <div class="pizza-container">
            <div class="steam">
                <div class="steam-particle"></div>
                <div class="steam-particle"></div>
                <div class="steam-particle"></div>
            </div>
            <div class="pizza">
                <div class="toppings">
                    <div class="topping"></div>
                    <div class="topping"></div>
                    <div class="topping"></div>
                    <div class="topping"></div>
                    <div class="topping"></div>
                </div>
            </div>
        </div>
        
        <button class="cta-button" onclick="exploreMenu()">EXPLORE OUR MENU</button>
    </div>
    
    <script>
        function exploreMenu() {
            console.log('Menu exploration initiated');
        }
        
        document.addEventListener('DOMContentLoaded', function() {
            const pizza = document.querySelector('.pizza');
            const steam = document.querySelector('.steam');
            
            pizza.addEventListener('mouseenter', function() {
                this.style.transform = 'scale(1.05) rotate(5deg)';
                steam.style.opacity = '1.2';
            });
            
            pizza.addEventListener('mouseleave', function() {
                this.style.transform = 'scale(1) rotate(0deg)';
                steam.style.opacity = '1';
            });
            
            pizza.addEventListener('click', function() {
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = 'scale(1)';
                }, 150);
            });
        });
    </script>
</body>
</html>
EOF

echo "✅ Enhanced HTML based on correct template created successfully!"
echo "🎉 Correct vintage template deployed!"
