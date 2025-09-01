export default function Specials() {
  return (
    <section className="py-16 px-8" style={{ backgroundColor: '#f0e4d3', color: '#314a60' }}>
      <div className="max-w-4xl mx-auto">
        <div className="relative">
          {/* Thick highlighted frame */}
          <div 
            className="relative border-8 border-double p-16"
            style={{ 
              borderColor: '#B49560',
              backgroundColor: 'rgba(180, 149, 96, 0.05)'
            }}
          >
            {/* Enhanced corner ornaments */}
            <div className="absolute top-4 left-4 w-8 h-8 border-l-4 border-t-4" style={{ borderColor: '#314a60' }}></div>
            <div className="absolute top-4 right-4 w-8 h-8 border-r-4 border-t-4" style={{ borderColor: '#314a60' }}></div>
            <div className="absolute bottom-4 left-4 w-8 h-8 border-l-4 border-b-4" style={{ borderColor: '#314a60' }}></div>
            <div className="absolute bottom-4 right-4 w-8 h-8 border-r-4 border-b-4" style={{ borderColor: '#314a60' }}></div>

            <div className="text-center space-y-8">
              {/* Title */}
              <div 
                className="uppercase tracking-wide"
                style={{
                  fontFamily: 'Bebas Neue, sans-serif',
                  fontSize: '3.5rem',
                  lineHeight: '1.1',
                  color: '#B49560'
                }}
              >
                NEW MENU EVERY WEEK
              </div>

              {/* Food illustrations */}
              <div className="flex justify-center items-center space-x-12 py-8">
                {/* Wine glass */}
                <svg width="60" height="80" viewBox="0 0 60 80" fill="none">
                  <path 
                    d="M15 20 Q15 35 30 40 Q45 35 45 20 L15 20" 
                    stroke="#B49560" 
                    strokeWidth="2" 
                    fill="rgba(180, 149, 96, 0.1)"
                  />
                  <line x1="30" y1="40" x2="30" y2="65" stroke="#B49560" strokeWidth="2" />
                  <line x1="20" y1="65" x2="40" y2="65" stroke="#B49560" strokeWidth="2" />
                  <path 
                    d="M17 10 L43 10" 
                    stroke="#B49560" 
                    strokeWidth="2" 
                    strokeLinecap="round"
                  />
                  <circle cx="30" cy="25" r="2" fill="#B49560" fillOpacity="0.3" />
                </svg>

                {/* Basil leaves */}
                <svg width="60" height="80" viewBox="0 0 60 80" fill="none">
                  <ellipse 
                    cx="30" 
                    cy="25" 
                    rx="8" 
                    ry="15" 
                    fill="#22C55E" 
                    fillOpacity="0.3" 
                    stroke="#16A34A" 
                    strokeWidth="2"
                  />
                  <ellipse 
                    cx="20" 
                    cy="45" 
                    rx="6" 
                    ry="12" 
                    fill="#22C55E" 
                    fillOpacity="0.3" 
                    stroke="#16A34A" 
                    strokeWidth="2" 
                    transform="rotate(-20 20 45)"
                  />
                  <ellipse 
                    cx="40" 
                    cy="45" 
                    rx="6" 
                    ry="12" 
                    fill="#22C55E" 
                    fillOpacity="0.3" 
                    stroke="#16A34A" 
                    strokeWidth="2" 
                    transform="rotate(20 40 45)"
                  />
                  <line x1="30" y1="40" x2="30" y2="65" stroke="#16A34A" strokeWidth="2" />
                </svg>

                {/* Pizza slice */}
                <svg width="80" height="80" viewBox="0 0 80 80" fill="none">
                  <path 
                    d="M40 10 L15 70 L65 70 Z" 
                    fill="rgba(244, 228, 184, 0.8)" 
                    stroke="#314a60" 
                    strokeWidth="2"
                  />
                  <path 
                    d="M15 70 L65 70" 
                    stroke="#D4A574" 
                    strokeWidth="6" 
                    strokeLinecap="round"
                  />
                  <circle cx="35" cy="35" r="3" fill="#C53030" />
                  <circle cx="50" cy="45" r="3" fill="#C53030" />
                  <circle cx="40" cy="55" r="2.5" fill="#C53030" />
                  <ellipse cx="45" cy="35" rx="2" ry="3" fill="#22C55E" transform="rotate(15 45 35)" />
                  <path 
                    d="M30 45 Q28 48 30 50" 
                    stroke="#FFFBF0" 
                    strokeWidth="2" 
                    fill="none" 
                    strokeLinecap="round"
                  />
                </svg>
              </div>

              {/* Description */}
              <div className="space-y-4">
                <p 
                  style={{
                    fontFamily: 'Roboto, sans-serif',
                    fontSize: '18px',
                    lineHeight: '1.8',
                    color: '#314a60'
                  }}
                >
                  Every Monday, our chef presents a new selection of seasonal specialties featuring the freshest ingredients and innovative interpretations of classic Italian dishes.
                </p>
                
                <div className="flex items-center justify-center space-x-6">
                  <div className="h-px w-16" style={{ backgroundColor: '#B49560' }}></div>
                  <div 
                    className="uppercase tracking-widest"
                    style={{
                      fontFamily: 'Montserrat, sans-serif',
                      fontSize: '14px',
                      fontWeight: '600',
                      color: '#B49560',
                      letterSpacing: '0.2em'
                    }}
                  >
                    AVAILABLE MONDAY - SUNDAY
                  </div>
                  <div className="h-px w-16" style={{ backgroundColor: '#B49560' }}></div>
                </div>
              </div>

              {/* Decorative flourish */}
              <div className="flex justify-center">
                <svg width="100" height="40" viewBox="0 0 100 40" fill="none">
                  <path 
                    d="M10 20 Q25 10 50 20 Q75 30 90 20" 
                    stroke="#B49560" 
                    strokeWidth="2" 
                    fill="none"
                  />
                  <circle cx="20" cy="17" r="2" fill="#B49560" />
                  <circle cx="50" cy="20" r="3" fill="#B49560" />
                  <circle cx="80" cy="23" r="2" fill="#B49560" />
                </svg>
              </div>
            </div>
          </div>

          {/* Additional outer border */}
          <div 
            className="absolute inset-0 border-4 pointer-events-none"
            style={{ 
              borderColor: '#314a60',
              margin: '-12px'
            }}
          ></div>
        </div>
      </div>
    </section>
  );
}