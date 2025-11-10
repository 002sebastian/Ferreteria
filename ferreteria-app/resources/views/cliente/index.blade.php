@extends('layouts.app')

@section('content')
  <div style="display:flex; justify-content:space-between; align-items:center;">
    <h1>Clientes</h1>
    <a class="btn btn-primary" href="{{ route('clientes.create') }}">+ Nuevo cliente</a>
  </div>

  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>RUT</th>
        <th>Teléfono</th>
        <th>Email</th>
        <th>Ubicación</th>
        <th>Fecha creación</th>
        <th style="width:220px;">Acciones</th>
      </tr>
    </thead>
    <tbody>
      @forelse($clientes as $c)
        <tr>
          <td>{{ $c->id_cliente }}</td>
          <td>{{ $c->nombre }}</td>
          <td>{{ $c->rut }}</td>
          <td>{{ $c->telefono }}</td>
          <td>{{ $c->email }}</td>
          <td>{{ $c->id_ubicacion ?? '—' }}</td>
          <td>{{ $c->fecha_creacion }}</td>
          <td class="actions">
            <a class="btn" href="{{ route('clientes.edit', $c->id_cliente) }}">Editar</a>
            <form method="POST" action="{{ route('clientes.destroy', $c->id_cliente) }}" onsubmit="return confirm('¿Eliminar cliente?');">
              @csrf @method('DELETE')
              <button class="btn btn-danger" type="submit">Eliminar</button>
            </form>
          </td>
        </tr>
      @empty
        <tr><td colspan="8">No hay clientes</td></tr>
      @endforelse
    </tbody>
  </table>

  <div style="margin-top:10px;">{{ $clientes->links() }}</div>
@endsection
