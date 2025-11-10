@extends('layouts.app')

@section('content')
  <div class="card">
    <div class="card-header">
      <h2 style="margin:0;">Editar cliente #{{ $cliente->id_cliente }}</h2>
      <a class="btn" href="{{ route('clientes.index') }}">Volver</a>
    </div>

    <form method="POST" action="{{ route('clientes.update', $cliente->id_cliente) }}">
      @csrf @method('PUT')
      @include('cliente._form', ['cliente' => $cliente])
      <div style="margin-top:14px; display:flex; gap:10px;">
        <button class="btn btn-primary" type="submit">Actualizar</button>
        <a class="btn" href="{{ route('clientes.index') }}">Cancelar</a>
      </div>
    </form>
  </div>
@endsection

