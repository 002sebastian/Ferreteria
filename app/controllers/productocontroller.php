<?php
require_once __DIR__ . '/../models/productomodel.php';

class ProductoController {
    private $productoModel;

    public function __construct($db) {
        $this->productoModel = new ProductoModel($db);
    }

    public function listar() {
        $productos = $this->productoModel->getAll();
        include VIEW_PATH . 'productos/listar.php';
    }

    public function agregar() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $data = [
                'id_ferreteria' => 1,
                'id_categoria' => filter_input(INPUT_POST, 'id_categoria', FILTER_VALIDATE_INT) ?: null,
                'nombre' => filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING),
                'prestacion' => filter_input(INPUT_POST, 'prestacion', FILTER_SANITIZE_STRING),
                'precio_compra' => filter_input(INPUT_POST, 'precio_compra', FILTER_VALIDATE_FLOAT) ?: 0,
                'precio_venta' => filter_input(INPUT_POST, 'precio_venta', FILTER_VALIDATE_FLOAT) ?: 0,
                'descuento' => filter_input(INPUT_POST, 'descuento', FILTER_VALIDATE_FLOAT) ?: 0
            ];

            if ($this->productoModel->create($data)) {
                header('Location: index.php?controller=home&action=index&exito=1');
            } else {
                header('Location: index.php?controller=producto&action=agregar&error=1');
            }
            exit;
        }

        include VIEW_PATH . 'productos/agregar.php';
    }
}
?>