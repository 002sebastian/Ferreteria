@if($errors->any())
  <div class="alert">
    <strong>Corrige los siguientes campos:</strong>
    <ul style="margin:6px 0 0 18px;">
      @foreach($errors->all() as $e)
        <li>{{ $e }}</li>
      @endforeach
    </ul>
  </div>
@endif

<div class="grid">
  {{-- Columna izquierda --}}
  <div class="field">
    <label for="id_cliente">ID Cliente (entero)</label>
    <input type="number" id="id_cliente" name="id_cliente"
           value="{{ old('id_cliente', $cliente->id_cliente ?? '') }}"
           @if(isset($cliente)) readonly @endif>
    @error('id_cliente') <small class="error">{{ $message }}</small> @enderror
  </div>

  <div class="field">
    <label for="nombre">Nombre</label>
    <input type="text" id="nombre" name="nombre" value="{{ old('nombre', $cliente->nombre ?? '') }}">
    @error('nombre') <small class="error">{{ $message }}</small> @enderror
  </div>

  <div class="field">
    <label for="rut">RUT</label>
    <input type="text" id="rut" name="rut" value="{{ old('rut', $cliente->rut ?? '') }}">
    @error('rut') <small class="error">{{ $message }}</small> @enderror
  </div>

  <div class="field">
    <label for="telefono">Teléfono</label>
    <input type="text" id="telefono" name="telefono" value="{{ old('telefono', $cliente->telefono ?? '') }}">
    @error('telefono') <small class="error">{{ $message }}</small> @enderror
  </div>

  {{-- Columna derecha --}}
  <div class="field">
    <label for="email">Email</label>
    <input type="text" id="email" name="email" value="{{ old('email', $cliente->email ?? '') }}">
    @error('email') <small class="error">{{ $message }}</small> @enderror
  </div>

  <div class="field">
    <label for="id_ubicacion">Ubicación (opcional)</label>
    <select id="id_ubicacion" name="id_ubicacion">
      <option value="">(Sin ubicación)</option>
      @php
        // $ubicaciones debe venir desde create/edit
        $sel = old('id_ubicacion', $cliente->id_ubicacion ?? '');
      @endphp
      @foreach(($ubicaciones ?? []) as $u)
        <option value="{{ $u->id_ubicacion }}" {{ (string)$sel === (string)$u->id_ubicacion ? 'selected' : '' }}>
          #{{ $u->id_ubicacion }} — {{ $u->referencia }}
        </option>
      @endforeach
    </select>
    @error('id_ubicacion') <small class="error">{{ $message }}</small> @enderror
    @if(empty($ubicaciones) || ($ubicaciones ?? collect())->isEmpty())
      <small class="btn-ghost">No hay ubicaciones cargadas aún.</small>
    @endif
  </div>

  <div class="field">
    <label for="fecha_creacion">Fecha de creación</label>
    <input type="date" id="fecha_creacion" name="fecha_creacion"
           value="{{ old('fecha_creacion', $cliente->fecha_creacion ?? '') }}"
           placeholder="YYYY-MM-DD">
    <small class="btn-ghost">Si lo dejas vacío, se pondrá la fecha de hoy automáticamente al crear.</small>
    @error('fecha_creacion') <small class="error">{{ $message }}</small> @enderror
  </div>
</div>
