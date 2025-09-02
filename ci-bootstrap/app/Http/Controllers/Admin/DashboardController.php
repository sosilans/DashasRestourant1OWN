<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\{MenuItem,BusinessHour,Review,User};

class DashboardController extends Controller
{
    public function index()
    {
        return view('admin.dashboard', [
            'menuCount' => MenuItem::count(),
            'hoursCount' => BusinessHour::count(),
            'pendingReviews' => Review::where('status','pending')->count(),
            'users' => User::count(),
        ]);
    }
}

