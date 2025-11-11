<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\VentaController;

// Página de inicio
Route::view('/', 'home')->name('home');

// CRUD Clientes
Route::resource('clientes', ClienteController::class)->parameters([
    'clientes' => 'cliente'
]);

// Catálogo de productos (listar/ver)
Route::resource('productos', ProductoController::class)->only(['index','show'])
    ->parameters(['productos' => 'producto']);

// Flujo de compra (carrito en sesión) y facturación
Route::get('/venta',             [VentaController::class, 'index'])->name('venta.index');          // ver carrito
Route::post('/venta/agregar',    [VentaController::class, 'agregar'])->name('venta.agregar');      // añadir producto
Route::post('/venta/actualizar', [VentaController::class, 'actualizar'])->name('venta.actualizar');// cambiar cantidades
Route::post('/venta/quitar',     [VentaController::class, 'quitar'])->name('venta.quitar');        // quitar línea
Route::get('/venta/checkout',    [VentaController::class, 'checkout'])->name('venta.checkout');    // pantalla facturar
Route::post('/venta/facturar',   [VentaController::class, 'facturar'])->name('venta.facturar');    // crea pedido+detalles+factura
