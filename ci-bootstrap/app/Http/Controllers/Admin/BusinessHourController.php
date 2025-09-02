<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\BusinessHour;
use Illuminate\Http\Request;

class BusinessHourController extends Controller
{
    public function index()
    {
        $hours = BusinessHour::orderBy('day')->get();
        return view('admin.hours.index', compact('hours'));
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'hours' => ['array']
        ]);
        foreach (($data['hours'] ?? []) as $id => $row) {
            BusinessHour::whereKey($id)->update([
                'open_time' => $row['open_time'] ?? null,
                'close_time' => $row['close_time'] ?? null,
                'note' => $row['note'] ?? null,
            ]);
        }
        return back()->with('status','Hours updated');
    }
}

