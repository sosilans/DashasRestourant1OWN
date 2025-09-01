// Basic interactions and animations
const yearEl = document.getElementById(''year'');
if (yearEl) yearEl.textContent = new Date().getFullYear();

// Mobile menu toggle
const btn = document.querySelector('.hamburger');
const mobile = document.getElementById('mobile-menu');
if (btn && mobile) {
  btn.addEventListener('click', () => {
    const open = mobile.hasAttribute('hidden') ? false : mobile.getAttribute('hidden') === 'false';
    const next = !open;
    mobile.toggleAttribute('hidden', !next);
    mobile.setAttribute('aria-hidden', String(!next));
    btn.setAttribute('aria-expanded', String(next));
  });
}

// GSAP entrance animations
window.addEventListener('DOMContentLoaded', () => {
  if (window.gsap) {
    gsap.from('.hero h1', { y: 24, opacity: 0, duration: .8, ease: 'power3.out' });
    gsap.from('.hero p',  { y: 20, opacity: 0, duration: .8, delay: .1, ease: 'power3.out' });
    gsap.from('.actions', { y: 16, opacity: 0, duration: .8, delay: .2, ease: 'power3.out' });
    const reveal = (sel) => {
      const els = document.querySelectorAll(sel);
      els.forEach((el, i) => {
        gsap.from(el, { y: 14, opacity: 0, duration: .6, delay: i * 0.06, scrollTrigger: { trigger: el, start: 'top 85%' } });
      });
    };
    if (gsap.registerPlugin) {
      try { gsap.registerPlugin(ScrollTrigger); } catch {}
    }
    reveal('.card');
  }
});

// Smooth in-page scrolling with sticky-header offset
document.addEventListener('click', (event) => {
  const anchor = event.target && event.target.closest('a[href^="#"]');
  if (!anchor) return;

  const hash = anchor.getAttribute('href');
  if (!hash || hash === '#') return;

  const target = document.querySelector(hash);
  if (!target) return;

  event.preventDefault();

  const headerEl = document.querySelector('.site-header');
  const headerHeight = headerEl ? headerEl.getBoundingClientRect().height : 0;
  const extraGap = 8; // small breathing space
  const top = Math.max(0, window.pageYOffset + target.getBoundingClientRect().top - headerHeight - extraGap);

  window.scrollTo({ top, behavior: 'smooth' });
  try { history.pushState(null, '', hash); } catch {}

  // Close mobile menu if open
  if (typeof mobile !== 'undefined' && mobile) {
    mobile.setAttribute('hidden', '');
    mobile.setAttribute('aria-hidden', 'true');
  }
  if (typeof btn !== 'undefined' && btn) {
    btn.setAttribute('aria-expanded', 'false');
  }
});

