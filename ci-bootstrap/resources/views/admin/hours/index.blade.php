@extends('admin.layout')
@section('content')
<h2 style="margin-bottom:12px">Business Hours</h2>
@if(session('status'))<p class="note">{{ session('status') }}</p>@endif
<form class="card" method="post" action="{{ route('admin.hours.update') }}">
  @csrf
  <table style="width:100%;border-collapse:collapse">
    <thead><tr><th style="text-align:left">Day</th><th>Open</th><th>Close</th><th>Note</th></tr></thead>
    <tbody>
      @foreach($hours as $h)
      <tr>
        <td>{{ ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'][$h->day] }}</td>
        <td><input type="time" name="hours[{{ $h->id }}][open_time]" value="{{ $h->open_time }}"></td>
        <td><input type="time" name="hours[{{ $h->id }}][close_time]" value="{{ $h->close_time }}"></td>
        <td><input type="text" name="hours[{{ $h->id }}][note]" value="{{ $h->note }}"></td>
      </tr>
      @endforeach
    </tbody>
  </table>
  <button class="btn primary" type="submit" style="margin-top:12px">Save</button>
  </form>
@endsection

