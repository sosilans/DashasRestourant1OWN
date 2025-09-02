@extends('admin.layout')
@section('content')
<div class="grid cards" style="grid-template-columns:repeat(4,minmax(0,1fr))">
  <div class="card"><h3>Menu Items</h3><p>{{ $menuCount }}</p></div>
  <div class="card"><h3>Business Hours</h3><p>{{ $hoursCount }}</p></div>
  <div class="card"><h3>Pending Reviews</h3><p>{{ $pendingReviews }}</p></div>
  <div class="card"><h3>Users</h3><p>{{ $users }}</p></div>
</div>
@endsection

