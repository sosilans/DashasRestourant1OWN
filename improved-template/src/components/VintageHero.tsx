import React from 'react';

export default function VintageHero() {
  return (
    <div className="min-h-screen flex items-center justify-center p-8" style={{ backgroundColor: '#f0e4d3' }}>
      <div className="relative max-w-2xl w-full">
        {/* Main Hero Frame */}
        <div 
          className="relative p-12 border-4 border-double"
          style={{ 
            borderColor: '#314a60',
            color: '#314a60'
          }}
        >
          {/* Corner Ornaments */}
          <div className="absolute top-2 left-2 w-4 h-4 border-l-2 border-t-2" style={{ borderColor: '#314a60' }}></div>
          <div className="absolute top-2 right-2 w-4 h-4 border-r-2 border-t-2" style={{ borderColor: '#314a60' }}></div>
          <div className="absolute bottom-2 left-2 w-4 h-4 border-l-2 border-b-2" style={{ borderColor: '#314a60' }}></div>
          <div className="absolute bottom-2 right-2 w-4 h-4 border-r-2 border-b-2" style={{ borderColor: '#314a60' }}></div>

          {/* Content */}
          <div className="text-center space-y-6">
            {/* Top Line */}
            <div 
              className="tracking-wider"
              style={{ 
                fontFamily: 'Montserrat, sans-serif',
                fontWeight: '600',
                fontSize: '18px',
                letterSpacing: '0.2em'
              }}
            >
              HOMESTYLE ITALIAN CUISINE
            </div>

            {/* Main Headline */}
            <div 
              className="uppercase tracking-wide"
              style={{ 
                fontFamily: 'Bebas Neue, sans-serif',
                fontWeight: 'bold',
                fontSize: '5.5rem',
                lineHeight: '1.1',
                letterSpacing: '0.05em'
              }}
            >
              DAR'YA'S<br />KITCHEN
            </div>

            {/* Pizza Illustration */}
            <div className="py-4">
              <svg 
                width="120" 
                height="120" 
                viewBox="0 0 120 120" 
                className="mx-auto"
                fill="none"
              >
                {/* Gradient definitions */}
                <defs>
                  {/* Pizza base gradient */}
                  <radialGradient id="pizzaBase" cx="0.5" cy="0.4" r="0.8">
                    <stop offset="0%" stopColor="#F8E6C8" />
                    <stop offset="70%" stopColor="#F4E4B8" />
                    <stop offset="100%" stopColor="#E8D5A3" />
                  </radialGradient>
                  
                  {/* Crust gradient */}
                  <radialGradient id="crustGrad" cx="0.5" cy="0.4" r="0.9">
                    <stop offset="0%" stopColor="#E8C087" />
                    <stop offset="50%" stopColor="#D4A574" />
                    <stop offset="100%" stopColor="#B8915F" />
                  </radialGradient>
                  
                  {/* Sauce gradient */}
                  <radialGradient id="sauceGrad" cx="0.5" cy="0.4" r="0.7">
                    <stop offset="0%" stopColor="#F56565" />
                    <stop offset="60%" stopColor="#E53E3E" />
                    <stop offset="100%" stopColor="#C53030" />
                  </radialGradient>
                  
                  {/* Cheese gradient */}
                  <radialGradient id="cheeseGrad" cx="0.5" cy="0.3" r="0.8">
                    <stop offset="0%" stopColor="#FFFBF0" />
                    <stop offset="50%" stopColor="#FFF8DC" />
                    <stop offset="100%" stopColor="#F7E98E" />
                  </radialGradient>
                  
                  {/* Pepperoni gradient */}
                  <radialGradient id="pepperoniGrad" cx="0.3" cy="0.3" r="0.8">
                    <stop offset="0%" stopColor="#E53E3E" />
                    <stop offset="40%" stopColor="#C53030" />
                    <stop offset="100%" stopColor="#9B2C2C" />
                  </radialGradient>
                  
                  {/* Shadow filter */}
                  <filter id="shadow" x="-50%" y="-50%" width="200%" height="200%">
                    <feDropShadow dx="2" dy="2" stdDeviation="3" floodOpacity="0.2"/>
                  </filter>
                </defs>
                
                {/* Main pizza group with tilt */}
                <g transform="rotate(-15 60 60)">
                  {/* Pizza shadow */}
                  <ellipse cx="62" cy="108" rx="40" ry="8" fill="#314a60" fillOpacity="0.1" />
                  
                  {/* Pizza base circle with gradient */}
                  <circle 
                    cx="60" 
                    cy="60" 
                    r="45" 
                    fill="url(#pizzaBase)" 
                    stroke="#314a60" 
                    strokeWidth="1.5"
                    filter="url(#shadow)"
                  />
                  
                  {/* Crust texture with bumps */}
                  <circle 
                    cx="60" 
                    cy="60" 
                    r="45" 
                    fill="none" 
                    stroke="url(#crustGrad)" 
                    strokeWidth="7"
                  />
                  
                  {/* 8 Pizza slice lines */}
                  <g stroke="#314a60" strokeWidth="1" opacity="0.3">
                    <line x1="60" y1="15" x2="60" y2="105" />
                    <line x1="92.3" y1="27.7" x2="27.7" y2="92.3" />
                    <line x1="105" y1="60" x2="15" y2="60" />
                    <line x1="92.3" y1="92.3" x2="27.7" y2="27.7" />
                  </g>
                  
                  {/* Crust texture bumps */}
                  <circle cx="25" cy="45" r="2" fill="#E8C087" />
                  <circle cx="30" cy="80" r="1.5" fill="#E8C087" />
                  <circle cx="90" cy="80" r="2" fill="#E8C087" />
                  <circle cx="95" cy="45" r="1.5" fill="#E8C087" />
                  <circle cx="60" cy="15" r="1.5" fill="#E8C087" />
                  <circle cx="45" cy="102" r="1.8" fill="#E8C087" />
                  <circle cx="75" cy="102" r="1.5" fill="#E8C087" />
                  <circle cx="18" cy="60" r="1.5" fill="#E8C087" />
                  <circle cx="102" cy="60" r="1.5" fill="#E8C087" />
                  
                  {/* Sauce base with gradient */}
                  <circle 
                    cx="60" 
                    cy="60" 
                    r="38" 
                    fill="url(#sauceGrad)" 
                    fillOpacity="0.6"
                  />
                  
                  {/* Cheese base with gradient */}
                  <circle 
                    cx="60" 
                    cy="60" 
                    r="36" 
                    fill="url(#cheeseGrad)" 
                    fillOpacity="0.9"
                  />
                  
                  {/* Symmetrical pepperoni placement - 8 slices */}
                  <g filter="url(#shadow)">
                    {/* Slice 1 (top) */}
                    <circle cx="60" cy="35" r="4.5" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    <circle cx="55" cy="45" r="3" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    
                    {/* Slice 2 (top-right) */}
                    <circle cx="80" cy="40" r="4.5" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    <circle cx="75" cy="50" r="3" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    
                    {/* Slice 3 (right) */}
                    <circle cx="85" cy="60" r="4.5" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    <circle cx="75" cy="65" r="3" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    
                    {/* Slice 4 (bottom-right) */}
                    <circle cx="80" cy="80" r="4.5" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    <circle cx="70" cy="75" r="3" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    
                    {/* Slice 5 (bottom) */}
                    <circle cx="60" cy="85" r="4.5" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    <circle cx="65" cy="75" r="3" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    
                    {/* Slice 6 (bottom-left) */}
                    <circle cx="40" cy="80" r="4.5" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    <circle cx="50" cy="75" r="3" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    
                    {/* Slice 7 (left) */}
                    <circle cx="35" cy="60" r="4.5" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    <circle cx="45" cy="55" r="3" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    
                    {/* Slice 8 (top-left) */}
                    <circle cx="40" cy="40" r="4.5" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    <circle cx="50" cy="50" r="3" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                    
                    {/* Center pepperoni */}
                    <circle cx="60" cy="60" r="5" fill="url(#pepperoniGrad)" stroke="#9B2C2C" strokeWidth="0.5" />
                  </g>
                  
                  {/* Pepperoni texture highlights - symmetrical */}
                  <circle cx="61" cy="33" r="1.5" fill="#F56565" fillOpacity="0.8" />
                  <circle cx="81" cy="38" r="1.5" fill="#F56565" fillOpacity="0.8" />
                  <circle cx="86" cy="58" r="1.5" fill="#F56565" fillOpacity="0.8" />
                  <circle cx="81" cy="78" r="1.5" fill="#F56565" fillOpacity="0.8" />
                  <circle cx="61" cy="83" r="1.5" fill="#F56565" fillOpacity="0.8" />
                  <circle cx="41" cy="78" r="1.5" fill="#F56565" fillOpacity="0.8" />
                  <circle cx="36" cy="58" r="1.5" fill="#F56565" fillOpacity="0.8" />
                  <circle cx="41" cy="38" r="1.5" fill="#F56565" fillOpacity="0.8" />
                  <circle cx="61" cy="58" r="2" fill="#F56565" fillOpacity="0.8" />
                  
                  {/* Melted cheese blobs - symmetrical placement */}
                  <path 
                    d="M52 38 Q48 40 50 43 Q54 45 56 41 Q54 37 52 38 Z" 
                    fill="#FFFBF0" 
                    fillOpacity="0.95" 
                    stroke="#F7E98E" 
                    strokeWidth="0.5"
                  />
                  <path 
                    d="M72 48 Q68 50 70 53 Q74 55 76 51 Q74 47 72 48 Z" 
                    fill="#FFFBF0" 
                    fillOpacity="0.95" 
                    stroke="#F7E98E" 
                    strokeWidth="0.5"
                  />
                  <path 
                    d="M68 72 Q64 74 66 77 Q70 79 72 75 Q70 71 68 72 Z" 
                    fill="#FFFBF0" 
                    fillOpacity="0.95" 
                    stroke="#F7E98E" 
                    strokeWidth="0.5"
                  />
                  <path 
                    d="M48 72 Q44 74 46 77 Q50 79 52 75 Q50 71 48 72 Z" 
                    fill="#FFFBF0" 
                    fillOpacity="0.95" 
                    stroke="#F7E98E" 
                    strokeWidth="0.5"
                  />
                  
                  {/* Stretchy cheese strings - enhanced */}
                  <path 
                    d="M65 45 Q61 50 59 55 Q61 58 65 55 Q67 50 65 45" 
                    stroke="#FFFBF0" 
                    strokeWidth="2" 
                    fill="none" 
                    strokeLinecap="round"
                    opacity="0.9"
                  />
                  <path 
                    d="M50 55 Q46 60 48 65 Q52 68 54 63 Q52 58 50 55" 
                    stroke="#FFFBF0" 
                    strokeWidth="1.5" 
                    fill="none" 
                    strokeLinecap="round"
                    opacity="0.9"
                  />
                  <path 
                    d="M75 62 Q71 67 73 72 Q77 75 79 70 Q77 65 75 62" 
                    stroke="#FFFBF0" 
                    strokeWidth="1.8" 
                    fill="none" 
                    strokeLinecap="round"
                    opacity="0.9"
                  />
                  <path 
                    d="M45 62 Q41 67 43 72 Q47 75 49 70 Q47 65 45 62" 
                    stroke="#FFFBF0" 
                    strokeWidth="1.5" 
                    fill="none" 
                    strokeLinecap="round"
                    opacity="0.9"
                  />
                  
                  {/* Green basil leaves - symmetrical */}
                  <g filter="url(#shadow)">
                    <ellipse cx="58" cy="42" rx="2" ry="4" fill="#22C55E" stroke="#16A34A" strokeWidth="0.5" transform="rotate(25 58 42)" />
                    <ellipse cx="78" cy="58" rx="1.8" ry="3.5" fill="#22C55E" stroke="#16A34A" strokeWidth="0.5" transform="rotate(-15 78 58)" />
                    <ellipse cx="62" cy="78" rx="2.2" ry="4" fill="#22C55E" stroke="#16A34A" strokeWidth="0.5" transform="rotate(45 62 78)" />
                    <ellipse cx="42" cy="62" rx="2" ry="3.8" fill="#22C55E" stroke="#16A34A" strokeWidth="0.5" transform="rotate(75 42 62)" />
                  </g>
                  
                  {/* Shine effect */}
                  <ellipse 
                    cx="50" 
                    cy="45" 
                    rx="15" 
                    ry="8" 
                    fill="#FFFFFF" 
                    fillOpacity="0.15" 
                    transform="rotate(-20 50 45)"
                  />
                </g>
                
                {/* Enhanced animated steam lines - outside the tilted group */}
                <g opacity="0.6">
                  <path 
                    d="M35 35 Q37 25 35 20 Q33 15 35 10 Q37 5 35 0" 
                    stroke="#314a60" 
                    strokeWidth="1.5" 
                    fill="none" 
                    strokeLinecap="round"
                  >
                    <animate attributeName="opacity" values="0.3;0.9;0.3" dur="2.5s" repeatCount="indefinite" />
                    <animateTransform 
                      attributeName="transform" 
                      type="translate" 
                      values="0,0; 2,-3; 0,0" 
                      dur="2.5s" 
                      repeatCount="indefinite"
                    />
                  </path>
                  <path 
                    d="M55 25 Q57 15 55 10 Q53 5 55 0 Q57 -5 55 -10" 
                    stroke="#314a60" 
                    strokeWidth="1.8" 
                    fill="none" 
                    strokeLinecap="round"
                  >
                    <animate attributeName="opacity" values="0.5;1;0.5" dur="2s" repeatCount="indefinite" begin="0.3s" />
                    <animateTransform 
                      attributeName="transform" 
                      type="translate" 
                      values="0,0; -1,-4; 0,0" 
                      dur="2s" 
                      repeatCount="indefinite" 
                      begin="0.3s"
                    />
                  </path>
                  <path 
                    d="M75 30 Q77 20 75 15 Q73 10 75 5 Q77 0 75 -5" 
                    stroke="#314a60" 
                    strokeWidth="1.3" 
                    fill="none" 
                    strokeLinecap="round"
                  >
                    <animate attributeName="opacity" values="0.4;0.8;0.4" dur="3s" repeatCount="indefinite" begin="0.8s" />
                    <animateTransform 
                      attributeName="transform" 
                      type="translate" 
                      values="0,0; 1,-2; 0,0" 
                      dur="3s" 
                      repeatCount="indefinite" 
                      begin="0.8s"
                    />
                  </path>
                  <path 
                    d="M90 40 Q92 30 90 25 Q88 20 90 15 Q92 10 90 5" 
                    stroke="#314a60" 
                    strokeWidth="1.2" 
                    fill="none" 
                    strokeLinecap="round"
                  >
                    <animate attributeName="opacity" values="0.2;0.7;0.2" dur="2.8s" repeatCount="indefinite" begin="1.2s" />
                    <animateTransform 
                      attributeName="transform" 
                      type="translate" 
                      values="0,0; -2,-3; 0,0" 
                      dur="2.8s" 
                      repeatCount="indefinite" 
                      begin="1.2s"
                    />
                  </path>
                  <path 
                    d="M45 20 Q47 10 45 5 Q43 0 45 -5 Q47 -10 45 -15" 
                    stroke="#314a60" 
                    strokeWidth="1.4" 
                    fill="none" 
                    strokeLinecap="round"
                  >
                    <animate attributeName="opacity" values="0.35;0.85;0.35" dur="2.2s" repeatCount="indefinite" begin="1.5s" />
                    <animateTransform 
                      attributeName="transform" 
                      type="translate" 
                      values="0,0; 3,-2; 0,0" 
                      dur="2.2s" 
                      repeatCount="indefinite" 
                      begin="1.5s"
                    />
                  </path>
                </g>
              </svg>
            </div>

            {/* Tagline with Dividers */}
            <div className="flex items-center justify-center space-x-4">
              <div className="h-px bg-current w-12"></div>
              <div 
                className="uppercase tracking-widest"
                style={{ 
                  fontFamily: 'Montserrat, sans-serif',
                  fontWeight: '600',
                  fontSize: '14px',
                  letterSpacing: '0.3em'
                }}
              >
                NEW MENU EVERY WEEK
              </div>
              <div className="h-px bg-current w-12"></div>
            </div>

            {/* Decorative Elements */}
            <div className="flex justify-center py-2">
              <svg width="40" height="20" viewBox="0 0 40 20" fill="#314a60">
                <path d="M5 10 L10 5 L15 10 L20 5 L25 10 L30 5 L35 10" stroke="#314a60" strokeWidth="1" fill="none" />
              </svg>
            </div>

            {/* Phone Number */}
            <div 
              className="tracking-wider"
              style={{ 
                fontFamily: 'Roboto, sans-serif',
                fontWeight: '400',
                fontSize: '20px',
                letterSpacing: '0.15em'
              }}
            >
              279 386 4439
            </div>
          </div>
        </div>

        {/* Outer decorative border */}
        <div 
          className="absolute inset-0 border-2 pointer-events-none"
          style={{ 
            borderColor: '#314a60',
            margin: '-8px'
          }}
        ></div>
      </div>
    </div>
  );
}