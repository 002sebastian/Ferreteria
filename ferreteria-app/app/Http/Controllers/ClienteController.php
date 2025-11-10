<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use Illuminate\Http\Request;

class ClienteController extends Controller
{
    public function index()
    {
        $clientes = Cliente::orderBy('id_cliente')->paginate(10);
        return view('cliente.index', compact('clientes'));
    }

    public function create()
    {
        return view('cliente.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'id_cliente'    => 'required|integer|min:1|unique:cliente,id_cliente',
            'telefono'      => 'nullable|string|max:50',
            'rut'           => 'nullable|string|max:50',
            'nombre'        => 'required|string|max:200',
            'id_ubicacion'  => 'nullable|integer|exists:ubicacion,id_ubicacion',
            'email'         => 'nullable|email|max:150',
            'fecha_creacion'=> 'nullable|date',
        ]);

        Cliente::create($data);
        return redirect()->route('clientes.index')->with('ok', 'Cliente creado');
    }

    public function edit(Cliente $cliente)
    {
        return view('cliente.edit', compact('cliente'));
    }

    public function update(Request $request, Cliente $cliente)
    {
        $data = $request->validate([
            'telefono'      => 'nullable|string|max:50',
            'rut'           => 'nullable|string|max:50',
            'nombre'        => 'required|string|max:200',
            'id_ubicacion'  => 'nullable|integer|exists:ubicacion,id_ubicacion',
            'email'         => 'nullable|email|max:150',
            'fecha_creacion'=> 'nullable|date',
        ]);

        $cliente->update($data);
        return redirect()->route('clientes.index')->with('ok', 'Cliente actualizado');
    }

    public function destroy(Cliente $cliente)
    {
        $cliente->delete();
        return redirect()->route('clientes.index')->with('ok', 'Cliente eliminado');
    }
}
