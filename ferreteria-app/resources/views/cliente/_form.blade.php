@if($errors->any())
  <div class="alert">
    <strong>Corrige:</strong>
    <ul style="margin:6px 0 0 18px;">
      @foreach($errors->all() as $e)<li>{{ $e }}</li>@endforeach
    </ul>
  </div>
@endif

<div class="grid">
  {{-- ID: solo visible en EDITAR (read-only) --}}
  @if(isset($cliente))
    <div class="field">
      <label>ID Cliente</label>
      <input type="number" value="{{ $cliente->id_cliente }}" readonly>
    </div>
  @endif

  <div class="field">
    <label for="nombre">Nombre</label>
    <input type="text" id="nombre" name="nombre" value="{{ old('nombre', $cliente->nombre ?? '') }}" required>
    @error('nombre') <small class="error">{{ $message }}</small> @enderror
  </div>

  <div class="field">
    <label for="rut">RUT</label>
    <input type="text" id="rut" name="rut" value="{{ old('rut', $cliente->rut ?? '') }}">
    <small class="btn-ghost">Este campo no puede repetirse.</small>
    @error('rut') <small class="error">{{ $message }}</small> @enderror
  </div>

  <div class="field">
    <label for="telefono">Teléfono</label>
    <input type="text" id="telefono" name="telefono" value="{{ old('telefono', $cliente->telefono ?? '') }}">
    @error('telefono') <small class="error">{{ $message }}</small> @enderror
  </div>

  <div class="field">
    <label for="email">Email</label>
    <input type="text" id="email" name="email" value="{{ old('email', $cliente->email ?? '') }}">
    @error('email') <small class="error">{{ $message }}</small> @enderror
  </div>

  <div class="field">
    <label for="id_ubicacion">Ubicación (opcional)</label>
    <select id="id_ubicacion" name="id_ubicacion">
      <option value="">(Sin ubicación)</option>
      @php $sel = old('id_ubicacion', $cliente->id_ubicacion ?? ''); @endphp
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
           value="{{ old('fecha_creacion', $cliente->fecha_creacion ?? '') }}">
    <small class="btn-ghost">Si la dejas vacía, se pondrá automáticamente la fecha de hoy al guardar.</small>
    @error('fecha_creacion') <small class="error">{{ $message }}</small> @enderror
  </div>
</div>
