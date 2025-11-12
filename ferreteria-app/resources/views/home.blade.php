{{-- -inicio de la web --}}
@extends('layouts.app')

@section('content')
  <div class="hero card">
    <div>
      <h1>Ferretería</h1>
      <p>Bienvenidos administradores.</p>
      <div style="margin-top:16px;">
        <a class="btn btn-primary" href="{{ route('clientes.create') }}">Crear Clientes</a>
        <a class="btn btn-primary" href="{{ route('clientes.index') }}">Ir a Clientes</a>
        <a class="btn" href="{{ route('home') }}">Actualizar inicio</a>
      </div>
    </div>
    <div style="opacity:.8; font-size:14px;">
      {{-- Espacio reservado para métricas rápidas o accesos directos --}}
      <div class="card" style="min-width:260px;">
        <strong>Accesos rápidos</strong>
        <div class="grid">
          <a class="btn" href="{{ route('clientes.index') }}">➜ Clientes</a>
          {{-- Cuando existan nuevas secciones, añadimos más accesos aquí --}}
        </div>
      </div>
    </div>
  </div>

  <div class="grid">
    <div class="card">
      <h3 style="margin-top:0;">Proximamente</h3>
      <ul style="margin:0 0 0 18px;">
        <li>Redes sociales</li>
      </ul>
    </div>
    
  </div>
@endsection

