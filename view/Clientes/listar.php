<?php include __DIR__ . '/../header.php'; ?>

<div class="header-actions">
    <h2>👥 Lista de Clientes</h2>
    <a href="index.php?controller=cliente&action=agregar" class="btn">➕ Agregar Cliente</a>
</div>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>NIT</th>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Teléfono</th>
            <th>Estado</th>
        </tr>
    </thead>
    <tbody>
        <?php if (empty($clientes)): ?>
            <tr>
                <td colspan="6" class="text-center">No hay clientes registrados</td>
            </tr>
        <?php else: ?>
            <?php foreach ($clientes as $cliente): ?>
            <tr>
                <td><?php echo $cliente['id']; ?></td>
                <td><?php echo htmlspecialchars($cliente['nit']); ?></td>
                <td><?php echo htmlspecialchars($cliente['nombre']); ?></td>
                <td><?php echo htmlspecialchars($cliente['direccion']); ?></td>
                <td><?php echo htmlspecialchars($cliente['telefono']); ?></td>
                <td><?php echo $cliente['estado']; ?></td>
            </tr>
            <?php endforeach; ?>
        <?php endif; ?>
    </tbody>
</table>

<?php include __DIR__ . '/../footer.php'; ?>