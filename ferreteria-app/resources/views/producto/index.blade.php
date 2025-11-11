@extends('layouts.app')

@section('content')
  @if(session('ok')) <div class="alert">{{ session('ok') }}</div> @endif

  <div class="card">
    <div class="card-header">
      <h2 style="margin:0;">Productos</h2>
      <a class="btn" href="{{ route('venta.index') }}">Ver carrito</a>
    </div>

    <div class="grid" style="display:grid; grid-template-columns:repeat(auto-fit,minmax(240px,1fr)); gap:16px;">
      @forelse($productos as $p)
        <div class="card" style="border-color:#e5e7eb;">
          <div style="font-weight:700;">{{ $p->nombre }}</div>
          <div style="color:#64748b; font-size:14px;">Código: {{ $p->codigo ?? '—' }}</div>
          <div style="margin-top:6px;">Precio: <strong>${{ number_format($p->precio_venta,2) }}</strong></div>
          <div style="font-size:14px; color:#64748b;">IVA: {{ $p->categoria?->iva ?? 0 }}%</div>
          <form method="POST" action="{{ route('venta.agregar') }}" style="margin-top:10px; display:flex; gap:8px; align-items:center;">
            @csrf
            <input type="hidden" name="id_producto" value="{{ $p->id_producto }}">
            <input type="number" name="cantidad" value="1" min="1" style="width:90px;">
            <button class="btn btn-primary" type="submit">Agregar</button>
          </form>
        </div>
      @empty
        <div>No hay productos.</div>
      @endforelse
    </div>

    <div style="margin-top:12px;">
      {{ $productos->links() }}
    </div>
  </div>
@endsection
