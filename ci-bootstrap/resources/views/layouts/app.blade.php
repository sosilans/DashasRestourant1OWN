<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>@yield('title', "Dar'ya's Kitchen")</title>
    <meta name="description" content="Authentic Italian cuisine, handmade pastas, and warm hospitality." />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}?v={{ filemtime(public_path('css/styles.css')) }}" />
    {{-- Vite bundle is disabled on production to avoid overriding static CSS. --}}
    {{-- Enable only if you explicitly build assets and want to use them. --}}
    {{-- @vite(['resources/css/app.css','resources/js/app.js']) --}}
  </head>
  <body>
    <nav class="menu" style="position:fixed;right:12px;top:8px;z-index:60;gap:8px">
      <a class="btn" href="{{ route('locale.set','en') }}">EN</a>
      <a class="btn" href="{{ route('locale.set','it') }}">IT</a>
      <a class="btn" href="{{ route('locale.set','es') }}">ES</a>
    </nav>
    @yield('body')
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js" crossorigin="anonymous"></script>
    <script src="{{ asset('js/main.js') }}?v={{ filemtime(public_path('js/main.js')) }}" defer></script>
  </body>
</html>
