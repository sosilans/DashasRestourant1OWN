<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>@yield('title', "Daria’s Italian Kitchen")</title>
    <meta name="description" content="Authentic Italian cuisine, handmade pastas, and warm hospitality." />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}" />
    @vite(["resources/css/app.css","resources/js/app.js"]) {{-- keep Vite wiring for future --}}
  </head>
  <body>
    @yield('body')
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js" crossorigin="anonymous"></script>
    <script src="{{ asset('js/main.js') }}" defer></script>
  </body>
</html>
