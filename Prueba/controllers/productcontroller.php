<?php
class ProductoController {
    private $productoModel;
    
    public function __construct($db) {
        $this->productoModel = new ProductoModel($db);
    }
    
    public function listar() {
        $productos = $this->productoModel->getAll();
        
        // Incluir vista
        $viewPath = '../../views/productos/listar.php';
        if (file_exists($viewPath)) {
            include $viewPath;
        } else {
            echo "<h2>📦 Lista de Productos</h2>";
            
            if (empty($productos)) {
                echo "<p>No hay productos registrados</p>";
            } else {
                echo "<table border='1' style='width:100%'>";
                echo "<tr><th>ID</th><th>Nombre</th><th>Precio Venta</th><th>Descuento</th></tr>";
                foreach ($productos as $producto) {
                    echo "<tr>";
                    echo "<td>{$producto['id']}</td>";
                    echo "<td>{$producto['nombre']}</td>";
                    echo "<td>$" . number_format($producto['precio_venta'], 2) . "</td>";
                    echo "<td>{$producto['descuento']}%</td>";
                    echo "</tr>";
                }
                echo "</table>";
            }
            
            echo '<br><a href="index.php?controller=producto&action=agregar">➕ Agregar Producto</a>';
        }
    }
    
    public function agregar() {
        if ($_POST) {
            $data = [
                'nombre' => $_POST['nombre'],
                'prestacion' => $_POST['prestacion'] ?? '',
                'precio_compra' => $_POST['precio_compra'],
                'precio_venta' => $_POST['precio_venta'],
                'descuento' => $_POST['descuento'] ?? 0
            ];
            
            if ($this->productoModel->create($data)) {
                header('Location: index.php?controller=producto&action=listar&exito=1');
            } else {
                header('Location: index.php?controller=producto&action=agregar&error=1');
            }
            exit;
        }
        
        // Mostrar formulario simple
        echo "<h2>➕ Agregar Producto</h2>";
        echo '<form method="POST">';
        echo '<p>Nombre: <input type="text" name="nombre" required></p>';
        echo '<p>Precio Compra: <input type="number" name="precio_compra" step="0.01" required></p>';
        echo '<p>Precio Venta: <input type="number" name="precio_venta" step="0.01" required></p>';
        echo '<p>Descuento: <input type="number" name="descuento" value="0"></p>';
        echo '<button type="submit">Guardar</button>';
        echo '</form>';
        echo '<br><a href="index.php?controller=producto&action=listar">← Volver</a>';
    }
}
?>