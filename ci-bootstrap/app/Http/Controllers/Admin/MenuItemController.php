<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\MenuItem;
use Illuminate\Http\Request;

class MenuItemController extends Controller
{
    public function index()
    {
        $items = MenuItem::orderBy('sort')->get();
        return view('admin.menu.index', compact('items'));
    }

    public function create()
    {
        return view('admin.menu.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required','string','max:255'],
            'description' => ['nullable','string'],
            'price_decimal' => ['required','numeric','min:0'],
            'emoji' => ['nullable','string','max:8'],
            'sort' => ['nullable','integer','min:0'],
        ]);
        MenuItem::create($data);
        return redirect()->route('admin.menu.index')->with('status','Item created');
    }

    public function edit(MenuItem $item)
    {
        return view('admin.menu.edit', compact('item'));
    }

    public function update(Request $request, MenuItem $item)
    {
        $data = $request->validate([
            'name' => ['required','string','max:255'],
            'description' => ['nullable','string'],
            'price_decimal' => ['required','numeric','min:0'],
            'emoji' => ['nullable','string','max:8'],
            'sort' => ['nullable','integer','min:0'],
        ]);
        $item->update($data);
        return redirect()->route('admin.menu.index')->with('status','Item updated');
    }

    public function destroy(MenuItem $item)
    {
        $item->delete();
        return redirect()->route('admin.menu.index')->with('status','Item deleted');
    }
}

