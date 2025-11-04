/* Script generado desde MER.drawio conservando nombres originales */
CREATE DATABASE IF NOT EXISTS ferreteria_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;;
USE ferreteria_db;;
SET NAMES utf8mb4;;
CREATE TABLE `ferreteria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nit` VARCHAR(40),
  `nombre` VARCHAR(150),
  `direccion` VARCHAR(150),
  `telefono` VARCHAR(30),
  `estado` VARCHAR(50),
  `fecha_registro` DATETIME,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `Proveedor` (
  `pagina_web` VARCHAR(255),
  `telefono` VARCHAR(30),
  `direccion` VARCHAR(150),
  `nombre` VARCHAR(150),
  `rut` VARCHAR(40),
  `id_ferreteria` INT,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `Cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ferreteria` INT,
  `nombre` VARCHAR(150),
  `rut` VARCHAR(40),
  `email` VARCHAR(150),
  `direccion` VARCHAR(150),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `Categoria_producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150),
  `descripcion` VARCHAR(150),
  `iva` DECIMAL(5,2),
  `id_categoria` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `forma_pago` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_pago` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `Empleados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(150),
  `id_ferreteria` INT,
  `nombre` VARCHAR(150),
  `cargo` VARCHAR(50),
  `fecha_contratacion` DATE,
  `telefono` VARCHAR(30),
  `email` VARCHAR(150),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ferreteria` INT,
  `id_proveedor` INT,
  `nombre` VARCHAR(150),
  `prestacion` VARCHAR(150),
  `precio_compra` DECIMAL(12,2),
  `precio_venta` DECIMAL(12,2),
  `Stok_minimo` INT,
  `stok_actual` INT,
  `descuento` DECIMAL(12,2),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_proveedor` INT,
  `id_ferreteria` INT,
  `fecha_pedido` DATETIME,
  `estado` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `factura_venta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ferreteria` INT,
  `id_cliente` INT,
  `descuento_global` DECIMAL(12,2),
  `fecha` DATETIME,
  `monto_final` DECIMAL(12,2),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `detalle_pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT,
  `id_producto` INT,
  `cantidad` INT,
  `precio_compra` DECIMAL(12,2),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `recepciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT,
  `observaciones` VARCHAR(150),
  `fecha_recepcion` DATETIME,
  `iva_aplicado` DECIMAL(5,2),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `detalle_factura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_factura` INT,
  `id_producto` INT,
  `precio_venta_momento` VARCHAR(150),
  `cantidad` INT,
  `subtotal` DECIMAL(12,2),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `Cliente_telefono` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT,
  `telefono` VARCHAR(30),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `movimiento_inventario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_producto` INT,
  `fecha` DATETIME,
  `tipo_movimiento` VARCHAR(50),
  `cantidad` INT,
  `descripcion` VARCHAR(150),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
CREATE TABLE `Clasificacion_proveedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_proveedor` INT,
  `fecha` DATETIME,
  `puntualidad` VARCHAR(150),
  `caidad` VARCHAR(150),
  `cumplimiento` VARCHAR(150),
  `comentarios` VARCHAR(150),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;;
ALTER TABLE `Proveedor` ADD CONSTRAINT `fk_Proveedor_id_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria`(`id`);
ALTER TABLE `Empleados` ADD CONSTRAINT `fk_Empleados_id_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria`(`id`);
ALTER TABLE `Cliente` ADD CONSTRAINT `fk_Cliente_id_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria`(`id`);
ALTER TABLE `producto` ADD CONSTRAINT `fk_producto_id_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria`(`id`);
ALTER TABLE `producto` ADD CONSTRAINT `fk_producto_id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `Proveedor`(`id`);
ALTER TABLE `pedidos` ADD CONSTRAINT `fk_pedidos_id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `Proveedor`(`id`);
ALTER TABLE `pedidos` ADD CONSTRAINT `fk_pedidos_id_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria`(`id`);
ALTER TABLE `detalle_pedido` ADD CONSTRAINT `fk_detalle_pedido_id_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos`(`id`);
ALTER TABLE `detalle_pedido` ADD CONSTRAINT `fk_detalle_pedido_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto`(`id`);
ALTER TABLE `recepciones` ADD CONSTRAINT `fk_recepciones_id_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos`(`id`);
ALTER TABLE `detalle_factura` ADD CONSTRAINT `fk_detalle_factura_id_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura_venta`(`id`);
ALTER TABLE `detalle_factura` ADD CONSTRAINT `fk_detalle_factura_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto`(`id`);
ALTER TABLE `factura_venta` ADD CONSTRAINT `fk_factura_venta_id_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria`(`id`);
ALTER TABLE `factura_venta` ADD CONSTRAINT `fk_factura_venta_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente`(`id`);
ALTER TABLE `Cliente_telefono` ADD CONSTRAINT `fk_Cliente_telefono_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente`(`id`);
ALTER TABLE `movimiento_inventario` ADD CONSTRAINT `fk_movimiento_inventario_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto`(`id`);
ALTER TABLE `Clasificacion_proveedor` ADD CONSTRAINT `fk_Clasificacion_proveedor_id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `Proveedor`(`id`);
