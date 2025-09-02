@extends('layouts.app')
@section('body')
<main class="container section">
  <nav class="menu" style="margin-bottom:16px; gap:12px; flex-wrap:wrap;">
    <a class="btn" href="{{ route('admin.dashboard') }}">Dashboard</a>
    <a class="btn" href="{{ route('admin.reviews') }}">Reviews</a>
    <a class="btn" href="{{ route('admin.menu.index') }}">Menu</a>
    <a class="btn" href="{{ route('admin.hours.index') }}">Hours</a>
  </nav>
  @yield('content')
</main>
@endsection

