<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cliente;
use App\Models\Ubicacion;
use App\Models\Factura;

class ClienteController extends Controller
{
    // Genera el siguiente ID 
    private function nextIdCliente(): int
    {
        return (int) (Cliente::max('id_cliente') ?? 0) + 1;
    }

    public function index()
    {
        $clientes = Cliente::orderBy('id_cliente', 'asc')->paginate(10);
        return view('cliente.index', compact('clientes'));
    }

    // Muestra formulario de creación
    public function create()
    {
        $siguienteId = $this->nextIdCliente();
        $ubicaciones = Ubicacion::orderBy('id_ubicacion')->get(['id_ubicacion','referencia']);
        return view('cliente.create', compact('siguienteId','ubicaciones'));
    }

    // Guarda el cliente
    public function store(Request $request)
    {
        $data = $request->validate(
            [
                'telefono'       => 'nullable|string|max:50',
                'rut'            => 'nullable|string|max:50|unique:cliente,rut',
                'nombre'         => 'required|string|max:200',
                'id_ubicacion'   => 'nullable|integer|exists:ubicacion,id_ubicacion',
                'email'          => 'nullable|email|max:150',
                'fecha_creacion' => 'nullable|date',
            ],
            // --- MENSAJES de error-
            [
                'rut.unique'  => 'El RUT ya está registrado.',
                'email.email' => 'Ingresa un correo electrónico válido.',
            ]
        );
        
        if (empty($data['fecha_creacion'])) {
            $data['fecha_creacion'] = now()->toDateString(); // YYYY-MM-DD
        }

        // Asignar ID automático
        $data['id_cliente'] = $this->nextIdCliente();

        Cliente::create($data);

        return redirect()->route('clientes.index')->with('ok', 'Cliente creado');
    }

    // Muestra formulario de edición
    public function edit(Cliente $cliente)
    {
        $ubicaciones = Ubicacion::orderBy('id_ubicacion')->get(['id_ubicacion','referencia']);
        return view('cliente.edit', compact('cliente','ubicaciones'));
    }

    // Actualiza el cliente
    public function update(Request $request, Cliente $cliente)
    {
        $data = $request->validate(
            [
                'telefono'       => 'nullable|string|max:50',
                'rut'            => 'nullable|string|max:50|unique:cliente,rut,' . $cliente->id_cliente . ',id_cliente',
                'nombre'         => 'required|string|max:200',
                'id_ubicacion'   => 'nullable|integer|exists:ubicacion,id_ubicacion',
                'email'          => 'nullable|email|max:150',
                'fecha_creacion' => 'nullable|date',
            ],
            // --- MENSAJES PERSONALIZADOS (solo lo solicitado) ---
            [
                'rut.unique'  => 'El RUT ya está registrado.',
                'email.email' => 'Ingresa un correo electrónico válido.',
            ]
        );

        $cliente->update($data);

        return redirect()->route('clientes.index')->with('ok', 'Cliente actualizado');
    }

    // Elimina el cliente (con regla: si tiene factura, no se permite)
    public function destroy(Cliente $cliente)
    {
        $tieneFactura = Factura::where('id_cliente', $cliente->id_cliente)->exists();

        if ($tieneFactura) {
            return redirect()
                ->route('clientes.index')
                ->with('ok', "No puedes eliminar al cliente #{$cliente->id_cliente} porque tiene facturas asociadas.");
        }

        $cliente->delete();

        return redirect()->route('clientes.index')->with('ok', 'Cliente eliminado');
    }
}
