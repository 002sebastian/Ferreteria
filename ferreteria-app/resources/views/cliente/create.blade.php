@extends('layouts.app')

@section('content')
  <div class="card">
    <div class="card-header">
      <h2 style="margin:0;">Nuevo cliente</h2>
      <a class="btn" href="{{ route('clientes.index') }}">Volver</a>
    </div>

    <form method="POST" action="{{ route('clientes.store') }}">
      @csrf
      @include('cliente._form')
      <div style="margin-top:14px; display:flex; gap:10px;">
        <button class="btn btn-primary" type="submit">Guardar</button>
        <a class="btn" href="{{ route('clientes.index') }}">Cancelar</a>
      </div>
    </form>
  </div>
@endsection
