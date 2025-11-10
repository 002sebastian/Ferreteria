@extends('layouts.app')

@section('content')
  <h1>Nuevo Cliente</h1>
  <form method="POST" action="{{ route('clientes.store') }}">
    @csrf
    @include('cliente._form')
    <button class="btn btn-primary" type="submit">Guardar</button>
    <a class="btn" href="{{ route('clientes.index') }}">Volver</a>
  </form>
@endsection
