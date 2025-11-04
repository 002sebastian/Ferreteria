<?php include __DIR__ . '/../header.php'; ?>

<div class="header-actions">
    <h2>📦 Lista de Productos</h2>
    <a href="index.php?controller=producto&action=agregar" class="btn">➕ Agregar Producto</a>
</div>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Prestación</th>
            <th>Precio Compra</th>
            <th>Precio Venta</th>
            <th>Descuento</th>
        </tr>
    </thead>
    <tbody>
        <?php if (empty($productos)): ?>
            <tr>
                <td colspan="6" class="text-center">No hay productos registrados</td>
            </tr>
        <?php else: ?>
            <?php foreach ($productos as $producto): ?>
            <tr>
                <td><?php echo $producto['id']; ?></td>
                <td><?php echo htmlspecialchars($producto['nombre']); ?></td>
                <td><?php echo htmlspecialchars($producto['prestacion']); ?></td>
                <td>$<?php echo number_format($producto['precio_compra'], 2); ?></td>
                <td>$<?php echo number_format($producto['precio_venta'], 2); ?></td>
                <td><?php echo $producto['descuento']; ?>%</td>
            </tr>
            <?php endforeach; ?>
        <?php endif; ?>
    </tbody>
</table>

<?php include __DIR__ . '/../footer.php'; ?>