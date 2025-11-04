<?php
class ClienteModel {
    private $conn;
    private $table = 'Cliente';
    
    public function __construct($db) {
        $this->conn = $db;
    }
    
    public function getAll() {
        $query = "SELECT * FROM Cliente";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function create($data) {
        $query = "INSERT INTO Cliente (id_ferreteria, nit, nombre, direccion, telefono, estado, fecha_registro) 
                  VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->conn->prepare($query);
        return $stmt->execute([
            $data['id_ferreteria'],
            $data['nit'],
            $data['nombre'],
            $data['direccion'],
            $data['telefono'],
            $data['estado'],
            $data['fecha_registro']
        ]);
    }
}
?>