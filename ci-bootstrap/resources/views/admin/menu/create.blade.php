@extends('admin.layout')
@section('content')
<h2 style="margin-bottom:12px">Create Menu Item</h2>
<form class="card" method="post" action="{{ route('admin.menu.store') }}">
  @csrf
  <div class="grid two">
    <label><span>Name</span><input name="name" required></label>
    <label><span>Price</span><input name="price_decimal" type="number" step="0.01" min="0" required></label>
    <label><span>Emoji</span><input name="emoji" maxlength="8"></label>
    <label><span>Sort</span><input name="sort" type="number" min="0" value="0"></label>
    <label class="grid-col-span-2"><span>Description</span><textarea name="description" rows="3"></textarea></label>
  </div>
  <button class="btn primary" type="submit">Create</button>
</form>
@endsection

