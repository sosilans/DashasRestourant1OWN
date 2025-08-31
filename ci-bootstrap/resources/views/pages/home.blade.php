@extends(''layouts.app'')
@section(''title'', ''Daria’s Italian Kitchen'')
@section(''body'')
<header class="site-header">
  <div class="container nav">
    <div class="brand">Daria’s Italian Kitchen</div>
    <nav class="menu">
      <a href="#home">Home</a>
      <a href="#about">About</a>
      <a href="#menu">Menu</a>
      <a href="#hours">Hours</a>
      <a href="#reviews">Reviews</a>
      <a class="btn" href="#reserve">Reserve</a>
    </nav>
    <button class="hamburger" aria-label="Open menu" aria-controls="mobile-menu" aria-expanded="false">☰</button>
  </div>
  <nav id="mobile-menu" class="mobile-menu" hidden>
    <a href="#home">Home</a>
    <a href="#about">About</a>
    <a href="#menu">Menu</a>
    <a href="#hours">Hours</a>
    <a href="#reviews">Reviews</a>
    <a class="btn" href="#reserve">Reserve</a>
  </nav>
</header>
<main>
  <section id="home" class="hero">
    <div class="hero-content container">
      <h1>Tradition on Every Plate</h1>
      <p>Fresh handmade pasta, wood‑fired flavors, and family recipes refined over generations.</p>
      <div class="actions">
        <a href="#menu" class="btn primary">Explore Menu</a>
        <a href="#reserve" class="btn ghost">Book a Table</a>
      </div>
    </div>
  </section>
  <section id="about" class="about container section">
    <div class="split">
      <div>
        <h2>Our Story</h2>
        <p>Founded by Chef Daria, our kitchen celebrates the soul of Italian cooking.</p>
        <ul class="checks">
          <li>Handmade pastas daily</li>
          <li>Locally sourced produce</li>
          <li>Vegetarian and gluten‑free options</li>
        </ul>
      </div>
      <div>
        <img class="card" src="{{ asset(''assets/design/src/assets/26fe5b5befab7ba240df6056ed60a2...'') }}" alt="Chef preparing fresh pasta" onerror="this.style.display=''none''"/>
      </div>
    </div>
  </section>
  <section id="menu" class="menu section">
    <div class="container">
      <h2>Featured Menu</h2>
      <div class="grid cards">
        @foreach(($menu ?? []) as $item)
        <article class="card">
          <h3>{{ $item->name }}</h3>
          <p>{{ $item->description }}</p>
          <div class="price">${{ number_format($item->price_decimal, 2) }}</div>
        </article>
        @endforeach
      </div>
      <p class="note">Full seasonal menu available at the restaurant.</p>
    </div>
  </section>
  <section id="hours" class="hours section">
    <div class="container">
      <h2>Hours & Location</h2>
      <div class="split">
        <div>
          <ul class="hours-list">
            @foreach(($hours ?? []) as $h)
            <li><strong>{{ [''Sun'',''Mon'',''Tue'',''Wed'',''Thu'',''Fri'',''Sat''][$h->day] }}</strong> {{ $h->open_time }} – {{ $h->close_time }}</li>
            @endforeach
          </ul>
          <address>
            123 Via Roma, Your City<br/>
            <a href="tel:+10000000000">+1 (000) 000‑0000</a>
          </address>
        </div>
        <div>
          <iframe class="map" title="Map" loading="lazy" referrerpolicy="no-referrer-when-downgrade" src="https://www.openstreetmap.org/export/embed.html?bbox=12.4922%2C41.8902%2C12.4962%2C41.8922&layer=mapnik"></iframe>
        </div>
      </div>
    </div>
  </section>
  <section id="reviews" class="reviews section">
    <div class="container">
      <h2>Guest Reviews</h2>
      <div class="grid">
        @forelse(($reviews ?? []) as $r)
          <blockquote class="card">“{{ $r->body }}” — {{ optional($r->user)->name ?? ''Guest'' }}</blockquote>
        @empty
          <p class="note">No reviews yet.</p>
        @endforelse
      </div>
      @auth
      <form class="card form" method="post" action="{{ route(''reviews.store'') }}">
        @csrf
        <div class="grid two">
          <label>
            <span>Rating (1–5)</span>
            <input required type="number" name="rating" min="1" max="5" value="5" />
          </label>
          <label class="grid-col-span-2">
            <span>Review</span>
            <textarea required name="body" rows="3"></textarea>
          </label>
        </div>
        <button class="btn primary" type="submit">Submit Review</button>
        @if(session(''status''))<p class="note">{{ session(''status'') }}</p>@endif
      </form>
      @endauth
    </div>
  </section>
</main>
<footer class="site-footer">
  <div class="container">
    <div class="grid three">
      <div>
        <div class="brand">Daria’s Italian Kitchen</div>
        <p class="muted">Authentic Italian cuisine crafted with love.</p>
      </div>
      <div>
        <div class="footer-title">Visit</div>
        <p>123 Via Roma<br/>Your City</p>
      </div>
      <div>
        <div class="footer-title">Contact</div>
        <p><a href="mailto:hello@dariaskitchen.example">hello@dariaskitchen.example</a><br/>
           <a href="tel:+10000000000">+1 (000) 000‑0000</a></p>
      </div>
    </div>
    <div class="legal">© <span id="year"></span> Daria’s Italian Kitchen</div>
  </div>
</footer>
@endsection
