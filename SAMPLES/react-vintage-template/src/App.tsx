import VintageHero from './components/VintageHero';
import AboutUs from './components/AboutUs';
import Menu from './components/Menu';
import Specials from './components/Specials';
import Reviews from './components/Reviews';
import HoursLocation from './components/HoursLocation';
import Footer from './components/Footer';

export default function App() {
  return (
    <>
      {/* Google Fonts */}
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
      <link 
        href="https://fonts.googleapis.com/css2?family=Bebas+Neue:wght@400&family=Montserrat:wght@600&family=Roboto:wght@400&display=swap" 
        rel="stylesheet" 
      />
      
      <div className="overflow-x-hidden">
        <VintageHero />
        <AboutUs />
        <Menu />
        <Specials />
        <Reviews />
        <HoursLocation />
        <Footer />
      </div>
    </>
  );
}