import { ImageWithFallback } from './figma/ImageWithFallback';

export default function AboutUs() {
  return (
    <section className="py-16 px-8" style={{ backgroundColor: '#f0e4d3', color: '#314a60' }}>
      <div className="max-w-6xl mx-auto">
        <div className="relative">
          {/* Decorative frame */}
          <div 
            className="relative border-4 border-double p-12"
            style={{ borderColor: '#314a60' }}
          >
            {/* Corner ornaments */}
            <div className="absolute top-2 left-2 w-6 h-6 border-l-2 border-t-2" style={{ borderColor: '#B49560' }}></div>
            <div className="absolute top-2 right-2 w-6 h-6 border-r-2 border-t-2" style={{ borderColor: '#B49560' }}></div>
            <div className="absolute bottom-2 left-2 w-6 h-6 border-l-2 border-b-2" style={{ borderColor: '#B49560' }}></div>
            <div className="absolute bottom-2 right-2 w-6 h-6 border-r-2 border-b-2" style={{ borderColor: '#B49560' }}></div>

            <div className="grid md:grid-cols-2 gap-12 items-center">
              {/* Text Content */}
              <div className="space-y-6">
                <div 
                  className="uppercase tracking-wide"
                  style={{
                    fontFamily: 'Bebas Neue, sans-serif',
                    fontSize: '3rem',
                    lineHeight: '1.1',
                    color: '#314a60'
                  }}
                >
                  Our Story
                </div>
                
                <div className="space-y-4">
                  <p 
                    style={{
                      fontFamily: 'Roboto, sans-serif',
                      fontSize: '16px',
                      lineHeight: '1.8',
                      color: '#314a60'
                    }}
                  >
                    Welcome to Daria's Kitchen, where authentic Italian flavors meet American hospitality. Our family-owned restaurant brings generations of traditional recipes from the hills of Tuscany to your table.
                  </p>
                  
                  <p 
                    style={{
                      fontFamily: 'Roboto, sans-serif',
                      fontSize: '16px',
                      lineHeight: '1.8',
                      color: '#314a60'
                    }}
                  >
                    Every dish is crafted with passion, using locally sourced ingredients and time-honored techniques passed down through our family. We believe that great food brings people together, creating memories that last a lifetime.
                  </p>
                  
                  <p 
                    style={{
                      fontFamily: 'Roboto, sans-serif',
                      fontSize: '16px',
                      lineHeight: '1.8',
                      color: '#314a60'
                    }}
                  >
                    From our homemade pasta to our wood-fired pizzas, each meal is a celebration of Italian culinary heritage, prepared with love and served with pride.
                  </p>

                  <div className="flex items-center space-x-4 pt-4">
                    <div className="h-px w-12" style={{ backgroundColor: '#B49560' }}></div>
                    <div 
                      className="italic"
                      style={{
                        fontFamily: 'Montserrat, sans-serif',
                        fontSize: '14px',
                        fontWeight: '600',
                        color: '#B49560',
                        letterSpacing: '0.1em'
                      }}
                    >
                      "Fatto a mano con amore"
                    </div>
                    <div className="h-px w-12" style={{ backgroundColor: '#B49560' }}></div>
                  </div>
                </div>
              </div>

              {/* Image */}
              <div className="relative">
                <div 
                  className="border-2 p-2"
                  style={{ borderColor: '#B49560' }}
                >
                  <ImageWithFallback
                    src="https://images.unsplash.com/photo-1719297491070-14b0fc953a76?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjb3p5JTIwSXRhbGlhbiUyMGtpdGNoZW4lMjBjb29raW5nJTIwdmludGFnZXxlbnwxfHx8fDE3NTY1MzIyMDF8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral"
                    alt="Cozy Italian kitchen"
                    className="w-full h-80 object-cover"
                    style={{ filter: 'sepia(10%)' }}
                  />
                </div>
                
                {/* Vintage photo corners */}
                <div className="absolute -top-1 -left-1 w-4 h-4 border-l-4 border-t-4" style={{ borderColor: '#314a60' }}></div>
                <div className="absolute -top-1 -right-1 w-4 h-4 border-r-4 border-t-4" style={{ borderColor: '#314a60' }}></div>
                <div className="absolute -bottom-1 -left-1 w-4 h-4 border-l-4 border-b-4" style={{ borderColor: '#314a60' }}></div>
                <div className="absolute -bottom-1 -right-1 w-4 h-4 border-r-4 border-b-4" style={{ borderColor: '#314a60' }}></div>
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