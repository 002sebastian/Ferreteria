<?php
namespace App\Http\Controllers;

use App\Models\Producto;

class ProductoController extends Controller
{
    public function index()
    {
        $productos = Producto::with('categoria')->orderBy('nombre')->paginate(12);
        return view('producto.index', compact('productos'));
    }

    public function show(Producto $producto)
    {
        $producto->load('categoria');
        return view('producto.show', compact('producto'));
    }
}
