require_once 'models/Product.php';

class ProductController {
    public function index() {
        $model = new Product();
        $products = $model->getAllProducts();
        require_once 'views/products.php';
    }
}