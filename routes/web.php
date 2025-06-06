<?php

use Illuminate\Support\Facades\Route;
use App\Livewire\DrugSearch;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::view('/', 'welcome');

Route::view('profile', 'profile')
    ->middleware(['auth'])
    ->name('profile');

Route::middleware(['auth'])->group(function () {
    Route::get('/', DrugSearch::class)->name('drugs');
});

Route::get('/', DrugSearch::class)->name('drugs');

require __DIR__.'/auth.php';
