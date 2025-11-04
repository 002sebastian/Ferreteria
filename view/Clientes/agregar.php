<?php include __DIR__ . '/../header.php'; ?>

<h2>➕ Agregar Cliente</h2>
<form method="POST">
    <p>NIT: <input type="text" name="nit" required></p>
    <p>Nombre: <input type="text" name="nombre" required></p>
    <p>Dirección: <input type="text" name="direccion"></p>
    <p>Teléfono: <input type="text" name="telefono"></p>
    <button type="submit" class="btn">Guardar</button>
    <a href="index.php?controller=cliente&action=listar" class="btn" style="background:#666">Cancelar</a>
</form>

<?php include __DIR__ . '/../footer.php'; ?>
