<div class="field">
  <label for="id_cliente">ID Cliente (entero)</label>
  <input type="number" id="id_cliente" name="id_cliente"
         value="{{ old('id_cliente', $cliente->id_cliente ?? '') }}"
         @if(isset($cliente)) readonly @endif>
  @error('id_cliente') <small style="color:#b00;">{{ $message }}</small> @enderror
</div>

<div class="field">
  <label for="nombre">Nombre</label>
  <input type="text" id="nombre" name="nombre" value="{{ old('nombre', $cliente->nombre ?? '') }}">
  @error('nombre') <small style="color:#b00;">{{ $message }}</small> @enderror
</div>

<div class="field">
  <label for="rut">RUT</label>
  <input type="text" id="rut" name="rut" value="{{ old('rut', $cliente->rut ?? '') }}">
  @error('rut') <small style="color:#b00;">{{ $message }}</small> @enderror
</div>

<div class="field">
  <label for="telefono">Teléfono</label>
  <input type="text" id="telefono" name="telefono" value="{{ old('telefono', $cliente->telefono ?? '') }}">
  @error('telefono') <small style="color:#b00;">{{ $message }}</small> @enderror
</div>

<div class="field">
  <label for="email">Email</label>
  <input type="text" id="email" name="email" value="{{ old('email', $cliente->email ?? '') }}">
  @error('email') <small style="color:#b00;">{{ $message }}</small> @enderror
</div>

<div class="field">
  <label for="id_ubicacion">ID Ubicación (opcional, debe existir en tabla ubicacion)</label>
  <input type="number" id="id_ubicacion" name="id_ubicacion"
         value="{{ old('id_ubicacion', $cliente->id_ubicacion ?? '') }}">
  @error('id_ubicacion') <small style="color:#b00;">{{ $message }}</small> @enderror
</div>

<div class="field">
  <label for="fecha_creacion">Fecha de creación (YYYY-MM-DD)</label>
  <input type="date" id="fecha_creacion" name="fecha_creacion"
         value="{{ old('fecha_creacion', $cliente->fecha_creacion ?? '') }}">
  @error('fecha_creacion') <small style="color:#b00;">{{ $message }}</small> @enderror
</div>
