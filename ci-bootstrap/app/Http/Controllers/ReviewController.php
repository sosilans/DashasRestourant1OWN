<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Review;
class ReviewController extends Controller
{
    /** Redirect guests to login with return hash to review form */
    public function cta(Request $request)
    {
        if ($request->user()) {
            return redirect(route('home').'#review-form');
        }
        // Send guest to login and then back to home#review-form
        session(['url.intended' => route('home').'#review-form']);
        return redirect()->route('login');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'body' => ['required','string','max:2000'],
            'rating' => ['required','integer','min:1','max:5'],
        ]);
        $data['user_id'] = $request->user()->id;
        $data['status'] = 'pending';
        Review::create($data);
        return redirect()->back()->with('status','Thanks! Your review is pending approval.');
    }
}
