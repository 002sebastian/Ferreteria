<?php include __DIR__ . '/../header.php'; ?>


<h2>➕ Agregar Producto</h2>

<form method="POST" style="max-width: 500px; background: white; padding: 20px; border-radius: 5px;">
    <div class="form-group">
        <label>Nombre del Producto:</label>
        <input type="text" name="nombre" required>
    </div>
    
    <div class="form-group">
        <label>Prestación/Descripción:</label>
        <input type="text" name="prestacion">
    </div>
    
    <div class="form-group">
        <label>Precio de Compra:</label>
        <input type="number" name="precio_compra" step="0.01" required>
    </div>
    
    <div class="form-group">
        <label>Precio de Venta:</label>
        <input type="number" name="precio_venta" step="0.01" required>
    </div>
    
    <div class="form-group">
        <label>Descuento (%):</label>
        <input type="number" name="descuento" value="0" step="0.01">
    </div>
    
    <button type="submit" class="btn">Guardar Producto</button>
    <a href="index.php?controller=producto&action=listar" class="btn" style="background: #666;">Cancelar</a>
</form>

<?php include __DIR__ . '/../footer.php'; ?>