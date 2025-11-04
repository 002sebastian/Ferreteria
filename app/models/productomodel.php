<?php
class ProductoModel {
    private $conn;
    private $table = 'producto';
    
    public function __construct($db) {
        $this->conn = $db;
    }
    
    public function getAll() {
        $query = "SELECT p.*, c.nombre as categoria_nombre 
                  FROM producto p 
                  LEFT JOIN Categoria_producto c ON p.id_categoria = c.id";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function getById($id) {
        $query = "SELECT * FROM producto WHERE id = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    
    public function create($data) {
        $query = "INSERT INTO producto (id_ferreteria, id_categoria, nombre, prestacion, precio_compra, precio_venta, descuento) 
                  VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->conn->prepare($query);
        return $stmt->execute([
            $data['id_ferreteria'],
            $data['id_categoria'],
            $data['nombre'],
            $data['prestacion'],
            $data['precio_compra'],
            $data['precio_venta'],
            $data['descuento']
        ]);
    }
}
?>