@extends('layouts.app')

@section('content')
  <h1>Editar Cliente #{{ $cliente->id_cliente }}</h1>
  <form method="POST" action="{{ route('clientes.update', $cliente->id_cliente) }}">
    @csrf @method('PUT')
    @include('cliente._form', ['cliente' => $cliente])
    <button class="btn btn-primary" type="submit">Actualizar</button>
    <a class="btn" href="{{ route('clientes.index') }}">Volver</a>
  </form>
@endsection
