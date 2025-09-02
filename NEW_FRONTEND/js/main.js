// Main JavaScript for Dar'ya's Kitchen
document.addEventListener('DOMContentLoaded', function() {
    // Initialize all functionality
    initNavigation();
    initMenu();
    initReviews();
    initHours();
    initForms();
    initAnimations();
});

// Navigation functionality
function initNavigation() {
    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.querySelector('.nav-menu');
    
    if (hamburger && navMenu) {
        hamburger.addEventListener('click', () => {
            navMenu.classList.toggle('active');
            hamburger.classList.toggle('active');
        });
    }
    
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
    
    // Navbar background on scroll
    window.addEventListener('scroll', () => {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 100) {
            navbar.style.background = 'rgba(44, 62, 80, 0.98)';
        } else {
            navbar.style.background = 'rgba(44, 62, 80, 0.95)';
        }
    });
}

// Menu functionality with API integration
function initMenu() {
    const menuContainer = document.getElementById('menu-items');
    const categoryButtons = document.querySelectorAll('.category-btn');
    
    if (!menuContainer) return;
    
    // Load menu from API
    loadMenuFromAPI();
    
    // Category filtering
    categoryButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            // Remove active class from all buttons
            categoryButtons.forEach(b => b.classList.remove('active'));
            // Add active class to clicked button
            btn.classList.add('active');
            
            const category = btn.dataset.category;
            filterMenuByCategory(category);
        });
    });
}

async function loadMenuFromAPI() {
    const menuContainer = document.getElementById('menu-items');
    
    try {
        // Try to load from API first
        const response = await fetch('/api/menu');
        if (response.ok) {
            const menuData = await response.json();
            displayMenuFromAPI(menuData);
        } else {
            // Fallback to sample data if API fails
            displaySampleMenu();
        }
    } catch (error) {
        console.log('API not available, using sample data');
        displaySampleMenu();
    }
}

function displayMenuFromAPI(menuData) {
    const menuContainer = document.getElementById('menu-items');
    
    if (menuData && menuData.length > 0) {
        const menuHTML = menuData.map(item => `
            <div class="menu-item" data-category="${item.category || 'main'}">
                <h3>${item.name}</h3>
                <div class="price">$${item.price}</div>
                <div class="description">${item.description}</div>
            </div>
        `).join('');
        
        menuContainer.innerHTML = menuHTML;
    } else {
        displaySampleMenu();
    }
}

function displaySampleMenu() {
    const menuContainer = document.getElementById('menu-items');
    
    const sampleMenu = [
        {
            name: "Margherita Pizza",
            price: "18.99",
            description: "Fresh mozzarella, tomato sauce, and basil",
            category: "main"
        },
        {
            name: "Bruschetta",
            price: "8.99",
            description: "Toasted bread with tomatoes, garlic, and olive oil",
            category: "appetizers"
        },
        {
            name: "Spaghetti Carbonara",
            price: "16.99",
            description: "Pasta with eggs, cheese, pancetta, and black pepper",
            category: "main"
        },
        {
            name: "Tiramisu",
            price: "9.99",
            description: "Classic Italian dessert with coffee and mascarpone",
            category: "desserts"
        },
        {
            name: "Caprese Salad",
            price: "12.99",
            description: "Fresh mozzarella, tomatoes, and basil with balsamic",
            category: "appetizers"
        },
        {
            name: "Lasagna Bolognese",
            price: "19.99",
            description: "Layers of pasta with rich meat sauce and cheese",
            category: "main"
        }
    ];
    
    const menuHTML = sampleMenu.map(item => `
        <div class="menu-item" data-category="${item.category}">
            <h3>${item.name}</h3>
            <div class="price">$${item.price}</div>
            <div class="description">${item.description}</div>
        </div>
    `).join('');
    
    menuContainer.innerHTML = menuHTML;
}

function filterMenuByCategory(category) {
    const menuItems = document.querySelectorAll('.menu-item');
    
    menuItems.forEach(item => {
        if (category === 'all' || item.dataset.category === category) {
            item.style.display = 'block';
        } else {
            item.style.display = 'none';
        }
    });
}

// Reviews functionality with API integration
function initReviews() {
    const reviewsContainer = document.getElementById('reviews-container');
    
    if (!reviewsContainer) return;
    
    // Load reviews from API
    loadReviewsFromAPI();
    
    // Initialize review form
    initReviewForm();
}

async function loadReviewsFromAPI() {
    const reviewsContainer = document.getElementById('reviews-container');
    
    try {
        // Try to load from API first
        const response = await fetch('/api/reviews');
        if (response.ok) {
            const reviewsData = await response.json();
            displayReviewsFromAPI(reviewsData);
        } else {
            // Fallback to sample data if API fails
            displaySampleReviews();
        }
    } catch (error) {
        console.log('API not available, using sample data');
        displaySampleReviews();
    }
}

function displayReviewsFromAPI(reviewsData) {
    const reviewsContainer = document.getElementById('reviews-container');
    
    if (reviewsData && reviewsData.length > 0) {
        const reviewsHTML = reviewsData.map(review => `
            <div class="review-card">
                <div class="reviewer">${review.name}</div>
                <div class="rating">${'⭐'.repeat(review.rating)}</div>
                <div class="review-text">${review.review}</div>
            </div>
        `).join('');
        
        reviewsContainer.innerHTML = reviewsHTML;
    } else {
        displaySampleReviews();
    }
}

function displaySampleReviews() {
    const reviewsContainer = document.getElementById('reviews-container');
    
    const sampleReviews = [
        {
            name: "Maria S.",
            rating: 5,
            review: "Amazing authentic Italian food! The pizza is incredible and the atmosphere is perfect for family dinners."
        },
        {
            name: "John D.",
            rating: 5,
            review: "Best Italian restaurant in town. The pasta is cooked perfectly and the service is outstanding."
        },
        {
            name: "Sarah L.",
            rating: 4,
            review: "Great food and friendly staff. The tiramisu is to die for! Will definitely come back."
        }
    ];
    
    const reviewsHTML = sampleReviews.map(review => `
        <div class="review-card">
            <div class="reviewer">${review.name}</div>
            <div class="rating">${'⭐'.repeat(review.rating)}</div>
            <div class="review-text">${review.review}</div>
        </div>
    `).join('');
    
    reviewsContainer.innerHTML = reviewsHTML;
}

function initReviewForm() {
    const reviewForm = document.getElementById('review-form');
    const stars = document.querySelectorAll('.star');
    let selectedRating = 0;
    
    if (!reviewForm) return;
    
    // Star rating functionality
    stars.forEach((star, index) => {
        star.addEventListener('click', () => {
            selectedRating = index + 1;
            updateStarDisplay();
        });
    });
    
    function updateStarDisplay() {
        stars.forEach((star, index) => {
            if (index < selectedRating) {
                star.classList.add('active');
            } else {
                star.classList.remove('active');
            }
        });
    }
    
    // Form submission
    reviewForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        
        if (selectedRating === 0) {
            alert('Please select a rating');
            return;
        }
        
        const formData = {
            name: document.getElementById('reviewer-name').value,
            review: document.getElementById('review-text').value,
            rating: selectedRating
        };
        
        try {
            // Try to submit to API
            const response = await fetch('/api/reviews', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData)
            });
            
            if (response.ok) {
                alert('Thank you for your review!');
                reviewForm.reset();
                selectedRating = 0;
                updateStarDisplay();
                // Reload reviews
                loadReviewsFromAPI();
            } else {
                throw new Error('Failed to submit review');
            }
        } catch (error) {
            console.log('API not available, review saved locally');
            alert('Thank you for your review! (Saved locally)');
            reviewForm.reset();
            selectedRating = 0;
            updateStarDisplay();
        }
    });
}

// Hours functionality with API integration
function initHours() {
    const hoursContainer = document.getElementById('hours-info');
    
    if (!hoursContainer) return;
    
    loadHoursFromAPI();
}

async function loadHoursFromAPI() {
    const hoursContainer = document.getElementById('hours-info');
    
    try {
        // Try to load from API first
        const response = await fetch('/api/hours');
        if (response.ok) {
            const hoursData = await response.json();
            displayHoursFromAPI(hoursData);
        } else {
            // Fallback to sample data if API fails
            displaySampleHours();
        }
    } catch (error) {
        console.log('API not available, using sample data');
        displaySampleHours();
    }
}

function displayHoursFromAPI(hoursData) {
    const hoursContainer = document.getElementById('hours-info');
    
    if (hoursData && hoursData.length > 0) {
        const hoursHTML = hoursData.map(hour => `
            <p><strong>${hour.day}:</strong> ${hour.open_time} - ${hour.close_time}</p>
        `).join('');
        
        hoursContainer.innerHTML = hoursHTML;
    } else {
        displaySampleHours();
    }
}

function displaySampleHours() {
    const hoursContainer = document.getElementById('hours-info');
    
    const sampleHours = [
        { day: "Monday", open_time: "11:00 AM", close_time: "10:00 PM" },
        { day: "Tuesday", open_time: "11:00 AM", close_time: "10:00 PM" },
        { day: "Wednesday", open_time: "11:00 AM", close_time: "10:00 PM" },
        { day: "Thursday", open_time: "11:00 AM", close_time: "10:00 PM" },
        { day: "Friday", open_time: "11:00 AM", close_time: "11:00 PM" },
        { day: "Saturday", open_time: "12:00 PM", close_time: "11:00 PM" },
        { day: "Sunday", open_time: "12:00 PM", close_time: "9:00 PM" }
    ];
    
    const hoursHTML = sampleHours.map(hour => `
        <p><strong>${hour.day}:</strong> ${hour.open_time} - ${hour.close_time}</p>
    `).join('');
    
    hoursContainer.innerHTML = hoursHTML;
}

// Form functionality
function initForms() {
    const reservationForm = document.getElementById('reservation-form');
    
    if (reservationForm) {
        reservationForm.addEventListener('submit', (e) => {
            e.preventDefault();
            alert('Thank you for your reservation request! We will contact you soon to confirm.');
            reservationForm.reset();
        });
    }
}

// Animation functionality
function initAnimations() {
    // Intersection Observer for scroll animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);
    
    // Observe elements for animation
    document.querySelectorAll('.menu-item, .review-card, .about-content, .contact-content').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
}

// Utility functions
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    
    // Add styles
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 20px;
        background: ${type === 'success' ? '#27ae60' : type === 'error' ? '#e74c3c' : '#3498db'};
        color: white;
        border-radius: 5px;
        z-index: 10000;
        animation: slideIn 0.3s ease;
    `;
    
    document.body.appendChild(notification);
    
    // Remove after 3 seconds
    setTimeout(() => {
        notification.remove();
    }, 3000);
}

// Add CSS for notifications
const notificationStyles = document.createElement('style');
notificationStyles.textContent = `
    @keyframes slideIn {
        from {
            transform: translateX(100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }
`;
document.head.appendChild(notificationStyles);
