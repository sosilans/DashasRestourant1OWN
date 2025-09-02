#!/bin/bash
set -euo pipefail

echo "🚀 FORCE FIX FIXED DEPLOYMENT STARTING..."
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
if [ -d "/home/master/applications/ygrswjnpmw" ]; then
    cd /home/master/applications/ygrswjnpmw
    echo "📍 In app directory: $(pwd)"
fi

# Create public_html if it doesn't exist
if [ ! -d "public_html" ]; then
    echo "📁 Creating public_html directory..."
    mkdir -p public_html
fi

# FORCE FIX FIXED: Create a proper HTML version with scrolling fixed
echo "🔧 FORCE FIX FIXED: Creating HTML version with scrolling fixed..."

cat > public_html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dar'ya's Kitchen - Authentic Italian Cuisine</title>
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
        }
        
        .hero-section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
        }
        
        .hero-frame {
            background: white;
            border: 4px double #314a60;
            border-radius: 8px;
            padding: 3rem;
            max-width: 800px;
            width: 100%;
            text-align: center;
            position: relative;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
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
            margin-bottom: 2rem;
            text-transform: uppercase;
        }
        
        .main-headline {
            font-family: 'Bebas Neue', sans-serif;
            font-weight: bold;
            font-size: 5.5rem;
            line-height: 1.1;
            letter-spacing: 0.05em;
            color: #314a60;
            margin-bottom: 2rem;
            text-transform: uppercase;
        }
        
        .pizza-illustration {
            margin: 2rem 0;
        }
        
        .pizza-svg {
            width: 120px;
            height: 120px;
            margin: 0 auto;
        }
        
        .subtitle {
            font-family: 'Roboto', sans-serif;
            font-size: 1.2rem;
            color: #666;
            margin-top: 2rem;
            font-style: italic;
        }
        
        .deployment-info {
            position: absolute;
            bottom: 10px;
            right: 10px;
            font-size: 0.8rem;
            color: #999;
            background: rgba(255,255,255,0.8);
            padding: 5px 10px;
            border-radius: 15px;
        }
        
        /* Additional content to enable scrolling */
        .additional-content {
            padding: 4rem 2rem;
            background: white;
            margin: 2rem;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .content-section {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .content-section h2 {
            font-family: 'Montserrat', sans-serif;
            font-size: 2.5rem;
            color: #314a60;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .content-section p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 1rem;
            text-align: center;
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin: 3rem 0;
        }
        
        .feature-card {
            background: #f8f9fa;
            padding: 2rem;
            border-radius: 8px;
            text-align: center;
            border: 2px solid #e9ecef;
        }
        
        .feature-card h3 {
            font-family: 'Montserrat', sans-serif;
            color: #314a60;
            margin-bottom: 1rem;
        }
        
        .feature-card p {
            color: #666;
        }
        
        @media (max-width: 768px) {
            .hero-frame {
                padding: 2rem;
                margin: 1rem;
            }
            
            .main-headline {
                font-size: 3.5rem;
            }
            
            .top-line {
                font-size: 16px;
            }
            
            .additional-content {
                margin: 1rem;
                padding: 2rem 1rem;
            }
            
            .features-grid {
                grid-template-columns: 1fr;
                gap: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="hero-section">
        <div class="hero-frame">
            <!-- Corner Ornaments -->
            <div class="corner-ornament top-left"></div>
            <div class="corner-ornament top-right"></div>
            <div class="corner-ornament bottom-left"></div>
            <div class="corner-ornament bottom-right"></div>
            
            <!-- Content -->
            <div class="top-line">Homestyle Italian Cuisine</div>
            
            <div class="main-headline">Dar'ya's<br>Kitchen</div>
            
            <div class="pizza-illustration">
                <svg class="pizza-svg" viewBox="0 0 120 120" fill="none">
                    <!-- Pizza base -->
                    <circle cx="60" cy="60" r="50" fill="#F8E6C8" stroke="#E8D5A3" stroke-width="2"/>
                    
                    <!-- Crust -->
                    <circle cx="60" cy="60" r="45" fill="none" stroke="#D4A574" stroke-width="3"/>
                    
                    <!-- Sauce -->
                    <circle cx="60" cy="60" r="35" fill="#E53E3E"/>
                    
                    <!-- Cheese -->
                    <circle cx="60" cy="60" r="30" fill="#FFF8DC"/>
                    
                    <!-- Pepperoni slices -->
                    <circle cx="45" cy="45" r="8" fill="#C53030"/>
                    <circle cx="75" cy="45" r="8" fill="#C53030"/>
                    <circle cx="60" cy="70" r="8" fill="#C53030"/>
                    <circle cx="45" cy="70" r="6" fill="#C53030"/>
                    <circle cx="75" cy="70" r="6" fill="#C53030"/>
                </svg>
            </div>
            
            <div class="subtitle">Authentic flavors, family recipes, warm hospitality</div>
            
            <div class="deployment-info">
                FORCE FIX FIXED: Scrolling Enabled | $(date)
            </div>
        </div>
    </div>
    
    <!-- Additional content to enable scrolling -->
    <div class="additional-content">
        <div class="content-section">
            <h2>Welcome to Dar'ya's Kitchen</h2>
            <p>Experience the authentic taste of Italy in every dish we serve. Our family recipes have been passed down through generations, bringing you the true flavors of Italian cuisine.</p>
            
            <div class="features-grid">
                <div class="feature-card">
                    <h3>🍝 Fresh Pasta</h3>
                    <p>Handmade pasta prepared daily with traditional techniques and premium ingredients.</p>
                </div>
                
                <div class="feature-card">
                    <h3>🔥 Wood-Fired</h3>
                    <p>Authentic wood-fired cooking that brings out the natural flavors and aromas.</p>
                </div>
                
                <div class="feature-card">
                    <h3>👨‍👩‍👧‍👦 Family Recipes</h3>
                    <p>Generations of culinary expertise passed down to create unforgettable dining experiences.</p>
                </div>
            </div>
            
            <p style="text-align: center; margin-top: 2rem; font-style: italic; color: #666;">
                Come visit us and discover why Dar'ya's Kitchen is the heart of Italian dining in our community.
            </p>
        </div>
    </div>
</body>
</html>
EOF

echo "✅ FORCE FIX FIXED: HTML version with scrolling fixed created!"

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
echo "🎉 FORCE FIX FIXED DEPLOYMENT COMPLETED!"
echo "========================================="
echo "Site should now show the PROPER Figma design WITH SCROLLING!"
echo "Available at: https://phpstack-1511050-5820602.cloudwaysapps.com/"
echo "Time: $(date)"
