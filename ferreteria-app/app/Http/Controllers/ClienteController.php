<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use Illuminate\Http\Request;
use App\Models\Ubicacion;

class ClienteController extends Controller
{
    public function index()
    {
        $clientes = Cliente::orderBy('id_cliente')->paginate(10);
        return view('cliente.index', compact('clientes'));
    }

    public function create()
    {
        $ubicaciones = Ubicacion::orderBy('id_ubicacion')->get(['id_ubicacion','referencia']);
        return view('cliente.create', compact('ubicaciones'));
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

        if (empty($data['fecha_creacion'])) {
            $data['fecha_creacion'] = now()->toDateString(); // YYYY-MM-DD
        }

        Cliente::create($data);
        return redirect()->route('clientes.index')->with('ok', 'Cliente creado');
    }

    public function edit(Cliente $cliente)
    {
        $ubicaciones = Ubicacion::orderBy('id_ubicacion')->get(['id_ubicacion','referencia']);
        return view('cliente.edit', compact('cliente','ubicaciones'));
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

        // No tocamos fecha_creacion en update
        $cliente->update($data);
        return redirect()->route('clientes.index')->with('ok', 'Cliente actualizado');
    }

    public function destroy(Cliente $cliente)
    {
        $cliente->delete();
        return redirect()->route('clientes.index')->with('ok', 'Cliente eliminado');
    }
}
