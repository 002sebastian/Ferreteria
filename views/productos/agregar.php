<?php include '../header.php'; ?>

<h2>➕ Agregar Producto</h2>

<form method="POST" class="form">
    <div class="form-group">
        <label>Nombre:</label>
        <input type="text" name="nombre" required>
    </div>
    
    <div class="form-group">
        <label>Prestación:</label>
        <input type="text" name="prestacion">
    </div>
    
    <div class="form-group">
        <label>Precio Compra:</label>
        <input type="number" name="precio_compra" step="0.01" required>
    </div>
    
    <div class="form-group">
        <label>Precio Venta:</label>
        <input type="number" name="precio_venta" step="0.01" required>
    </div>
    
    <div class="form-group">
        <label>Descuento (%):</label>
        <input type="number" name="descuento" step="0.01" value="0">
    </div>
    
    <div class="form-group">
        <label>Categoría:</label>
        <select name="id_categoria">
            <option value="1">Herramientas</option>
            <option value="2">Materiales</option>
            <option value="3">Electricidad</option>
        </select>
    </div>
    
    <button type="submit" class="btn">Guardar Producto</button>
    <a href="index.php?controller=producto&action=listar" class="btn btn-secondary">Cancelar</a>
</form>

<?php include '../footer.php'; ?>