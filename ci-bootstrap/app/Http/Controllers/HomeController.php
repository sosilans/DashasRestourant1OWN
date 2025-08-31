<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\{MenuItem,BusinessHour,Review};
class HomeController extends Controller
{
    public function index()
    {
        $menu = MenuItem::orderBy('sort')->get();
        $hours = BusinessHour::orderBy('day')->get();
        $reviews = Review::where('status','approved')->latest()->limit(6)->get();
        return view('pages.home', compact('menu','hours','reviews'));
    }
}
