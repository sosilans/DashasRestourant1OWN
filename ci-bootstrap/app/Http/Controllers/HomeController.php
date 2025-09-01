<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\{MenuItem,BusinessHour,Review};
use Illuminate\Support\Facades\App as AppFacade;
use Illuminate\Support\Facades\Session;
class HomeController extends Controller
{
    public function index()
    {
        if (Session::has('locale')) {
            AppFacade::setLocale(Session::get('locale'));
        }
        $menu = MenuItem::orderBy('sort')->get();
        $hours = BusinessHour::orderBy('day')->get();
        $reviews = Review::where('status','approved')->latest()->limit(6)->get();
        return view('pages.home', compact('menu','hours','reviews'));
    }
}
