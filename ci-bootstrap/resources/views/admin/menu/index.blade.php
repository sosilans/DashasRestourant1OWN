@extends('admin.layout')
@section('content')
<div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:12px">
  <h2>Menu Items</h2>
  <a class="btn primary" href="{{ route('admin.menu.create') }}">Add Item</a>
</div>
@if(session('status'))<p class="note">{{ session('status') }}</p>@endif
<div class="grid cards" style="grid-template-columns:repeat(3,minmax(0,1fr))">
@foreach($items as $i)
  <div class="card">
    <h3>{{ $i->name }}</h3>
    <div class="note">{{ $i->description }}</div>
    <div class="price">${{ number_format($i->price_decimal,2) }}</div>
    <div style="display:flex;gap:8px;margin-top:8px">
      <a class="btn" href="{{ route('admin.menu.edit',$i) }}">Edit</a>
      <form method="post" action="{{ route('admin.menu.delete',$i) }}">@csrf @method('delete')
        <button class="btn">Delete</button>
      </form>
    </div>
  </div>
@endforeach
</div>
@endsection

