<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🏪 Ferretería MVC</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>🏪 Sistema Ferretería</h1>
            <nav>
                <a href="index.php?controller=producto&action=listar">📦 Productos</a>
                <a href="index.php?controller=cliente&action=listar">👥 Clientes</a>
                <a href="index.php?controller=venta&action=listar">💰 Ventas</a>
            </nav>
        </header>
        <main>
            <?php if (isset($_GET['exito'])): ?>
                <div class="alert success">✅ Operación exitosa!</div>
            <?php endif; ?>
            
            <?php if (isset($_GET['error'])): ?>
                <div class="alert error">❌ Error en la operación</div>
            <?php endif; ?>