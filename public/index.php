<?php
session_start();

// Mostrar errores para debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "🔄 Iniciando sistema...<br>";

// 1. Cargar configuración de base de datos
require_once '../app/config/Database.php';
echo "✅ Database cargado<br>";

// 2. Cargar MODELOS primero
$modelsPath = '../app/models/';
$modelFiles = [
    'ProductoModel.php',
    'ClienteModel.php'
];

foreach ($modelFiles as $modelFile) {
    $fullPath = $modelsPath . $modelFile;
    if (file_exists($fullPath)) {
        require_once $fullPath;
        echo "✅ Modelo cargado: $modelFile<br>";
    } else {
        echo "❌ Modelo NO encontrado: $fullPath<br>";
        // Crear archivo automáticamente si no existe
        if ($modelFile === 'ProductoModel.php') {
            file_put_contents($fullPath, getProductoModelCode());
            echo "📝 Creado automáticamente: $modelFile<br>";
            require_once $fullPath;
        }
        if ($modelFile === 'ClienteModel.php') {
            file_put_contents($fullPath, getClienteModelCode());
            echo "📝 Creado automáticamente: $modelFile<br>";
            require_once $fullPath;
        }
    }
}

// 3. Cargar CONTROLADORES
$controllersPath = '../app/controllers/';
$controllerFiles = [
    'ProductoController.php',
    'ClienteController.php'
];

foreach ($controllerFiles as $controllerFile) {
    $fullPath = $controllersPath . $controllerFile;
    if (file_exists($fullPath)) {
        require_once $fullPath;
        echo "✅ Controlador cargado: $controllerFile<br>";
    } else {
        echo "❌ Controlador NO encontrado: $fullPath<br>";
    }
}

// 4. Conectar a la base de datos
try {
    $database = new Database();
    $db = $database->getConnection();
    echo "✅ Conexión a BD exitosa<br>";
} catch (Exception $e) {
    echo "❌ Error de BD: " . $e->getMessage() . "<br>";
    exit;
}

// 5. Procesar la solicitud
$controller = $_GET['controller'] ?? 'producto';
$action = $_GET['action'] ?? 'listar';

echo "🔍 Buscando: $controller -> $action<br>";

$controllerClass = ucfirst($controller) . "Controller";

if (class_exists($controllerClass)) {
    try {
        $controllerInstance = new $controllerClass($db);
        
        if (method_exists($controllerInstance, $action)) {
            $controllerInstance->$action();
        } else {
            showError("La acción '$action' no existe en $controllerClass");
        }
    } catch (Error $e) {
        showError("Error al crear controlador: " . $e->getMessage());
    }
} else {
    showError("El controlador '$controllerClass' no existe");
}

// Funciones auxiliares
function showError($message) {
    echo "<div style='background: #f8d7da; color: #721c24; padding: 15px; border-radius: 5px; margin: 20px;'>";
    echo "❌ <strong>Error:</strong> $message";
    echo "</div>";
}

function getProductoModelCode() {
    return '<?php
class ProductoModel {
    private $conn;
    private $table = "producto";
    
    public function __construct($db) {
        $this->conn = $db;
    }
    
    public function getAll() {
        try {
            $query = "SELECT p.*, c.nombre as categoria_nombre 
                      FROM producto p 
                      LEFT JOIN Categoria_producto c ON p.id_categoria = c.id";
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return [];
        }
    }
    
    public function create($data) {
        try {
            $query = "INSERT INTO producto (id_ferreteria, id_categoria, nombre, prestacion, precio_compra, precio_venta, descuento) 
                      VALUES (?, ?, ?, ?, ?, ?, ?)";
            $stmt = $this->conn->prepare($query);
            return $stmt->execute([
                $data[\'id_ferreteria\'] ?? 1,
                $data[\'id_categoria\'] ?? 1,
                $data[\'nombre\'],
                $data[\'prestacion\'] ?? \'\',
                $data[\'precio_compra\'],
                $data[\'precio_venta\'],
                $data[\'descuento\'] ?? 0
            ]);
        } catch (PDOException $e) {
            return false;
        }
    }
}
?>';
}

function getClienteModelCode() {
    return '<?php
class ClienteModel {
    private $conn;
    private $table = "Cliente";
    
    public function __construct($db) {
        $this->conn = $db;
    }
    
    public function getAll() {
        try {
            $query = "SELECT * FROM Cliente";
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return [];
        }
    }
    
    public function create($data) {
        try {
            $query = "INSERT INTO Cliente (id_ferreteria, nit, nombre, direccion, telefono, estado, fecha_registro) 
                      VALUES (?, ?, ?, ?, ?, ?, ?)";
            $stmt = $this->conn->prepare($query);
            return $stmt->execute([
                $data[\'id_ferreteria\'] ?? 1,
                $data[\'nit\'],
                $data[\'nombre\'],
                $data[\'direccion\'],
                $data[\'telefono\'],
                $data[\'estado\'] ?? \'Activo\',
                $data[\'fecha_registro\'] ?? date(\'Y-m-d\')
            ]);
        } catch (PDOException $e) {
            return false;
        }
    }
}
?>';
}
?>