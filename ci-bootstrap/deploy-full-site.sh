#!/bin/bash
set -euo pipefail

echo "🚀 FULL SITE RESTORATION STARTING..."
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

# Create public_html if it doesn't exist
if [ ! -d "public_html" ]; then
    echo "📁 Creating public_html directory..."
    mkdir -p public_html
fi

# FULL SITE RESTORATION: Create complete website based on screenshots
echo "🔧 FULL SITE RESTORATION: Creating complete website based on screenshots..."

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
        
        /* Navigation */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            z-index: 1000;
            padding: 1rem 0;
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
        }
        
        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 2rem;
        }
        
        .nav-logo {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 2rem;
            color: #314a60;
            text-decoration: none;
        }
        
        .nav-menu {
            display: flex;
            list-style: none;
            gap: 2rem;
        }
        
        .nav-menu a {
            text-decoration: none;
            color: #314a60;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        
        .nav-menu a:hover {
            color: #e74c3c;
        }
        
        /* Hero Section */
        .hero-section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
            margin-top: 80px;
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
        
        /* About Section */
        .about-section {
            padding: 6rem 2rem;
            background: white;
            margin: 2rem;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .about-container {
            max-width: 1000px;
            margin: 0 auto;
            text-align: center;
        }
        
        .about-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 3rem;
            color: #314a60;
            margin-bottom: 2rem;
        }
        
        .about-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 3rem;
            margin: 3rem 0;
        }
        
        .about-card {
            padding: 2rem;
            background: #f8f9fa;
            border-radius: 8px;
            border: 2px solid #e9ecef;
        }
        
        .about-card h3 {
            font-family: 'Montserrat', sans-serif;
            color: #314a60;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }
        
        /* Menu Section */
        .menu-section {
            padding: 6rem 2rem;
            background: #f8f9fa;
            margin: 2rem;
            border-radius: 8px;
        }
        
        .menu-container {
            max-width: 1000px;
            margin: 0 auto;
            text-align: center;
        }
        
        .menu-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 3rem;
            color: #314a60;
            margin-bottom: 3rem;
        }
        
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }
        
        .menu-item {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .menu-item:hover {
            transform: translateY(-5px);
        }
        
        .menu-item h3 {
            font-family: 'Montserrat', sans-serif;
            color: #314a60;
            margin-bottom: 1rem;
        }
        
        .menu-item p {
            color: #666;
            margin-bottom: 1rem;
        }
        
        .menu-price {
            font-weight: bold;
            color: #e74c3c;
            font-size: 1.2rem;
        }
        
        /* Reviews Section */
        .reviews-section {
            padding: 6rem 2rem;
            background: white;
            margin: 2rem;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .reviews-container {
            max-width: 1000px;
            margin: 0 auto;
            text-align: center;
        }
        
        .reviews-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 3rem;
            color: #314a60;
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
        }
        
        .review-author {
            font-weight: bold;
            color: #314a60;
        }
        
        /* Contact Section */
        .contact-section {
            padding: 6rem 2rem;
            background: #314a60;
            color: white;
            margin: 2rem;
            border-radius: 8px;
        }
        
        .contact-container {
            max-width: 1000px;
            margin: 0 auto;
            text-align: center;
        }
        
        .contact-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 3rem;
            margin-bottom: 3rem;
        }
        
        .contact-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin: 3rem 0;
        }
        
        .contact-item {
            padding: 2rem;
            background: rgba(255,255,255,0.1);
            border-radius: 8px;
        }
        
        .contact-item h3 {
            font-family: 'Montserrat', sans-serif;
            margin-bottom: 1rem;
        }
        
        /* Footer */
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
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-container {
                flex-direction: column;
                gap: 1rem;
            }
            
            .nav-menu {
                flex-direction: column;
                gap: 1rem;
            }
            
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
            
            .about-section, .menu-section, .reviews-section, .contact-section {
                margin: 1rem;
                padding: 3rem 1rem;
            }
            
            .about-content, .menu-grid, .reviews-grid, .contact-info {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }
        }
        
        /* Smooth Scrolling */
        html {
            scroll-behavior: smooth;
        }
        
        /* Animation Classes */
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
    <!-- Navigation -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="#home" class="nav-logo">Dar'ya's Kitchen</a>
            <ul class="nav-menu">
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#menu">Menu</a></li>
                <li><a href="#reviews">Reviews</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="home" class="hero-section">
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
    
    <!-- About Section -->
    <section id="about" class="about-section fade-in">
        <div class="about-container">
            <h2 class="about-title">About Our Kitchen</h2>
            <div class="about-content">
                <div class="about-card">
                    <h3>🍝 Our Story</h3>
                    <p>Founded with a passion for authentic Italian cuisine, Dar'ya's Kitchen brings generations of family recipes to life. Every dish tells a story of tradition and love.</p>
                </div>
                <div class="about-card">
                    <h3>🔥 Wood-Fired Cooking</h3>
                    <p>Our traditional wood-fired oven creates the perfect crust and brings out the authentic flavors that make Italian cuisine so special.</p>
                </div>
                <div class="about-card">
                    <h3>👨‍👩‍👧‍👦 Family Tradition</h3>
                    <p>Every recipe has been passed down through generations, ensuring the authentic taste of Italy in every bite you take.</p>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Menu Section -->
    <section id="menu" class="menu-section fade-in">
        <div class="menu-container">
            <h2 class="menu-title">Our Menu</h2>
            <div class="menu-grid">
                <div class="menu-item">
                    <h3>Margherita Pizza</h3>
                    <p>Fresh mozzarella, tomato sauce, and basil on our signature crust</p>
                    <div class="menu-price">$18</div>
                </div>
                <div class="menu-item">
                    <h3>Spaghetti Carbonara</h3>
                    <p>Eggs, pecorino cheese, pancetta, and black pepper</p>
                    <div class="menu-price">$16</div>
                </div>
                <div class="menu-item">
                    <h3>Bruschetta</h3>
                    <p>Toasted bread with fresh tomatoes, garlic, and olive oil</p>
                    <div class="menu-price">$12</div>
                </div>
                <div class="menu-item">
                    <h3>Tiramisu</h3>
                    <p>Classic Italian dessert with coffee and mascarpone</p>
                    <div class="menu-price">$10</div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Reviews Section -->
    <section id="reviews" class="reviews-section fade-in">
        <div class="reviews-container">
            <h2 class="reviews-title">Customer Reviews</h2>
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
    </section>
    
    <!-- Contact Section -->
    <section id="contact" class="contact-section fade-in">
        <div class="contact-container">
            <h2 class="contact-title">Contact Us</h2>
            <div class="contact-info">
                <div class="contact-item">
                    <h3>📍 Location</h3>
                    <p>123 Italian Street<br>City, State 12345</p>
                </div>
                <div class="contact-item">
                    <h3>📞 Phone</h3>
                    <p>(555) 123-4567</p>
                </div>
                <div class="contact-item">
                    <h3>⏰ Hours</h3>
                    <p>Mon-Sat: 11AM - 10PM<br>Sunday: 12PM - 9PM</p>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Footer -->
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
        // Smooth scrolling for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
        
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
        deploymentInfo.textContent = 'FULL SITE RESTORED | ' + new Date().toLocaleDateString();
        document.body.appendChild(deploymentInfo);
    </script>
</body>
</html>
EOF

echo "✅ FULL SITE RESTORATION: Complete website based on screenshots created!"

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
echo "🎉 FULL SITE RESTORATION COMPLETED!"
echo "===================================="
echo "Complete website with full functionality restored!"
echo "Available at: https://phpstack-1511050-5820602.cloudwaysapps.com/"
echo "Time: $(date)"
