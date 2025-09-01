#!/bin/bash
set -euo pipefail

echo "🔧 SCREENSHOT FIXED RESTORATION STARTING..."
echo "============================================"

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

# SCREENSHOT FIXED RESTORATION: Create fixed version with beautiful pizza and working steam
echo "🔧 SCREENSHOT FIXED RESTORATION: Creating fixed version with beautiful pizza and working steam..."

cat > public_html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dar'ya's Kitchen - Authentic Italian Cuisine</title>
    
    <!-- Google Fonts - EXACTLY as in screenshot -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue:wght@400&family=Montserrat:wght@600&family=Roboto:wght@400&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f0e4d3;
            color: #314a60;
            line-height: 1.6;
            overflow-x: hidden;
            min-height: 100vh;
        }
        
        /* EXACT STYLES FROM SCREENSHOT - FIXED */
        
        /* Hero Section - EXACT COPY from screenshot */
        .hero-section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
            background: linear-gradient(135deg, #f0e4d3 0%, #e8d5c0 50%, #f0e4d3 100%);
        }
        
        .hero-frame {
            background: white;
            border: 4px double #314a60;
            border-radius: 12px;
            padding: 4rem;
            max-width: 900px;
            width: 100%;
            text-align: center;
            position: relative;
            box-shadow: 0 25px 50px rgba(0,0,0,0.15);
        }
        
        .corner-ornament {
            position: absolute;
            width: 20px;
            height: 20px;
            border: 3px solid #314a60;
        }
        
        .corner-ornament.top-left {
            top: 12px;
            left: 12px;
            border-right: none;
            border-bottom: none;
        }
        
        .corner-ornament.top-right {
            top: 12px;
            right: 12px;
            border-left: none;
            border-bottom: none;
        }
        
        .corner-ornament.bottom-left {
            bottom: 12px;
            left: 12px;
            border-right: none;
            border-top: none;
        }
        
        .corner-ornament.bottom-right {
            bottom: 12px;
            right: 12px;
            border-left: none;
            border-top: none;
        }
        
        .top-line {
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
            font-size: 20px;
            letter-spacing: 0.3em;
            color: #314a60;
            margin-bottom: 2.5rem;
            text-transform: uppercase;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }
        
        .main-headline {
            font-family: 'Bebas Neue', sans-serif;
            font-weight: bold;
            font-size: 6rem;
            line-height: 0.9;
            letter-spacing: 0.08em;
            color: #314a60;
            margin-bottom: 2.5rem;
            text-transform: uppercase;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.15);
        }
        
        .pizza-container {
            position: relative;
            margin: 3rem 0;
            display: inline-block;
        }
        
        .pizza-illustration {
            position: relative;
            width: 140px;
            height: 140px;
            margin: 0 auto;
        }
        
        .pizza-svg {
            width: 100%;
            height: 100%;
            filter: drop-shadow(0 8px 16px rgba(0,0,0,0.2));
        }
        
        /* FIXED Animated Steam - Working properly */
        .steam-container {
            position: absolute;
            top: -30px;
            left: 50%;
            transform: translateX(-50%);
            width: 120px;
            height: 100px;
            pointer-events: none;
            z-index: 10;
        }
        
        .steam-particle {
            position: absolute;
            background: linear-gradient(180deg, rgba(255,255,255,0.9) 0%, rgba(255,255,255,0.4) 50%, transparent 100%);
            border-radius: 50%;
            animation: steamRise 4s ease-out infinite;
        }
        
        .steam-particle:nth-child(1) {
            width: 10px;
            height: 10px;
            left: 25px;
            animation-delay: 0s;
            animation-duration: 3.5s;
        }
        
        .steam-particle:nth-child(2) {
            width: 8px;
            height: 8px;
            left: 40px;
            animation-delay: 0.8s;
            animation-duration: 4s;
        }
        
        .steam-particle:nth-child(3) {
            width: 12px;
            height: 12px;
            left: 55px;
            animation-delay: 1.6s;
            animation-duration: 3.8s;
        }
        
        .steam-particle:nth-child(4) {
            width: 9px;
            height: 9px;
            left: 70px;
            animation-delay: 2.4s;
            animation-duration: 4.2s;
        }
        
        .steam-particle:nth-child(5) {
            width: 11px;
            height: 11px;
            left: 85px;
            animation-delay: 3.2s;
            animation-duration: 3.6s;
        }
        
        @keyframes steamRise {
            0% {
                opacity: 0;
                transform: translateY(0) scale(0.3);
            }
            15% {
                opacity: 1;
                transform: translateY(-15px) scale(1);
            }
            70% {
                opacity: 0.8;
                transform: translateY(-50px) scale(0.9);
            }
            100% {
                opacity: 0;
                transform: translateY(-80px) scale(0.2);
            }
        }
        
        .subtitle {
            font-family: 'Roboto', sans-serif;
            font-size: 1.4rem;
            color: #5a6b7c;
            margin-top: 2.5rem;
            font-style: italic;
            line-height: 1.4;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.05);
        }
        
        /* Additional decorative elements from screenshot */
        .decorative-line {
            width: 80px;
            height: 2px;
            background: linear-gradient(90deg, transparent 0%, #B49560 50%, transparent 100%);
            margin: 2rem auto;
            border-radius: 1px;
        }
        
        .italian-accent {
            font-family: 'Montserrat', sans-serif;
            font-size: 1rem;
            color: #B49560;
            font-weight: 600;
            letter-spacing: 0.1em;
            margin-top: 1.5rem;
            text-transform: uppercase;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-frame {
                padding: 2.5rem;
                margin: 1rem;
            }
            
            .main-headline {
                font-size: 4rem;
            }
            
            .top-line {
                font-size: 18px;
                letter-spacing: 0.2em;
            }
            
            .pizza-illustration {
                width: 120px;
                height: 120px;
            }
            
            .steam-container {
                width: 100px;
                height: 80px;
            }
        }
        
        /* Smooth Scrolling */
        html {
            scroll-behavior: smooth;
        }
        
        /* Enhanced shadows and depth */
        .hero-frame::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, #314a60, #4a5f7a, #314a60);
            border-radius: 14px;
            z-index: -1;
            opacity: 0.1;
        }
    </style>
</head>
<body>
    <!-- Hero Section - EXACT COPY from screenshot - FIXED -->
    <section class="hero-section">
        <div class="hero-frame">
            <!-- Corner Ornaments -->
            <div class="corner-ornament top-left"></div>
            <div class="corner-ornament top-right"></div>
            <div class="corner-ornament bottom-left"></div>
            <div class="corner-ornament bottom-right"></div>
            
            <!-- Content -->
            <div class="top-line">Homestyle Italian Cuisine</div>
            
            <div class="main-headline">Dar'ya's<br>Kitchen</div>
            
            <!-- Decorative line -->
            <div class="decorative-line"></div>
            
            <!-- Pizza with FIXED Animated Steam -->
            <div class="pizza-container">
                <!-- FIXED Animated Steam -->
                <div class="steam-container">
                    <div class="steam-particle"></div>
                    <div class="steam-particle"></div>
                    <div class="steam-particle"></div>
                    <div class="steam-particle"></div>
                    <div class="steam-particle"></div>
                </div>
                
                <!-- FIXED Beautiful Pizza Illustration -->
                <div class="pizza-illustration">
                    <svg class="pizza-svg" viewBox="0 0 140 140" fill="none">
                        <!-- Enhanced shadow -->
                        <defs>
                            <filter id="pizzaShadow" x="-50%" y="-50%" width="200%" height="200%">
                                <feDropShadow dx="0" dy="4" stdDeviation="8" floodColor="#000" floodOpacity="0.3"/>
                                <feDropShadow dx="0" dy="2" stdDeviation="4" floodColor="#000" floodOpacity="0.2"/>
                            </filter>
                            
                            <!-- FIXED Enhanced gradients for beautiful pizza -->
                            <radialGradient id="pizzaBase" cx="0.5" cy="0.4" r="0.8">
                                <stop offset="0%" stopColor="#F8E6C8"/>
                                <stop offset="40%" stopColor="#F4E4B8"/>
                                <stop offset="70%" stopColor="#E8D5A3"/>
                                <stop offset="100%" stopColor="#D4C19A"/>
                            </radialGradient>
                            
                            <radialGradient id="crustGrad" cx="0.5" cy="0.4" r="0.9">
                                <stop offset="0%" stopColor="#E8C087"/>
                                <stop offset="30%" stopColor="#D4A574"/>
                                <stop offset="60%" stopColor="#B8915F"/>
                                <stop offset="100%" stopColor="#A67C4A"/>
                            </radialGradient>
                            
                            <radialGradient id="sauceGrad" cx="0.5" cy="0.4" r="0.7">
                                <stop offset="0%" stopColor="#F56565"/>
                                <stop offset="40%" stopColor="#E53E3E"/>
                                <stop offset="70%" stopColor="#C53030"/>
                                <stop offset="100%" stopColor="#9B2C2C"/>
                            </radialGradient>
                            
                            <radialGradient id="cheeseGrad" cx="0.5" cy="0.3" r="0.8">
                                <stop offset="0%" stopColor="#FFFBF0"/>
                                <stop offset="30%" stopColor="#FFF8DC"/>
                                <stop offset="60%" stopColor="#F7E98E"/>
                                <stop offset="100%" stopColor="#F4E4B8"/>
                            </radialGradient>
                            
                            <radialGradient id="pepperoniGrad" cx="0.3" cy="0.3" r="0.8">
                                <stop offset="0%" stopColor="#E53E3E"/>
                                <stop offset="30%" stopColor="#C53030"/>
                                <stop offset="60%" stopColor="#9B2C2C"/>
                                <stop offset="100%" stopColor="#742A2A"/>
                            </radialGradient>
                            
                            <radialGradient id="basilGrad" cx="0.5" cy="0.5" r="0.5">
                                <stop offset="0%" stopColor="#48BB78"/>
                                <stop offset="50%" stopColor="#38A169"/>
                                <stop offset="100%" stopColor="#2F855A"/>
                            </radialGradient>
                        </defs>
                        
                        <!-- FIXED Pizza base with enhanced shadow -->
                        <circle cx="70" cy="70" r="60" fill="url(#pizzaBase)" stroke="#E8D5A3" stroke-width="3" filter="url(#pizzaShadow)"/>
                        
                        <!-- FIXED Enhanced crust -->
                        <circle cx="70" cy="70" r="55" fill="none" stroke="url(#crustGrad)" stroke-width="4"/>
                        
                        <!-- FIXED Sauce with realistic texture -->
                        <circle cx="70" cy="70" r="45" fill="url(#sauceGrad)"/>
                        
                        <!-- FIXED Cheese with bubbles and texture -->
                        <circle cx="70" cy="70" r="40" fill="url(#cheeseGrad)"/>
                        
                        <!-- FIXED Enhanced pepperoni slices with realistic placement -->
                        <circle cx="55" cy="55" r="10" fill="url(#pepperoniGrad)"/>
                        <circle cx="85" cy="55" r="10" fill="url(#pepperoniGrad)"/>
                        <circle cx="70" cy="70" r="10" fill="url(#pepperoniGrad)"/>
                        <circle cx="55" cy="85" r="8" fill="url(#pepperoniGrad)"/>
                        <circle cx="85" cy="85" r="8" fill="url(#pepperoniGrad)"/>
                        <circle cx="45" cy="70" r="7" fill="url(#pepperoniGrad)"/>
                        <circle cx="95" cy="70" r="7" fill="url(#pepperoniGrad)"/>
                        
                        <!-- FIXED Basil leaves for authenticity -->
                        <ellipse cx="70" cy="45" rx="8" ry="4" fill="url(#basilGrad)" transform="rotate(45 70 45)"/>
                        <ellipse cx="70" cy="95" rx="8" ry="4" fill="url(#basilGrad)" transform="rotate(-45 70 95)"/>
                        
                        <!-- FIXED Cheese bubbles for texture -->
                        <circle cx="65" cy="65" r="2" fill="rgba(255,255,255,0.8)"/>
                        <circle cx="75" cy="75" r="1.5" fill="rgba(255,255,255,0.8)"/>
                        <circle cx="60" cy="80" r="1" fill="rgba(255,255,255,0.8)"/>
                        <circle cx="80" cy="60" r="1.5" fill="rgba(255,255,255,0.8)"/>
                        
                        <!-- FIXED Additional texture details -->
                        <circle cx="50" cy="50" r="3" fill="rgba(255,255,255,0.6)"/>
                        <circle cx="90" cy="50" r="2.5" fill="rgba(255,255,255,0.6)"/>
                        <circle cx="50" cy="90" r="2" fill="rgba(255,255,255,0.6)"/>
                        <circle cx="90" cy="90" r="2.5" fill="rgba(255,255,255,0.6)"/>
                    </svg>
                </div>
            </div>
            
            <!-- Italian accent text -->
            <div class="italian-accent">"Fatto a mano con amore"</div>
            
            <div class="subtitle">Authentic flavors, family recipes, warm hospitality</div>
        </div>
    </section>

    <script>
        // FIXED Enhanced steam animation
        function enhanceSteam() {
            const steamParticles = document.querySelectorAll('.steam-particle');
            
            steamParticles.forEach((particle, index) => {
                // Add random variations to steam for natural look
                const randomX = (Math.random() - 0.5) * 15;
                const randomDelay = Math.random() * 3;
                const randomDuration = 3.5 + Math.random() * 1.5;
                
                particle.style.left = `${parseInt(particle.style.left) + randomX}px`;
                particle.style.animationDelay = `${randomDelay}s`;
                particle.style.animationDuration = `${randomDuration}s`;
            });
        }
        
        // Initialize enhanced steam
        enhanceSteam();
        
        // Add deployment info
        const deploymentInfo = document.createElement('div');
        deploymentInfo.style.cssText = 'position: fixed; bottom: 10px; right: 10px; background: rgba(0,0,0,0.8); color: white; padding: 8px 12px; border-radius: 20px; font-size: 0.8rem; z-index: 1001; font-family: monospace;';
        deploymentInfo.textContent = 'SCREENSHOT FIXED | ' + new Date().toLocaleDateString();
        document.body.appendChild(deploymentInfo);
        
        // Add subtle hover effects
        document.querySelector('.hero-frame').addEventListener('mouseenter', function() {
            this.style.transform = 'scale(1.02)';
            this.style.transition = 'transform 0.3s ease';
        });
        
        document.querySelector('.hero-frame').addEventListener('mouseleave', function() {
            this.style.transform = 'scale(1)';
        });
        
        // Ensure steam animation is working
        console.log('Steam animation initialized with', document.querySelectorAll('.steam-particle').length, 'particles');
    </script>
</body>
</html>
EOF

echo "✅ SCREENSHOT FIXED RESTORATION: Fixed version with beautiful pizza and working steam created!"

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
    echo "📄 First 10 lines:"
    head -10 public_html/index.html
else
    echo "❌ index.html not found!"
fi

echo ""
echo "🎉 SCREENSHOT FIXED RESTORATION COMPLETED!"
echo "=========================================="
echo "Fixed version with beautiful pizza and working steam restored!"
echo "Available at: https://phpstack-1511050-5820602.cloudwaysapps.com/"
echo "Time: $(date)"
