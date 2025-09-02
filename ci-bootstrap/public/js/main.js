// Enhanced Dar'ya's Kitchen JavaScript

document.addEventListener('DOMContentLoaded', function() {
    // Mobile menu functionality
    const hamburger = document.querySelector('.hamburger');
    const mobileMenu = document.getElementById('mobile-menu');
    
    if (hamburger && mobileMenu) {
        hamburger.addEventListener('click', function() {
            const isHidden = mobileMenu.hidden;
            mobileMenu.hidden = !isHidden;
            hamburger.setAttribute('aria-expanded', !isHidden);
        });
    }
    
    // Smooth scrolling for anchor links
    document.addEventListener('click', function(e) {
        const link = e.target.closest('a[href^="#"]');
        if (!link) return;
        
        const href = link.getAttribute('href');
        if (!href || href === '#') return;
        
        const target = document.querySelector(href);
        if (!target) return;
        
        e.preventDefault();
        
        // Close mobile menu if open
        if (mobileMenu && !mobileMenu.hidden) {
            mobileMenu.hidden = true;
            hamburger.setAttribute('aria-expanded', 'false');
        }
        
        // Calculate scroll position accounting for sticky header
        const header = document.querySelector('.site-header');
        const headerHeight = header ? header.getBoundingClientRect().height : 0;
        const targetTop = target.getBoundingClientRect().top + window.pageYOffset;
        const scrollTop = Math.max(0, targetTop - headerHeight - 8);
        
        // Smooth scroll to target
        window.scrollTo({
            top: scrollTop,
            behavior: 'smooth'
        });
        
        // Update URL without page jump
        try {
            history.pushState(null, '', href);
        } catch (e) {
            // Fallback for older browsers
        }
    });
    
    // Update year in footer
    const yearElement = document.getElementById('year');
    if (yearElement) {
        yearElement.textContent = new Date().getFullYear();
    }
    
    // Form submission handling
    const reservationForm = document.querySelector('form');
    if (reservationForm) {
        reservationForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form data
            const formData = new FormData(this);
            const data = Object.fromEntries(formData);
            
            // Simple validation
            if (!data.name || !data.phone || !data.date || !data.time || !data.guests) {
                alert('Please fill in all fields');
                return;
            }
            
            // Show success message
            alert('Thank you! We will confirm your reservation shortly.');
            
            // Reset form
            this.reset();
        });
    }
    
    // Add scroll effect to header
    const header = document.querySelector('.site-header');
    if (header) {
        let lastScrollTop = 0;
        
        window.addEventListener('scroll', function() {
            const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            
            if (scrollTop > lastScrollTop && scrollTop > 100) {
                // Scrolling down
                header.style.transform = 'translateY(-100%)';
            } else {
                // Scrolling up
                header.style.transform = 'translateY(0)';
            }
            
            lastScrollTop = scrollTop;
        });
        
        // Add transition for smooth header animation
        header.style.transition = 'transform 0.3s ease';
    }
    
    // Add hover effects to cards
    const cards = document.querySelectorAll('.card');
    cards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-4px)';
            this.style.boxShadow = '0 20px 40px #00000030';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '0 10px 24px #00000015';
        });
        
        // Add transition for smooth card animation
        card.style.transition = 'transform 0.3s ease, box-shadow 0.3s ease';
    });
    
    // Language switcher functionality (placeholder for future implementation)
    const languageLinks = document.querySelectorAll('a[href^="/locale/"]');
    languageLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const lang = this.getAttribute('href').split('/').pop();
            
            // For now, just show a message
            alert(`Language switched to ${lang.toUpperCase()}. This feature will be fully implemented in the Laravel backend.`);
            
            // In the future, this would make an AJAX request to change the locale
        });
    });
    
    // Add loading animation for images
    const images = document.querySelectorAll('img');
    images.forEach(img => {
        img.addEventListener('load', function() {
            this.style.opacity = '1';
        });
        
        img.style.opacity = '0';
        img.style.transition = 'opacity 0.3s ease';
    });
    
    // Add intersection observer for scroll animations
    if ('IntersectionObserver' in window) {
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };
        
        const observer = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);
        
        // Observe sections for animation
        const sections = document.querySelectorAll('.section');
        sections.forEach(section => {
            section.style.opacity = '0';
            section.style.transform = 'translateY(20px)';
            section.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
            observer.observe(section);
        });
    }
    
    // Add keyboard navigation support
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            // Close mobile menu with Escape key
            if (mobileMenu && !mobileMenu.hidden) {
                mobileMenu.hidden = true;
                hamburger.setAttribute('aria-expanded', 'false');
            }
        }
    });
    
    // Add focus management for accessibility
    const focusableElements = document.querySelectorAll('a, button, input, textarea, select');
    focusableElements.forEach(element => {
        element.addEventListener('focus', function() {
            this.style.outline = '2px solid var(--brand)';
            this.style.outlineOffset = '2px';
        });
        
        element.addEventListener('blur', function() {
            this.style.outline = 'none';
        });
    });
});

