@extends(''layouts.app'')
@section(''title'', ''Admin'')
@section(''body'')
<main class="container section">
  <h1>Admin Dashboard</h1>
  <p class="note">Welcome, {{ auth()->user()->name }}.</p>
</main>
@endsection
