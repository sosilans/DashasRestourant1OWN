<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ReviewController;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Session;

Route::get('/', [HomeController::class, 'index'])->name('home');

// Locale switcher (EN/IT/ES)
Route::get('/locale/{locale}', function ($locale) {
    $allowed = ['en','it','es'];
    if (in_array($locale, $allowed, true)) {
        Session::put('locale', $locale);
    }
    return back();
})->name('locale.set');

Route::middleware('auth')->group(function() {
    Route::post('/reviews', [ReviewController::class, 'store'])->name('reviews.store');
    // Admin panel (simple)
    Route::middleware('role:admin')->prefix('admin')->name('admin.')->group(function () {
        Route::get('/', [\App\Http\Controllers\Admin\DashboardController::class,'index'])->name('dashboard');
        Route::get('/reviews', [\App\Http\Controllers\Admin\ReviewAdminController::class,'index'])->name('reviews');
        Route::post('/reviews/{id}/approve', [\App\Http\Controllers\Admin\ReviewAdminController::class,'approve'])->name('reviews.approve');
        Route::delete('/reviews/{id}', [\App\Http\Controllers\Admin\ReviewAdminController::class,'destroy'])->name('reviews.delete');

        Route::get('/menu', [\App\Http\Controllers\Admin\MenuItemController::class,'index'])->name('menu.index');
        Route::get('/menu/create', [\App\Http\Controllers\Admin\MenuItemController::class,'create'])->name('menu.create');
        Route::post('/menu', [\App\Http\Controllers\Admin\MenuItemController::class,'store'])->name('menu.store');
        Route::get('/menu/{item}/edit', [\App\Http\Controllers\Admin\MenuItemController::class,'edit'])->name('menu.edit');
        Route::put('/menu/{item}', [\App\Http\Controllers\Admin\MenuItemController::class,'update'])->name('menu.update');
        Route::delete('/menu/{item}', [\App\Http\Controllers\Admin\MenuItemController::class,'destroy'])->name('menu.delete');

        Route::get('/hours', [\App\Http\Controllers\Admin\BusinessHourController::class,'index'])->name('hours.index');
        Route::post('/hours', [\App\Http\Controllers\Admin\BusinessHourController::class,'update'])->name('hours.update');
    });
});
