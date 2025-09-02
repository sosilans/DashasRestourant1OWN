import dreamDigitalLogo from 'figma:asset/26fe5b5befab7ba240df6056ed60a27382c6d00c.png';

export default function Footer() {
  return (
    <footer className="py-12 px-8" style={{ backgroundColor: '#f0e4d3', color: '#314a60' }}>
      <div className="max-w-4xl mx-auto">
        <div className="relative">
          {/* Simple frame */}
          <div 
            className="relative border-2 p-8"
            style={{ borderColor: '#314a60' }}
          >
            {/* Corner ornaments */}
            <div className="absolute top-1 left-1 w-4 h-4 border-l-2 border-t-2" style={{ borderColor: '#B49560' }}></div>
            <div className="absolute top-1 right-1 w-4 h-4 border-r-2 border-t-2" style={{ borderColor: '#B49560' }}></div>
            <div className="absolute bottom-1 left-1 w-4 h-4 border-l-2 border-b-2" style={{ borderColor: '#B49560' }}></div>
            <div className="absolute bottom-1 right-1 w-4 h-4 border-r-2 border-b-2" style={{ borderColor: '#B49560' }}></div>

            <div className="grid md:grid-cols-3 gap-8 items-center">
              {/* Contact Info */}
              <div className="text-center md:text-left space-y-2">
                <div 
                  style={{
                    fontFamily: 'Montserrat, sans-serif',
                    fontSize: '16px',
                    fontWeight: '600',
                    color: '#314a60'
                  }}
                >
                  Daria's Kitchen
                </div>
                <div 
                  style={{
                    fontFamily: 'Roboto, sans-serif',
                    fontSize: '16px',
                    color: '#B49560',
                    letterSpacing: '0.1em'
                  }}
                >
                  (279) 386-4439
                </div>
                <div 
                  style={{
                    fontFamily: 'Roboto, sans-serif',
                    fontSize: '14px',
                    color: '#314a60'
                  }}
                >
                  1120 Fulton Ave Suite N<br />
                  Sacramento, CA 95825
                </div>
              </div>

              {/* Central illustration */}
              <div className="flex justify-center">
                <svg width="80" height="80" viewBox="0 0 80 80" fill="none">
                  {/* Olive branch */}
                  <path 
                    d="M20 40 Q30 30 40 40 Q50 50 60 40" 
                    stroke="#16A34A" 
                    strokeWidth="3" 
                    fill="none"
                    strokeLinecap="round"
                  />
                  
                  {/* Olives */}
                  <ellipse cx="25" cy="38" rx="3" ry="4" fill="#16A34A" />
                  <ellipse cx="35" cy="42" rx="3" ry="4" fill="#16A34A" />
                  <ellipse cx="45" cy="38" rx="3" ry="4" fill="#16A34A" />
                  <ellipse cx="55" cy="42" rx="3" ry="4" fill="#16A34A" />
                  
                  {/* Leaves */}
                  <ellipse cx="28" cy="35" rx="2" ry="5" fill="#22C55E" transform="rotate(45 28 35)" />
                  <ellipse cx="38" cy="45" rx="2" ry="5" fill="#22C55E" transform="rotate(-45 38 45)" />
                  <ellipse cx="48" cy="35" rx="2" ry="5" fill="#22C55E" transform="rotate(45 48 35)" />
                  <ellipse cx="58" cy="45" rx="2" ry="5" fill="#22C55E" transform="rotate(-45 58 45)" />
                  
                  {/* Decorative border */}
                  <circle cx="40" cy="40" r="35" stroke="#B49560" strokeWidth="1" fill="none" opacity="0.3" />
                </svg>
              </div>

              {/* Social Media */}
              <div className="text-center md:text-right space-y-4">
                <div 
                  style={{
                    fontFamily: 'Montserrat, sans-serif',
                    fontSize: '14px',
                    fontWeight: '600',
                    color: '#314a60',
                    letterSpacing: '0.1em'
                  }}
                >
                  FOLLOW US
                </div>
                
                <div className="flex justify-center md:justify-end space-x-4">
                  {/* Instagram */}
                  <div className="p-2 border border-opacity-30 hover:bg-opacity-10 transition-colors" style={{ borderColor: '#314a60' }}>
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                      <rect x="2" y="2" width="16" height="16" rx="4" stroke="#314a60" strokeWidth="1.5" />
                      <circle cx="10" cy="10" r="3" stroke="#314a60" strokeWidth="1.5" />
                      <circle cx="15" cy="5" r="1" fill="#314a60" />
                    </svg>
                  </div>
                  
                  {/* Facebook */}
                  <div className="p-2 border border-opacity-30 hover:bg-opacity-10 transition-colors" style={{ borderColor: '#314a60' }}>
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                      <path d="M18 10 C18 5.5 14.5 2 10 2 C5.5 2 2 5.5 2 10 C2 14 4.9 17.3 8.8 17.9 L8.8 12.7 L6.9 12.7 L6.9 10 L8.8 10 L8.8 8.2 C8.8 6.4 9.9 5.4 11.5 5.4 C12.3 5.4 13.1 5.6 13.1 5.6 L13.1 7.4 L12.2 7.4 C11.3 7.4 11 7.9 11 8.5 L11 10 L13 10 L12.7 12.7 L11 12.7 L11 17.9 C14.9 17.3 18 14 18 10 Z" stroke="#314a60" strokeWidth="1.5" fill="none" />
                    </svg>
                  </div>
                  
                  {/* TripAdvisor */}
                  <div className="p-2 border border-opacity-30 hover:bg-opacity-10 transition-colors" style={{ borderColor: '#314a60' }}>
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                      <circle cx="6" cy="10" r="3" stroke="#314a60" strokeWidth="1.5" />
                      <circle cx="14" cy="10" r="3" stroke="#314a60" strokeWidth="1.5" />
                      <path d="M3 10 L6 7" stroke="#314a60" strokeWidth="1.5" />
                      <path d="M17 10 L14 7" stroke="#314a60" strokeWidth="1.5" />
                      <circle cx="10" cy="6" r="1.5" fill="#314a60" />
                    </svg>
                  </div>
                </div>
              </div>
            </div>

            {/* Bottom section */}
            <div className="mt-8 pt-4 border-t border-dashed border-opacity-30" style={{ borderColor: '#314a60' }}>
              <div className="flex flex-col items-center space-y-4">
                <div 
                  style={{
                    fontFamily: 'Roboto, sans-serif',
                    fontSize: '12px',
                    color: '#314a60',
                    opacity: '0.7',
                    textAlign: 'center'
                  }}
                >
                  © 2024 Daria's Kitchen. All rights reserved.<br />
                  Family recipes from Tuscany • Serving authentic Italian cuisine with love
                </div>
                
                {/* Dream Digital Credit */}
                <div className="flex items-center space-x-3">
                  <div 
                    style={{
                      fontFamily: 'Roboto, sans-serif',
                      fontSize: '11px',
                      color: '#314a60',
                      opacity: '0.6'
                    }}
                  >
                    Website created by
                  </div>
                  <img 
                    src={dreamDigitalLogo} 
                    alt="Dream Digital" 
                    className="h-20 opacity-70"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}