#!/bin/bash
set -euo pipefail

echo "🎨 EXACT DESIGN RESTORATION STARTING..."
echo "======================================="

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

# EXACT DESIGN RESTORATION: Create exact copy of original Figma design
echo "🔧 EXACT DESIGN RESTORATION: Creating exact copy of original Figma design..."

cat > public_html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dar'ya's Kitchen - Authentic Italian Cuisine</title>
    
    <!-- Google Fonts - EXACTLY as in original -->
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
        
        /* EXACT STYLES FROM ORIGINAL FIGMA DESIGN */
        
        /* Hero Section - EXACT COPY */
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
        
        /* About Section - EXACT COPY */
        .about-section {
            padding: 4rem 2rem;
            background: white;
            margin: 2rem;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .about-container {
            max-width: 1000px;
            margin: 0 auto;
        }
        
        .about-frame {
            position: relative;
            border: 4px double #314a60;
            border-radius: 8px;
            padding: 3rem;
        }
        
        .about-corner {
            position: absolute;
            width: 24px;
            height: 24px;
            border: 2px solid #B49560;
        }
        
        .about-corner.top-left {
            top: 8px;
            left: 8px;
            border-right: none;
            border-bottom: none;
        }
        
        .about-corner.top-right {
            top: 8px;
            right: 8px;
            border-left: none;
            border-bottom: none;
        }
        
        .about-corner.bottom-left {
            bottom: 8px;
            left: 8px;
            border-right: none;
            border-top: none;
        }
        
        .about-corner.bottom-right {
            bottom: 8px;
            right: 8px;
            border-left: none;
            border-top: none;
        }
        
        .about-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 3rem;
            line-height: 1.1;
            color: #314a60;
            text-transform: uppercase;
            margin-bottom: 2rem;
        }
        
        .about-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            align-items: center;
        }
        
        .about-text {
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            line-height: 1.8;
            color: #314a60;
        }
        
        .about-text p {
            margin-bottom: 1rem;
        }
        
        .about-quote {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        .about-quote-line {
            height: 1px;
            width: 48px;
            background-color: #B49560;
        }
        
        .about-quote-text {
            font-family: 'Montserrat', sans-serif;
            font-size: 14px;
            font-weight: 600;
            color: #B49560;
            letter-spacing: 0.1em;
            font-style: italic;
        }
        
        .about-image {
            border: 2px solid #B49560;
            padding: 8px;
        }
        
        .about-image img {
            width: 100%;
            height: 320px;
            object-fit: cover;
            filter: sepia(10%);
        }
        
        /* Menu Section - EXACT COPY */
        .menu-section {
            padding: 4rem 2rem;
            background: white;
            margin: 2rem;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .menu-container {
            max-width: 1000px;
            margin: 0 auto;
        }
        
        .menu-frame {
            position: relative;
            border: 4px double #314a60;
            border-radius: 8px;
            padding: 3rem;
        }
        
        .menu-corner {
            position: absolute;
            width: 24px;
            height: 24px;
            border: 2px solid #B49560;
        }
        
        .menu-corner.top-left {
            top: 8px;
            left: 8px;
            border-right: none;
            border-bottom: none;
        }
        
        .menu-corner.top-right {
            top: 8px;
            right: 8px;
            border-left: none;
            border-bottom: none;
        }
        
        .menu-corner.bottom-left {
            bottom: 8px;
            left: 8px;
            border-right: none;
            border-top: none;
        }
        
        .menu-corner.bottom-right {
            bottom: 8px;
            right: 8px;
            border-left: none;
            border-top: none;
        }
        
        .menu-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 4rem;
            line-height: 1.1;
            color: #314a60;
            text-transform: uppercase;
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .menu-decorative {
            display: flex;
            justify-content: center;
            margin-bottom: 3rem;
        }
        
        .menu-decorative svg {
            width: 60px;
            height: 30px;
        }
        
        .menu-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
        }
        
        .menu-category {
            text-align: center;
        }
        
        .menu-category-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 2rem;
            color: #B49560;
            text-transform: uppercase;
            margin-bottom: 1rem;
        }
        
        .menu-category-line {
            height: 1px;
            width: 80px;
            background-color: #B49560;
            margin: 0 auto 2rem;
        }
        
        .menu-item {
            border-bottom: 1px dashed rgba(49, 74, 96, 0.3);
            padding-bottom: 1rem;
            margin-bottom: 1rem;
        }
        
        .menu-item-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        
        .menu-item-name {
            font-family: 'Montserrat', sans-serif;
            font-size: 18px;
            font-weight: 600;
            color: #314a60;
            margin-bottom: 0.5rem;
        }
        
        .menu-item-description {
            font-family: 'Roboto', sans-serif;
            font-size: 14px;
            color: #666;
            line-height: 1.4;
        }
        
        .menu-item-price {
            font-family: 'Montserrat', sans-serif;
            font-size: 18px;
            font-weight: 600;
            color: #B49560;
        }
        
        /* Specials Section - EXACT COPY */
        .specials-section {
            padding: 4rem 2rem;
            background: white;
            margin: 2rem;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .specials-container {
            max-width: 1000px;
            margin: 0 auto;
        }
        
        .specials-frame {
            position: relative;
            border: 4px double #314a60;
            border-radius: 8px;
            padding: 3rem;
        }
        
        .specials-corner {
            position: absolute;
            width: 24px;
            height: 24px;
            border: 2px solid #B49560;
        }
        
        .specials-corner.top-left {
            top: 8px;
            left: 8px;
            border-right: none;
            border-bottom: none;
        }
        
        .specials-corner.top-right {
            top: 8px;
            right: 8px;
            border-left: none;
            border-bottom: none;
        }
        
        .specials-corner.bottom-left {
            bottom: 8px;
            left: 8px;
            border-right: none;
            border-top: none;
        }
        
        .specials-corner.bottom-right {
            bottom: 8px;
            right: 8px;
            border-left: none;
            border-top: none;
        }
        
        .specials-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 4rem;
            line-height: 1.1;
            color: #314a60;
            text-transform: uppercase;
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .specials-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }
        
        .special-item {
            text-align: center;
            padding: 2rem;
            background: #f8f9fa;
            border-radius: 8px;
            border: 2px solid #e9ecef;
        }
        
        .special-item h3 {
            font-family: 'Montserrat', sans-serif;
            font-size: 1.5rem;
            color: #314a60;
            margin-bottom: 1rem;
        }
        
        .special-item p {
            font-family: 'Roboto', sans-serif;
            color: #666;
            margin-bottom: 1rem;
        }
        
        .special-price {
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
            color: #B49560;
            font-size: 1.2rem;
        }
        
        /* Reviews Section - EXACT COPY */
        .reviews-section {
            padding: 4rem 2rem;
            background: white;
            margin: 2rem;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .reviews-container {
            max-width: 1000px;
            margin: 0 auto;
        }
        
        .reviews-frame {
            position: relative;
            border: 4px double #314a60;
            border-radius: 8px;
            padding: 3rem;
        }
        
        .reviews-corner {
            position: absolute;
            width: 24px;
            height: 24px;
            border: 2px solid #B49560;
        }
        
        .reviews-corner.top-left {
            top: 8px;
            left: 8px;
            border-right: none;
            border-bottom: none;
        }
        
        .reviews-corner.top-right {
            top: 8px;
            right: 8px;
            border-left: none;
            border-bottom: none;
        }
        
        .reviews-corner.bottom-left {
            bottom: 8px;
            left: 8px;
            border-right: none;
            border-top: none;
        }
        
        .reviews-corner.bottom-right {
            bottom: 8px;
            right: 8px;
            border-left: none;
            border-top: none;
        }
        
        .reviews-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 4rem;
            line-height: 1.1;
            color: #314a60;
            text-transform: uppercase;
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .reviews-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }
        
        .review-card {
            background: #f8f9fa;
            padding: 2rem;
            border-radius: 8px;
            border: 2px solid #e9ecef;
            text-align: center;
        }
        
        .review-stars {
            color: #f39c12;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        
        .review-text {
            font-style: italic;
            color: #555;
            margin-bottom: 1rem;
            font-family: 'Roboto', sans-serif;
        }
        
        .review-author {
            font-weight: bold;
            color: #314a60;
            font-family: 'Montserrat', sans-serif;
        }
        
        /* Hours & Location Section - EXACT COPY */
        .hours-location-section {
            padding: 4rem 2rem;
            background: white;
            margin: 2rem;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .hours-location-container {
            max-width: 1000px;
            margin: 0 auto;
        }
        
        .hours-location-frame {
            position: relative;
            border: 4px double #314a60;
            border-radius: 8px;
            padding: 3rem;
        }
        
        .hours-location-corner {
            position: absolute;
            width: 24px;
            height: 24px;
            border: 2px solid #B49560;
        }
        
        .hours-location-corner.top-left {
            top: 8px;
            left: 8px;
            border-right: none;
            border-bottom: none;
        }
        
        .hours-location-corner.top-right {
            top: 8px;
            right: 8px;
            border-left: none;
            border-bottom: none;
        }
        
        .hours-location-corner.bottom-left {
            bottom: 8px;
            left: 8px;
            border-right: none;
            border-top: none;
        }
        
        .hours-location-corner.bottom-right {
            bottom: 8px;
            right: 8px;
            border-left: none;
            border-top: none;
        }
        
        .hours-location-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 4rem;
            line-height: 1.1;
            color: #314a60;
            text-transform: uppercase;
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .hours-location-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
        }
        
        .hours-card, .location-card {
            text-align: center;
            padding: 2rem;
            background: #f8f9fa;
            border-radius: 8px;
            border: 2px solid #e9ecef;
        }
        
        .hours-card h3, .location-card h3 {
            font-family: 'Montserrat', sans-serif;
            font-size: 1.5rem;
            color: #314a60;
            margin-bottom: 1rem;
        }
        
        .hours-card p, .location-card p {
            font-family: 'Roboto', sans-serif;
            color: #666;
            margin-bottom: 0.5rem;
        }
        
        /* Footer Section - EXACT COPY */
        .footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 3rem 2rem;
            margin: 2rem;
            border-radius: 8px;
        }
        
        .footer-content {
            max-width: 1000px;
            margin: 0 auto;
        }
        
        .footer-logo {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }
        
        .footer-text {
            color: #bdc3c7;
            margin-bottom: 2rem;
            font-family: 'Roboto', sans-serif;
        }
        
        .social-links {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-top: 2rem;
        }
        
        .social-links a {
            color: white;
            font-size: 1.5rem;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .social-links a:hover {
            color: #e74c3c;
        }
        
        /* Responsive Design - EXACT COPY */
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
            
            .about-content, .menu-grid, .hours-location-content {
                grid-template-columns: 1fr;
                gap: 2rem;
            }
            
            .about-section, .menu-section, .specials-section, .reviews-section, .hours-location-section {
                margin: 1rem;
                padding: 2rem 1rem;
            }
            
            .about-frame, .menu-frame, .specials-frame, .reviews-frame, .hours-location-frame {
                padding: 2rem;
            }
            
            .about-title, .menu-title, .specials-title, .reviews-title, .hours-location-title {
                font-size: 2.5rem;
            }
        }
        
        /* Smooth Scrolling - EXACT COPY */
        html {
            scroll-behavior: smooth;
        }
        
        /* Animation Classes - EXACT COPY */
        .fade-in {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.6s ease;
        }
        
        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }
    </style>
</head>
<body>
    <!-- Hero Section - EXACT COPY -->
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
        </div>
    </section>
    
    <!-- About Section - EXACT COPY -->
    <section class="about-section fade-in">
        <div class="about-container">
            <div class="about-frame">
                <!-- Corner Ornaments -->
                <div class="about-corner top-left"></div>
                <div class="about-corner top-right"></div>
                <div class="about-corner bottom-left"></div>
                <div class="about-corner bottom-right"></div>
                
                <div class="about-content">
                    <div>
                        <div class="about-title">Our Story</div>
                        <div class="about-text">
                            <p>Welcome to Daria's Kitchen, where authentic Italian flavors meet American hospitality. Our family-owned restaurant brings generations of traditional recipes from the hills of Tuscany to your table.</p>
                            <p>Every dish is crafted with passion, using locally sourced ingredients and time-honored techniques passed down through our family. We believe that great food brings people together, creating memories that last a lifetime.</p>
                            <p>From our homemade pasta to our wood-fired pizzas, each meal is a celebration of Italian culinary heritage, prepared with love and served with pride.</p>
                        </div>
                        <div class="about-quote">
                            <div class="about-quote-line"></div>
                            <div class="about-quote-text">"Fatto a mano con amore"</div>
                            <div class="about-quote-line"></div>
                        </div>
                    </div>
                    <div class="about-image">
                        <img src="https://images.unsplash.com/photo-1719297491070-14b0fc953a76?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjb3p5JTIwSXRhbGlhbiUyMGtpdGNoZW4lMjBjb29raW5nJTIwdmludGFnZXxlbnwxfHx8fDE3NTY1MzIyMDF8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral" alt="Cozy Italian kitchen">
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Menu Section - EXACT COPY -->
    <section class="menu-section fade-in">
        <div class="menu-container">
            <div class="menu-frame">
                <!-- Corner Ornaments -->
                <div class="menu-corner top-left"></div>
                <div class="menu-corner top-right"></div>
                <div class="menu-corner bottom-left"></div>
                <div class="menu-corner bottom-right"></div>
                
                <div class="menu-title">Menu</div>
                
                <!-- Decorative element -->
                <div class="menu-decorative">
                    <svg viewBox="0 0 60 30" fill="none">
                        <path d="M5 15 L15 5 L25 15 L35 5 L45 15 L55 5" stroke="#B49560" stroke-width="2" fill="none"/>
                        <circle cx="30" cy="15" r="3" fill="#B49560"/>
                    </svg>
                </div>
                
                <div class="menu-grid">
                    <div class="menu-category">
                        <div class="menu-category-title">Pizza</div>
                        <div class="menu-category-line"></div>
                        <div class="menu-item">
                            <div class="menu-item-header">
                                <div>
                                    <div class="menu-item-name">Margherita Classica</div>
                                    <div class="menu-item-description">San Marzano tomatoes, fresh mozzarella, basil, extra virgin olive oil</div>
                                </div>
                                <div class="menu-item-price">$18</div>
                            </div>
                        </div>
                        <div class="menu-item">
                            <div class="menu-item-header">
                                <div>
                                    <div class="menu-item-name">Prosciutto e Funghi</div>
                                    <div class="menu-item-description">Tomato base, mozzarella, prosciutto di Parma, mushrooms, arugula</div>
                                </div>
                                <div class="menu-item-price">$24</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="menu-category">
                        <div class="menu-category-title">Pasta</div>
                        <div class="menu-category-line"></div>
                        <div class="menu-item">
                            <div class="menu-item-header">
                                <div>
                                    <div class="menu-item-name">Spaghetti Carbonara</div>
                                    <div class="menu-item-description">Eggs, pecorino Romano, guanciale, black pepper</div>
                                </div>
                                <div class="menu-item-price">$19</div>
                            </div>
                        </div>
                        <div class="menu-item">
                            <div class="menu-item-header">
                                <div>
                                    <div class="menu-item-name">Fettuccine Alfredo</div>
                                    <div class="menu-item-description">Fresh fettuccine, parmigiano-reggiano, butter, cream</div>
                                </div>
                                <div class="menu-item-price">$17</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Specials Section - EXACT COPY -->
    <section class="specials-section fade-in">
        <div class="specials-container">
            <div class="specials-frame">
                <!-- Corner Ornaments -->
                <div class="specials-corner top-left"></div>
                <div class="specials-corner top-right"></div>
                <div class="specials-corner bottom-left"></div>
                <div class="specials-corner bottom-right"></div>
                
                <div class="specials-title">Specials</div>
                
                <div class="specials-grid">
                    <div class="special-item">
                        <h3>Chef's Special</h3>
                        <p>Daily creation featuring seasonal ingredients and chef's creativity</p>
                        <div class="special-price">Market Price</div>
                    </div>
                    <div class="special-item">
                        <h3>Wine Pairing</h3>
                        <p>Expertly selected wines to complement your meal</p>
                        <div class="special-price">$12</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Reviews Section - EXACT COPY -->
    <section class="reviews-section fade-in">
        <div class="reviews-container">
            <div class="reviews-frame">
                <!-- Corner Ornaments -->
                <div class="reviews-corner top-left"></div>
                <div class="reviews-corner top-right"></div>
                <div class="reviews-corner bottom-left"></div>
                <div class="reviews-corner bottom-right"></div>
                
                <div class="reviews-title">Reviews</div>
                
                <div class="reviews-grid">
                    <div class="review-card">
                        <div class="review-stars">⭐⭐⭐⭐⭐</div>
                        <p class="review-text">"The best Italian food I've ever had! The pizza is absolutely perfect."</p>
                        <div class="review-author">- Maria S.</div>
                    </div>
                    <div class="review-card">
                        <div class="review-stars">⭐⭐⭐⭐⭐</div>
                        <p class="review-text">"Authentic flavors that remind me of my grandmother's cooking."</p>
                        <div class="review-author">- Antonio R.</div>
                    </div>
                    <div class="review-card">
                        <div class="review-stars">⭐⭐⭐⭐⭐</div>
                        <p class="review-text">"Amazing atmosphere and the pasta is cooked to perfection!"</p>
                        <div class="review-author">- Sofia M.</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Hours & Location Section - EXACT COPY -->
    <section class="hours-location-section fade-in">
        <div class="hours-location-container">
            <div class="hours-location-frame">
                <!-- Corner Ornaments -->
                <div class="hours-location-corner top-left"></div>
                <div class="hours-location-corner top-right"></div>
                <div class="hours-location-corner bottom-left"></div>
                <div class="hours-location-corner bottom-right"></div>
                
                <div class="hours-location-title">Hours & Location</div>
                
                <div class="hours-location-content">
                    <div class="hours-card">
                        <h3>Hours</h3>
                        <p>Monday - Saturday: 11:00 AM - 10:00 PM</p>
                        <p>Sunday: 12:00 PM - 9:00 PM</p>
                        <p>Kitchen closes 30 minutes before closing</p>
                    </div>
                    <div class="location-card">
                        <h3>Location</h3>
                        <p>123 Italian Street</p>
                        <p>City, State 12345</p>
                        <p>Phone: (555) 123-4567</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Footer - EXACT COPY -->
    <footer class="footer fade-in">
        <div class="footer-content">
            <div class="footer-logo">Dar'ya's Kitchen</div>
            <p class="footer-text">Bringing authentic Italian cuisine to your table since 1995</p>
            <div class="social-links">
                <a href="#" title="Facebook">📘</a>
                <a href="#" title="Instagram">📷</a>
                <a href="#" title="Twitter">🐦</a>
                <a href="#" title="Phone">📞</a>
            </div>
        </div>
    </footer>

    <script>
        // EXACT COPY of original functionality
        
        // Intersection Observer for fade-in animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };
        
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, observerOptions);
        
        // Observe all fade-in elements
        document.querySelectorAll('.fade-in').forEach(el => {
            observer.observe(el);
        });
        
        // Add deployment info
        const deploymentInfo = document.createElement('div');
        deploymentInfo.style.cssText = 'position: fixed; bottom: 10px; right: 10px; background: rgba(0,0,0,0.7); color: white; padding: 5px 10px; border-radius: 15px; font-size: 0.8rem; z-index: 1001;';
        deploymentInfo.textContent = 'EXACT DESIGN RESTORED | ' + new Date().toLocaleDateString();
        document.body.appendChild(deploymentInfo);
    </script>
</body>
</html>
EOF

echo "✅ EXACT DESIGN RESTORATION: Exact copy of original Figma design created!"

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
echo "🎉 EXACT DESIGN RESTORATION COMPLETED!"
echo "======================================"
echo "Exact copy of original Figma design restored!"
echo "Available at: https://phpstack-1511050-5820602.cloudwaysapps.com/"
echo "Time: $(date)"
