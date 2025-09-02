#!/bin/bash
set -euo pipefail

echo "🎯 EXACT SCREENSHOT: Deploying exact design from screenshot..."
echo "============================================================"

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

# Create EXACT HTML based on screenshot design
echo "🎨 Creating EXACT HTML based on screenshot..."
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
            border: 2px solid #314a60;
            border-radius: 12px;
            padding: 32px;
            text-align: center;
            position: relative;
            max-width: 700px;
            width: 90%;
            box-shadow: 0 15px 30px rgba(49, 74, 96, 0.2);
        }
        
        .corner-ornament {
            position: absolute;
            width: 12px;
            height: 12px;
            border: 2px solid #314a60;
        }
        
        .corner-ornament.top-left {
            top: 6px;
            left: 6px;
            border-right: none;
            border-bottom: none;
        }
        
        .corner-ornament.top-right {
            top: 6px;
            right: 6px;
            border-left: none;
            border-bottom: none;
        }
        
        .corner-ornament.bottom-left {
            bottom: 6px;
            left: 6px;
            border-right: none;
            border-top: none;
        }
        
        .corner-ornament.bottom-right {
            bottom: 6px;
            right: 6px;
            border-left: none;
            border-top: none;
        }
        
        .top-line {
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
            font-size: 16px;
            letter-spacing: 0.15em;
            color: #314a60;
            margin-bottom: 16px;
        }
        
        .title {
            font-family: 'Bebas Neue', sans-serif;
            font-weight: bold;
            font-size: 4.5rem;
            line-height: 1.1;
            letter-spacing: 0.05em;
            color: #314a60;
            margin-bottom: 32px;
            text-transform: uppercase;
        }
        
        .pizza-container {
            position: relative;
            margin: 28px 0;
            display: inline-block;
        }
        
        .pizza {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: radial-gradient(circle at 50% 40%, #F8E6C8 0%, #F4E4B8 70%, #E8D5A3 100%);
            position: relative;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            animation: pizza-float 3s ease-in-out infinite;
        }
        
        .pizza::before {
            content: '';
            position: absolute;
            top: 12px;
            left: 12px;
            right: 12px;
            bottom: 12px;
            border-radius: 50%;
            background: radial-gradient(circle at 50% 40%, #F56565 0%, #E53E3E 60%, #C53030 100%);
        }
        
        .pizza::after {
            content: '';
            position: absolute;
            top: 24px;
            left: 24px;
            right: 24px;
            bottom: 24px;
            border-radius: 50%;
            background: radial-gradient(circle at 50% 30%, #FFFBF0 0%, #FFF8DC 50%, #F7E98E 100%);
        }
        
        .toppings {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 70px;
            height: 70px;
        }
        
        .topping {
            position: absolute;
            width: 6px;
            height: 6px;
            background: #228B22;
            border-radius: 50%;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
        }
        
        .topping:nth-child(1) { top: 12px; left: 50%; transform: translateX(-50%); }
        .topping:nth-child(2) { top: 50%; right: 12px; transform: translateY(-50%); }
        .topping:nth-child(3) { bottom: 12px; left: 50%; transform: translateX(-50%); }
        .topping:nth-child(4) { top: 50%; left: 12px; transform: translateY(-50%); }
        .topping:nth-child(5) { top: 50%; left: 50%; transform: translate(-50%, -50%); }
        
        .steam {
            position: absolute;
            top: -32px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 40px;
        }
        
        .steam-particle {
            position: absolute;
            width: 5px;
            height: 12px;
            background: linear-gradient(to top, rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.3));
            border-radius: 50%;
            animation: steam-rise 4s ease-in-out infinite;
        }
        
        .steam-particle:nth-child(1) { left: 12px; animation-delay: 0s; }
        .steam-particle:nth-child(2) { left: 25px; animation-delay: 0.5s; }
        .steam-particle:nth-child(3) { left: 38px; animation-delay: 1s; }
        
        .cta-button {
            background: linear-gradient(135deg, #ff6347 0%, #ff4500 100%);
            color: white;
            border: none;
            padding: 16px 32px;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 40px;
            cursor: pointer;
            font-family: 'Montserrat', sans-serif;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 6px 20px rgba(255, 99, 71, 0.4);
            transition: all 0.3s ease;
            margin-top: 24px;
        }
        
        .cta-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(255, 99, 71, 0.6);
        }
        
        @keyframes pizza-float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-8px); }
        }
        
        @keyframes steam-rise {
            0% { 
                opacity: 0; 
                transform: translateY(0) scale(0.5); 
            }
            20% { 
                opacity: 1; 
                transform: translateY(-6px) scale(1); 
            }
            80% { 
                opacity: 1; 
                transform: translateY(-24px) scale(1.1); 
            }
            100% { 
                opacity: 0; 
                transform: translateY(-36px) scale(0.8); 
            }
        }
        
        @media (max-width: 768px) {
            .vintage-container {
                padding: 24px 16px;
                margin: 16px;
            }
            
            .title {
                font-size: 3rem;
            }
            
            .pizza {
                width: 80px;
                height: 80px;
            }
            
            .steam {
                top: -24px;
                width: 40px;
                height: 32px;
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
                this.style.transform = 'scale(1.05) rotate(3deg)';
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

echo "✅ EXACT HTML based on screenshot created successfully!"
echo "🎉 Exact screenshot design deployed!"
