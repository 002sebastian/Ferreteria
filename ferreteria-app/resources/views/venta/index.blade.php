@extends('layouts.app')

@section('content')
  @if(session('ok')) <div class="alert">{{ session('ok') }}</div> @endif

  <div class="card">
    <div class="card-header">
      <h2 style="margin:0;">Carrito</h2>
      <a class="btn" href="{{ route('productos.index') }}">Seguir comprando</a>
      <a class="btn btn-primary" href="{{ route('venta.checkout') }}">Facturar</a>
    </div>

    <form method="POST" action="{{ route('venta.actualizar') }}">
      @csrf
      <table>
        <thead>
          <tr>
            <th>Producto</th>
            <th>Precio</th>
            <th>IVA %</th>
            <th>Cantidad</th>
            <th>Subtotal</th>
            <th style="width:140px;">Acciones</th>
          </tr>
        </thead>
        <tbody>
          @php $subtotal=0; $ivaTotal=0; @endphp
          @forelse($cart as $id => $it)
            @php
              $line = $it['precio'] * $it['cantidad'];
              $subtotal += $line;
              $ivaTotal += $line * (($it['iva'] ?? 0)/100);
            @endphp
            <tr>
              <td>{{ $it['nombre'] }}</td>
              <td>${{ number_format($it['precio'],2) }}</td>
              <td>{{ $it['iva'] }}</td>
              <td>
                <input type="number" name="items[{{ $id }}]" value="{{ $it['cantidad'] }}" min="1" style="width:90px;">
              </td>
              <td>${{ number_format($line,2) }}</td>
              <td class="actions">
                <button class="btn" type="submit">Actualizar</button>
                <form method="POST" action="{{ route('venta.quitar') }}">
                  @csrf
                  <input type="hidden" name="id_producto" value="{{ $id }}">
                  <button class="btn btn-danger" type="submit">Quitar</button>
                </form>
              </td>
            </tr>
          @empty
            <tr><td colspan="6">Carrito vacío</td></tr>
          @endforelse
        </tbody>
      </table>
    </form>

    @php $total = $subtotal + $ivaTotal; @endphp
    <div style="margin-top:10px; text-align:right;">
      <div>Subtotal: <strong>${{ number_format($subtotal,2) }}</strong></div>
      <div>IVA: <strong>${{ number_format($ivaTotal,2) }}</strong></div>
      <div>Total: <strong>${{ number_format($total,2) }}</strong></div>
    </div>
  </div>
@endsection
