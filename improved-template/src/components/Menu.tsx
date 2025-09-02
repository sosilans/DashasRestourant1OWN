export default function Menu() {
  const menuSections = {
    Pizza: [
      { name: "Margherita Classica", description: "San Marzano tomatoes, fresh mozzarella, basil, extra virgin olive oil", price: "$18" },
      { name: "Prosciutto e Funghi", description: "Tomato base, mozzarella, prosciutto di Parma, mushrooms, arugula", price: "$24" },
      { name: "Quattro Stagioni", description: "Artichokes, ham, mushrooms, olives, representing four seasons", price: "$22" },
      { name: "Diavola", description: "Spicy salami, mozzarella, fresh chili peppers, oregano", price: "$20" }
    ],
    Pasta: [
      { name: "Spaghetti Carbonara", description: "Eggs, pecorino Romano, guanciale, black pepper", price: "$19" },
      { name: "Fettuccine Alfredo", description: "Fresh fettuccine, parmigiano-reggiano, butter, cream", price: "$17" },
      { name: "Penne all'Arrabbiata", description: "Penne pasta, spicy tomato sauce, garlic, red chilies", price: "$16" },
      { name: "Lasagna della Nonna", description: "Layers of pasta, meat sauce, béchamel, mozzarella", price: "$21" }
    ],
    Salads: [
      { name: "Insalata Caprese", description: "Fresh mozzarella, tomatoes, basil, balsamic glaze", price: "$14" },
      { name: "Caesar Italiana", description: "Romaine, parmigiano, anchovies, garlic croutons", price: "$13" },
      { name: "Rucola e Parmigiano", description: "Arugula, shaved parmesan, lemon vinaigrette, pine nuts", price: "$12" }
    ],
    Desserts: [
      { name: "Tiramisu della Casa", description: "Ladyfingers, espresso, mascarpone, cocoa powder", price: "$9" },
      { name: "Panna Cotta", description: "Vanilla bean custard with berry compote", price: "$8" },
      { name: "Cannoli Siciliani", description: "Crispy shells filled with sweet ricotta and chocolate chips", price: "$10" }
    ]
  };

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

            {/* Title */}
            <div className="text-center mb-12">
              <div 
                className="uppercase tracking-wide"
                style={{
                  fontFamily: 'Bebas Neue, sans-serif',
                  fontSize: '4rem',
                  lineHeight: '1.1',
                  color: '#314a60'
                }}
              >
                MENU
              </div>
              
              {/* Decorative element */}
              <div className="flex justify-center py-4">
                <svg width="60" height="30" viewBox="0 0 60 30" fill="none">
                  <path 
                    d="M5 15 L15 5 L25 15 L35 5 L45 15 L55 5" 
                    stroke="#B49560" 
                    strokeWidth="2" 
                    fill="none" 
                  />
                  <circle cx="30" cy="15" r="3" fill="#B49560" />
                </svg>
              </div>
            </div>

            {/* Menu Grid */}
            <div className="grid md:grid-cols-2 gap-12">
              {Object.entries(menuSections).map(([category, items]) => (
                <div key={category} className="space-y-6">
                  {/* Category Title */}
                  <div className="text-center">
                    <div 
                      className="uppercase tracking-wide mb-4"
                      style={{
                        fontFamily: 'Bebas Neue, sans-serif',
                        fontSize: '2rem',
                        color: '#B49560'
                      }}
                    >
                      {category}
                    </div>
                    <div className="h-px w-20 mx-auto" style={{ backgroundColor: '#B49560' }}></div>
                  </div>

                  {/* Items */}
                  <div className="space-y-4">
                    {items.map((item, index) => (
                      <div key={index} className="border-b border-dashed border-opacity-30 pb-4" style={{ borderColor: '#314a60' }}>
                        <div className="flex justify-between items-start">
                          <div className="flex-1 pr-4">
                            <div 
                              className="mb-2"
                              style={{
                                fontFamily: 'Montserrat, sans-serif',
                                fontSize: '18px',
                                fontWeight: '600',
                                color: '#314a60'
                              }}
                            >
                              {item.name}
                            </div>
                            <div 
                              style={{
                                fontFamily: 'Roboto, sans-serif',
                                fontSize: '14px',
                                lineHeight: '1.6',
                                color: '#314a60',
                                opacity: '0.8'
                              }}
                            >
                              {item.description}
                            </div>
                          </div>
                          <div 
                            className="flex-shrink-0"
                            style={{
                              fontFamily: 'Montserrat, sans-serif',
                              fontSize: '18px',
                              fontWeight: '600',
                              color: '#B49560'
                            }}
                          >
                            {item.price}
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              ))}
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