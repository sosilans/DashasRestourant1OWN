<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Review;
use Illuminate\Http\RedirectResponse;

class ReviewAdminController extends Controller
{
    public function index()
    {
        $pending = Review::where('status','pending')->latest()->paginate(20);
        $approved = Review::where('status','approved')->latest()->paginate(20);
        return view('admin.reviews.index', compact('pending','approved'));
    }

    public function approve(int $id): RedirectResponse
    {
        $r = Review::findOrFail($id);
        $r->status = 'approved';
        $r->save();
        return back()->with('status','Review approved');
    }

    public function destroy(int $id): RedirectResponse
    {
        Review::whereKey($id)->delete();
        return back()->with('status','Review deleted');
    }
}

