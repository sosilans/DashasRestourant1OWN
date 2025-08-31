<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ReviewController;

Route::get('/', [HomeController::class, 'index'])->name('home');

Route::middleware('auth')->group(function() {
    Route::post('/reviews', [ReviewController::class, 'store'])->name('reviews.store');
    Route::get('/admin', function() {
        $user = auth()->user();
        abort_unless($user && $user->hasRole('admin'), 403);
        return view('pages.admin');
    })->name('admin');
});
