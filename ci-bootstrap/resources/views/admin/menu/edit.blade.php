@extends('admin.layout')
@section('content')
<h2 style="margin-bottom:12px">Edit Menu Item</h2>
<form class="card" method="post" action="{{ route('admin.menu.update',$item) }}">
  @csrf @method('put')
  <div class="grid two">
    <label><span>Name</span><input name="name" value="{{ $item->name }}" required></label>
    <label><span>Price</span><input name="price_decimal" type="number" step="0.01" min="0" value="{{ $item->price_decimal }}" required></label>
    <label><span>Emoji</span><input name="emoji" maxlength="8" value="{{ $item->emoji }}"></label>
    <label><span>Sort</span><input name="sort" type="number" min="0" value="{{ $item->sort }}"></label>
    <label class="grid-col-span-2"><span>Description</span><textarea name="description" rows="3">{{ $item->description }}</textarea></label>
  </div>
  <button class="btn primary" type="submit">Save</button>
</form>
@endsection

