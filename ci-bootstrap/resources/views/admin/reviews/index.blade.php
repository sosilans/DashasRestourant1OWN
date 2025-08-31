@extends('admin.layout')
@section('content')
<h2 style="margin-bottom:12px">Pending Reviews</h2>
@if(session('status'))<p class="note">{{ session('status') }}</p>@endif
<div class="grid" style="grid-template-columns:1fr; gap:12px">
@forelse($pending as $r)
  <div class="card">
    <div style="display:flex;justify-content:space-between;align-items:center;gap:12px">
      <div>
        <strong>{{ optional($r->user)->name ?? 'Guest' }}</strong>
        <div class="note">Rating: {{ $r->rating }}</div>
        <p>{{ $r->body }}</p>
      </div>
      <form method="post" action="{{ route('admin.reviews.approve',$r->id) }}">
        @csrf
        <button class="btn primary">Approve</button>
      </form>
      <form method="post" action="{{ route('admin.reviews.delete',$r->id) }}">
        @csrf @method('delete')
        <button class="btn">Delete</button>
      </form>
    </div>
  </div>
@empty
  <p class="note">No pending reviews.</p>
@endforelse
</div>

<h2 style="margin:24px 0 12px">Approved</h2>
<div class="grid" style="grid-template-columns:1fr; gap:12px">
@foreach($approved as $r)
  <div class="card">
    <strong>{{ optional($r->user)->name ?? 'Guest' }}</strong>
    <div class="note">Rating: {{ $r->rating }}</div>
    <p>{{ $r->body }}</p>
  </div>
@endforeach
</div>
@endsection

