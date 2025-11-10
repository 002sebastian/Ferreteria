<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClienteController;

// Página de inicio
Route::view('/', 'home')->name('home');

// CRUD Clientes
Route::resource('clientes', ClienteController::class)->parameters([
    'clientes' => 'cliente'
]);
