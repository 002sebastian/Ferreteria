<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Productos</title>
    <style> ul { list-style: none; } li { margin: 5px 0; } </style>
</head>
<body>
    <h1>Productos Disponibles</h1>
    <ul>
        <?php foreach ($products as $product): ?>
            <li><?php echo htmlspecialchars($product['name']) . " - $" . number_format($product['price'], 2); ?></li>
        <?php endforeach; ?>
    </ul>
</body>
</html>