@extends('layouts.app')

@section('content')
  @if($errors->any())
    <div class="alert">
      <strong>Errores:</strong>
      <ul style="margin:6px 0 0 18px;">
        @foreach($errors->all() as $e)<li>{{ $e }}</li>@endforeach
      </ul>
    </div>
  @endif
  @if(session('ok')) <div class="alert">{{ session('ok') }}</div> @endif

  <div class="card">
    <div class="card-header">
      <h2 style="margin:0;">Confirmar compra</h2>
      <a class="btn" href="{{ route('venta.index') }}">Volver al carrito</a>
    </div>

    <div class="grid">
      <div class="card" style="border-color:#e5e7eb;">
        <h3 style="margin-top:0;">Resumen</h3>
        <table>
          <thead>
            <tr><th>Producto</th><th>Cant.</th><th>Precio</th><th>Subtotal</th></tr>
          </thead>
          <tbody>
            @foreach($cart as $it)
              @php $line = $it['precio'] * $it['cantidad']; @endphp
              <tr>
                <td>{{ $it['nombre'] }}</td>
                <td>{{ $it['cantidad'] }}</td>
                <td>${{ number_format($it['precio'],2) }}</td>
                <td>${{ number_format($line,2) }}</td>
              </tr>
            @endforeach
          </tbody>
        </table>

        <div style="margin-top:10px; text-align:right;">
          <div>Subtotal: <strong>${{ number_format($resumen['subtotal'],2) }}</strong></div>
          <div>IVA: <strong>${{ number_format($resumen['ivaTotal'],2) }}</strong></div>
          <div>Total: <strong>${{ number_format($resumen['total'],2) }}</strong></div>
        </div>
      </div>

      <div class="card" style="border-color:#e5e7eb;">
        <h3 style="margin-top:0;">Datos de factura</h3>
        <form method="POST" action="{{ route('venta.facturar') }}">
          @csrf

          <div class="field">
            <label for="id_cliente">Cliente (opcional)</label>
            <select id="id_cliente" name="id_cliente">
              <option value="">(Sin cliente)</option>
              @foreach($clientes as $c)
                <option value="{{ $c->id_cliente }}">{{ $c->nombre }} (#{{ $c->id_cliente }})</option>
              @endforeach
            </select>
          </div>

          <div class="field">
            <label for="id_forma_pago">Forma de pago (opcional)</label>
            <select id="id_forma_pago" name="id_forma_pago">
              <option value="">(Sin pago registrado)</option>
              @foreach($formasPago as $f)
                <option value="{{ $f->id_forma_pago }}">{{ $f->forma }}</option>
              @endforeach
            </select>
            <small class="btn-ghost">Si eliges forma de pago, crearemos un registro en <em>detalles_de_pago</em> con el total.</small>
          </div>

          <div style="margin-top:12px; display:flex; gap:10px;">
            <button class="btn btn-primary" type="submit">Facturar</button>
            <a class="btn" href="{{ route('venta.index') }}">Cancelar</a>
          </div>
        </form>
      </div>
    </div>
  </div>
@endsection
