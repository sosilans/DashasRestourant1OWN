export default function Reviews() {
  const reviews = [
    {
      name: "Maria Benedetto",
      text: "The most authentic Italian experience outside of Italy! The handmade pasta reminds me of my grandmother's cooking.",
      rating: 5
    },
    {
      name: "James Wilson",
      text: "Outstanding service and incredible flavors. The pizza margherita is perfection - simple yet extraordinary.",
      rating: 5
    },
    {
      name: "Sofia Rodriguez",
      text: "A hidden gem! The weekly specials are always a delightful surprise. Highly recommend the tiramisu.",
      rating: 5
    },
    {
      name: "Giuseppe Marino",
      text: "Finally, a place that understands true Italian cuisine. The carbonara is exactly as it should be - perfetto!",
      rating: 5
    }
  ];

  return (
    <section className="py-16 px-8" style={{ backgroundColor: '#f0e4d3', color: '#314a60' }}>
      <div className="max-w-6xl mx-auto">
        {/* Title */}
        <div className="text-center mb-12">
          <div 
            className="uppercase tracking-wide"
            style={{
              fontFamily: 'Bebas Neue, sans-serif',
              fontSize: '3.5rem',
              lineHeight: '1.1',
              color: '#314a60'
            }}
          >
            What Our Guests Say
          </div>
          
          {/* Decorative element */}
          <div className="flex justify-center py-4">
            <svg width="80" height="30" viewBox="0 0 80 30" fill="none">
              <path 
                d="M10 15 L20 5 L30 15 L40 5 L50 15 L60 5 L70 15" 
                stroke="#B49560" 
                strokeWidth="2" 
                fill="none" 
              />
              <circle cx="40" cy="15" r="4" fill="#B49560" fillOpacity="0.3" />
            </svg>
          </div>
        </div>

        {/* Reviews Grid */}
        <div className="grid md:grid-cols-2 gap-8">
          {reviews.map((review, index) => (
            <div key={index} className="relative">
              {/* Newspaper-style card */}
              <div 
                className="relative border-2 p-6"
                style={{ 
                  borderColor: '#314a60',
                  backgroundColor: 'rgba(255, 255, 255, 0.3)',
                  transform: index % 2 === 0 ? 'rotate(-1deg)' : 'rotate(1deg)'
                }}
              >
                {/* Vintage newspaper corners */}
                <div className="absolute top-1 left-1 w-3 h-3 border-l-2 border-t-2" style={{ borderColor: '#B49560' }}></div>
                <div className="absolute top-1 right-1 w-3 h-3 border-r-2 border-t-2" style={{ borderColor: '#B49560' }}></div>
                <div className="absolute bottom-1 left-1 w-3 h-3 border-l-2 border-b-2" style={{ borderColor: '#B49560' }}></div>
                <div className="absolute bottom-1 right-1 w-3 h-3 border-r-2 border-b-2" style={{ borderColor: '#B49560' }}></div>

                <div className="space-y-4">
                  {/* Stars */}
                  <div className="flex space-x-1">
                    {[...Array(review.rating)].map((_, i) => (
                      <svg key={i} width="16" height="16" viewBox="0 0 16 16" fill="#B49560">
                        <path d="M8 1 L9.5 5.5 L14 5.5 L10.5 8.5 L12 13 L8 10 L4 13 L5.5 8.5 L2 5.5 L6.5 5.5 Z" />
                      </svg>
                    ))}
                  </div>

                  {/* Quote */}
                  <div 
                    className="relative"
                    style={{
                      fontFamily: 'Roboto, sans-serif',
                      fontSize: '16px',
                      lineHeight: '1.7',
                      color: '#314a60',
                      fontStyle: 'italic'
                    }}
                  >
                    <span 
                      className="absolute -top-2 -left-2"
                      style={{
                        fontFamily: 'Bebas Neue, sans-serif',
                        fontSize: '3rem',
                        color: '#B49560',
                        opacity: '0.3'
                      }}
                    >
                      "
                    </span>
                    {review.text}
                    <span 
                      className="absolute -bottom-4 -right-2"
                      style={{
                        fontFamily: 'Bebas Neue, sans-serif',
                        fontSize: '3rem',
                        color: '#B49560',
                        opacity: '0.3'
                      }}
                    >
                      "
                    </span>
                  </div>

                  {/* Divider */}
                  <div className="flex items-center space-x-3">
                    <div className="h-px flex-1" style={{ backgroundColor: '#B49560' }}></div>
                    <svg width="12" height="12" viewBox="0 0 12 12" fill="#B49560">
                      <circle cx="6" cy="6" r="2" />
                    </svg>
                    <div className="h-px flex-1" style={{ backgroundColor: '#B49560' }}></div>
                  </div>

                  {/* Name */}
                  <div 
                    className="text-center"
                    style={{
                      fontFamily: 'Montserrat, sans-serif',
                      fontSize: '16px',
                      fontWeight: '600',
                      color: '#314a60',
                      letterSpacing: '0.05em'
                    }}
                  >
                    — {review.name}
                  </div>
                </div>
              </div>

              {/* Shadow effect */}
              <div 
                className="absolute inset-0 border-2 -z-10"
                style={{ 
                  borderColor: '#314a60',
                  backgroundColor: 'rgba(49, 74, 96, 0.1)',
                  transform: `translate(4px, 4px) ${index % 2 === 0 ? 'rotate(-1deg)' : 'rotate(1deg)'}`
                }}
              ></div>
            </div>
          ))}
        </div>

        {/* Bottom decorative element */}
        <div className="flex justify-center mt-12">
          <svg width="120" height="40" viewBox="0 0 120 40" fill="none">
            <path 
              d="M10 20 Q30 10 60 20 Q90 30 110 20" 
              stroke="#B49560" 
              strokeWidth="2" 
              fill="none"
            />
            <circle cx="30" cy="17" r="2" fill="#314a60" />
            <circle cx="60" cy="20" r="3" fill="#B49560" />
            <circle cx="90" cy="23" r="2" fill="#314a60" />
          </svg>
        </div>
      </div>
    </section>
  );
}