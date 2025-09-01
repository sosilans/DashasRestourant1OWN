export default function HoursLocation() {
  return (
    <section className="py-16 px-8" style={{ backgroundColor: '#f0e4d3', color: '#314a60' }}>
      <div className="max-w-6xl mx-auto">
        <div className="relative">
          {/* Main frame */}
          <div 
            className="relative border-4 border-double p-12"
            style={{ borderColor: '#314a60' }}
          >
            {/* Corner ornaments */}
            <div className="absolute top-2 left-2 w-6 h-6 border-l-2 border-t-2" style={{ borderColor: '#B49560' }}></div>
            <div className="absolute top-2 right-2 w-6 h-6 border-r-2 border-t-2" style={{ borderColor: '#B49560' }}></div>
            <div className="absolute bottom-2 left-2 w-6 h-6 border-l-2 border-b-2" style={{ borderColor: '#B49560' }}></div>
            <div className="absolute bottom-2 right-2 w-6 h-6 border-r-2 border-b-2" style={{ borderColor: '#B49560' }}></div>

            <div className="grid md:grid-cols-2 gap-12">
              {/* Hours Section */}
              <div className="space-y-6">
                <div className="flex items-center space-x-4 mb-6">
                  {/* Clock icon */}
                  <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                    <circle 
                      cx="20" 
                      cy="20" 
                      r="18" 
                      stroke="#B49560" 
                      strokeWidth="2"
                    />
                    <line x1="20" y1="20" x2="20" y2="10" stroke="#314a60" strokeWidth="2" strokeLinecap="round" />
                    <line x1="20" y1="20" x2="28" y2="20" stroke="#314a60" strokeWidth="2" strokeLinecap="round" />
                    <circle cx="20" cy="20" r="2" fill="#B49560" />
                    <circle cx="20" cy="5" r="1" fill="#314a60" />
                    <circle cx="35" cy="20" r="1" fill="#314a60" />
                    <circle cx="20" cy="35" r="1" fill="#314a60" />
                    <circle cx="5" cy="20" r="1" fill="#314a60" />
                  </svg>
                  
                  <div 
                    className="uppercase tracking-wide"
                    style={{
                      fontFamily: 'Bebas Neue, sans-serif',
                      fontSize: '2.5rem',
                      color: '#314a60'
                    }}
                  >
                    Hours
                  </div>
                </div>

                <div className="space-y-4">
                  <div className="flex justify-between items-center border-b border-dashed border-opacity-30 pb-2" style={{ borderColor: '#314a60' }}>
                    <div 
                      style={{
                        fontFamily: 'Montserrat, sans-serif',
                        fontSize: '16px',
                        fontWeight: '600',
                        color: '#314a60'
                      }}
                    >
                      Monday - Friday
                    </div>
                    <div 
                      style={{
                        fontFamily: 'Roboto, sans-serif',
                        fontSize: '16px',
                        color: '#B49560'
                      }}
                    >
                      11:00 AM - 7:00 PM
                    </div>
                  </div>

                  <div className="flex justify-between items-center border-b border-dashed border-opacity-30 pb-2" style={{ borderColor: '#314a60' }}>
                    <div 
                      style={{
                        fontFamily: 'Montserrat, sans-serif',
                        fontSize: '16px',
                        fontWeight: '600',
                        color: '#314a60'
                      }}
                    >
                      Saturday
                    </div>
                    <div 
                      style={{
                        fontFamily: 'Roboto, sans-serif',
                        fontSize: '16px',
                        color: '#B49560'
                      }}
                    >
                      11:00 AM - 10:30 PM
                    </div>
                  </div>

                  <div className="flex justify-between items-center border-b border-dashed border-opacity-30 pb-2" style={{ borderColor: '#314a60' }}>
                    <div 
                      style={{
                        fontFamily: 'Montserrat, sans-serif',
                        fontSize: '16px',
                        fontWeight: '600',
                        color: '#314a60'
                      }}
                    >
                      Sunday
                    </div>
                    <div 
                      style={{
                        fontFamily: 'Roboto, sans-serif',
                        fontSize: '16px',
                        color: '#B49560'
                      }}
                    >
                      11:00 AM - 10:30 PM
                    </div>
                  </div>
                </div>

                {/* Special note */}
                <div className="mt-6 p-4 border-2" style={{ borderColor: '#B49560', backgroundColor: 'rgba(180, 149, 96, 0.05)' }}>
                  <div 
                    className="text-center"
                    style={{
                      fontFamily: 'Roboto, sans-serif',
                      fontSize: '14px',
                      fontStyle: 'italic',
                      color: '#314a60'
                    }}
                  >
                    Reservations recommended for dinner service
                  </div>
                </div>
              </div>

              {/* Location Section */}
              <div className="space-y-6">
                <div className="flex items-center space-x-4 mb-6">
                  {/* Map icon */}
                  <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                    <path 
                      d="M20 4 C14 4 9 9 9 15 C9 23 20 36 20 36 C20 36 31 23 31 15 C31 9 26 4 20 4 Z" 
                      stroke="#B49560" 
                      strokeWidth="2" 
                      fill="rgba(180, 149, 96, 0.1)"
                    />
                    <circle cx="20" cy="15" r="4" stroke="#314a60" strokeWidth="2" fill="#B49560" />
                  </svg>
                  
                  <div 
                    className="uppercase tracking-wide"
                    style={{
                      fontFamily: 'Bebas Neue, sans-serif',
                      fontSize: '2.5rem',
                      color: '#314a60'
                    }}
                  >
                    Location
                  </div>
                </div>

                <div className="space-y-4">
                  <div 
                    style={{
                      fontFamily: 'Montserrat, sans-serif',
                      fontSize: '18px',
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
                      lineHeight: '1.6',
                      color: '#314a60'
                    }}
                  >
                    1120 Fulton Ave Suite N<br />
                    Sacramento, CA 95825
                  </div>

                  <div 
                    className="pt-4"
                    style={{
                      fontFamily: 'Roboto, sans-serif',
                      fontSize: '18px',
                      fontWeight: '600',
                      color: '#B49560',
                      letterSpacing: '0.1em'
                    }}
                  >
                    (279) 386-4439
                  </div>
                </div>

                {/* Map placeholder */}
                <div 
                  className="relative border-2 p-6 h-40"
                  style={{ 
                    borderColor: '#B49560',
                    backgroundColor: 'rgba(180, 149, 96, 0.05)'
                  }}
                >
                  <div className="absolute inset-0 flex items-center justify-center">
                    <svg width="120" height="80" viewBox="0 0 120 80" fill="none">
                      {/* Stylized map */}
                      <rect x="10" y="10" width="100" height="60" stroke="#B49560" strokeWidth="2" fill="none" />
                      
                      {/* Streets */}
                      <line x1="10" y1="30" x2="110" y2="30" stroke="#314a60" strokeWidth="1" opacity="0.3" />
                      <line x1="10" y1="50" x2="110" y2="50" stroke="#314a60" strokeWidth="1" opacity="0.3" />
                      <line x1="40" y1="10" x2="40" y2="70" stroke="#314a60" strokeWidth="1" opacity="0.3" />
                      <line x1="80" y1="10" x2="80" y2="70" stroke="#314a60" strokeWidth="1" opacity="0.3" />
                      
                      {/* Restaurant marker */}
                      <circle cx="60" cy="40" r="4" fill="#B49560" />
                      <path d="M60 30 C57 30 55 32 55 35 C55 40 60 48 60 48 C60 48 65 40 65 35 C65 32 63 30 60 30 Z" fill="#314a60" />
                      <circle cx="60" cy="35" r="2" fill="#B49560" />
                    </svg>
                  </div>
                  
                  <div 
                    className="absolute bottom-2 right-2"
                    style={{
                      fontFamily: 'Roboto, sans-serif',
                      fontSize: '12px',
                      color: '#314a60',
                      opacity: '0.6'
                    }}
                  >
                    Sacramento, CA
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Outer decorative border */}
          <div 
            className="absolute inset-0 border-2 pointer-events-none"
            style={{ 
              borderColor: '#B49560',
              margin: '-8px'
            }}
          ></div>
        </div>
      </div>
    </section>
  );
}