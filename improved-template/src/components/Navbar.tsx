import React, { useState, useEffect } from 'react';

const NAV_LINKS = [
  { label: 'About Us', href: '#about' },
  { label: 'Menu', href: '#menu' },
  { label: 'Hours', href: '#hours' },
  { label: 'Reviews', href: '#reviews' }
];

const LANGUAGES = [
  { code: 'EN', name: 'English' },
  { code: 'ES', name: 'Español' },
  { code: 'IT', name: 'Italiano' }
];

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false);
  const [lang, setLang] = useState('EN');
  const [showLang, setShowLang] = useState(false);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 20);
    window.addEventListener('scroll', onScroll);
    return () => window.removeEventListener('scroll', onScroll);
  }, []);

  const handleNavClick = (e, href) => {
    e.preventDefault();
    const el = document.querySelector(href);
    if (el) {
      el.scrollIntoView({ behavior: 'smooth' });
    }
  };

  return (
    <nav
      className={`fixed top-0 left-0 w-full z-50 transition-all duration-300 ${scrolled ? 'backdrop-blur-md bg-white/70 shadow-lg' : 'bg-white/40'} border-b border-[#CFE8F9]`}
      style={{ fontFamily: 'Montserrat, sans-serif', borderRadius: '0 0 2rem 2rem' }}
    >
      <div className="max-w-6xl mx-auto flex items-center justify-between px-6 py-3">
        {/* Logo/Title */}
        <a
          href="#top"
          onClick={e => { e.preventDefault(); window.scrollTo({ top: 0, behavior: 'smooth' }); }}
          className="text-2xl font-serif tracking-wide text-[#314a60] font-bold hover:text-[#D94A38] transition-colors"
          style={{ fontFamily: 'Playfair Display, serif' }}
        >
          Daria’s Kitchen
        </a>
        {/* Navigation */}
        <div className="flex space-x-6">
          {NAV_LINKS.map(link => (
            <a
              key={link.label}
              href={link.href}
              onClick={e => handleNavClick(e, link.href)}
              className="uppercase text-sm font-semibold text-[#314a60] hover:text-[#D94A38] transition-colors px-2 py-1 rounded-xl"
              style={{ letterSpacing: '0.1em' }}
            >
              {link.label}
            </a>
          ))}
        </div>
        {/* Language Selector */}
        <div className="relative">
          <button
            className="flex items-center px-3 py-1 rounded-xl border border-[#CFE8F9] bg-white/80 hover:bg-[#CFE8F9]/40 transition-colors text-[#314a60] font-semibold"
            onClick={() => setShowLang(v => !v)}
            aria-label="Select language"
          >
            {lang} <span className="ml-2">▼</span>
          </button>
          {showLang && (
            <div className="absolute right-0 mt-2 bg-white border border-[#CFE8F9] rounded-xl shadow-lg overflow-hidden">
              {LANGUAGES.map(l => (
                <button
                  key={l.code}
                  className={`block w-full px-4 py-2 text-left text-[#314a60] hover:bg-[#CFE8F9]/40 transition-colors ${lang === l.code ? 'font-bold bg-[#CFE8F9]/30' : ''}`}
                  onClick={() => { setLang(l.code); setShowLang(false); }}
                >
                  {l.name}
                </button>
              ))}
            </div>
          )}
        </div>
      </div>
    </nav>
  );
}
