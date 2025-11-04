<?php
class Database {
    private $host;
    private $db_name;
    private $username;
    private $password;
    public $conn;

    public function __construct(){
        // Leer desde variables de entorno si existen, si no usar valores por defecto
        $this->host = getenv('DB_HOST') ?: 'localhost';
        $this->db_name = getenv('DB_NAME') ?: 'ferreteria_mer';
        $this->username = getenv('DB_USER') ?: 'root';
        $this->password = getenv('DB_PASS') ?: '1234';
    }
    
    public function getConnection() {
        $this->conn = null;
        try {
            $dsn = sprintf('mysql:host=%s;dbname=%s;charset=utf8mb4', $this->host, $this->db_name);
            $this->conn = new PDO($dsn, $this->username, $this->password, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            ]);
        } catch(PDOException $e) {
            // Mostrar mensaje breve y no más detalles en producción
            echo "Error de conexión a la base de datos: " . $e->getMessage();
            return null;
        }
        return $this->conn;
    }
}
?>