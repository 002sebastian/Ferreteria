@extends('layouts.app')

@section('content')
  <div class="card">
    <div class="card-header">
      <h2 style="margin:0;">Nuevo cliente</h2>
      <a class="btn" href="{{ route('clientes.index') }}">Volver</a>
    </div>

    {{-- Aviso: el ID se asigna automáticamente en el servidor --}}
    @if(isset($siguienteId))
      <div class="alert">El próximo ID se asignará automáticamente: <strong>{{ $siguienteId }}</strong>.</div>
    @endif

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
