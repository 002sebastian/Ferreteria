<?php include __DIR__ . '/header.php'; ?>

<h2>📊 Panel</h2>
<p>Resumen rápido de la base de datos (productos y clientes)</p>

<section>
    <h3>📦 Productos (<?php echo count($products); ?>)</h3>
    <a href="index.php?controller=producto&action=listar">Ver todos</a>
    <table>
        <thead>
            <tr><th>ID</th><th>Nombre</th><th>Precio Venta</th></tr>
        </thead>
        <tbody>
        <?php if (empty($products)): ?>
            <tr><td colspan="3">No hay productos</td></tr>
        <?php else: ?>
            <?php foreach(array_slice($products,0,10) as $p): ?>
                <tr>
                    <td><?php echo $p['id']; ?></td>
                    <td><?php echo htmlspecialchars($p['nombre']); ?></td>
                    <td>$<?php echo number_format($p['precio_venta'],2); ?></td>
                </tr>
            <?php endforeach; ?>
        <?php endif; ?>
        </tbody>
    </table>
</section>

<section>
    <h3>👥 Clientes (<?php echo count($clients); ?>)</h3>
    <a href="index.php?controller=cliente&action=listar">Ver todos</a>
    <table>
        <thead>
            <tr><th>ID</th><th>Nombre</th><th>Teléfono</th></tr>
        </thead>
        <tbody>
        <?php if (empty($clients)): ?>
            <tr><td colspan="3">No hay clientes</td></tr>
        <?php else: ?>
            <?php foreach(array_slice($clients,0,10) as $c): ?>
                <tr>
                    <td><?php echo $c['id']; ?></td>
                    <td><?php echo htmlspecialchars($c['nombre']); ?></td>
                    <td><?php echo htmlspecialchars($c['telefono']); ?></td>
                </tr>
            <?php endforeach; ?>
        <?php endif; ?>
        </tbody>
    </table>
</section>

<?php include __DIR__ . '/footer.php'; ?>
