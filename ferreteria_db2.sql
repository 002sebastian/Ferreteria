-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2025 a las 04:20:54
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ferreteria_db2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_proveedor`
--

CREATE TABLE `calificacion_proveedor` (
  `id_calificacion` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `puntualidad` tinyint(3) UNSIGNED NOT NULL,
  `calidad` tinyint(3) UNSIGNED NOT NULL,
  `cumplimiento` tinyint(3) UNSIGNED NOT NULL,
  `comentarios` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calificacion_proveedor`
--

INSERT INTO `calificacion_proveedor` (`id_calificacion`, `id_proveedor`, `id_empleado`, `fecha`, `puntualidad`, `calidad`, `cumplimiento`, `comentarios`) VALUES
(1, 1, 1, '2025-01-16 00:00:00', 5, 5, 5, 'Entrega perfecta'),
(2, 2, 2, '2025-01-17 00:00:00', 4, 4, 4, 'Cumplimiento bueno'),
(3, 3, 3, '2025-01-18 00:00:00', 3, 4, 3, 'Algunos retrasos'),
(4, 4, 4, '2025-01-19 00:00:00', 5, 5, 5, 'Excelente proveedor'),
(5, 5, 5, '2025-01-20 00:00:00', 4, 3, 4, 'Calidad aceptable'),
(6, 6, 6, '2025-01-21 00:00:00', 2, 2, 3, 'Problemas en entrega'),
(7, 7, 7, '2025-01-22 00:00:00', 5, 4, 5, 'Muy cumplidor'),
(8, 8, 8, '2025-01-23 00:00:00', 4, 5, 4, 'Buena atención'),
(9, 9, 9, '2025-01-24 00:00:00', 3, 3, 2, 'Incumplimiento parcial'),
(10, 10, 10, '2025-01-25 00:00:00', 5, 5, 5, 'Muy confiable'),
(11, 11, 11, '2025-01-26 00:00:00', 4, 4, 4, 'Ok'),
(12, 12, 12, '2025-01-27 00:00:00', 3, 4, 3, 'Mejorable'),
(13, 13, 13, '2025-01-28 00:00:00', 5, 5, 4, 'Buen servicio'),
(14, 14, 14, '2025-01-29 00:00:00', 4, 4, 5, 'Entrega rápida'),
(15, 15, 15, '2025-01-30 00:00:00', 5, 5, 5, 'Excelente calidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `iva` decimal(5,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id_categoria`, `nombre`, `descripcion`, `iva`) VALUES
(1, 'Mano de obra', 'Herramientas manuales', 19.00),
(2, 'Electricidad', 'Cables y accesorios', 19.00),
(3, 'Plomeria', 'Tubos y accesorios', 19.00),
(4, 'Pintura', 'Pinturas y barnices', 19.00),
(5, 'Ferreteria General', 'Tornillos, tuercas', 19.00),
(6, 'Jardineria', 'Herramientas de jardín', 5.00),
(7, 'Automotriz', 'Repuestos automotrices', 19.00),
(8, 'Iluminacion', 'Lámparas y bombillas', 19.00),
(9, 'Seguridad', 'EPP y seguridad', 0.00),
(10, 'Construccion', 'Cemento y materiales', 19.00),
(11, 'Adhesivos', 'Pegantes y selladores', 19.00),
(12, 'Accesorios', 'Accesorios varios', 19.00),
(13, 'Hogar', 'Artículos para el hogar', 19.00),
(14, 'Placas y metales', 'Metales y planchas', 19.00),
(15, 'Insumos', 'Insumos varios', 19.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `id_ferreteria` int(11) NOT NULL,
  `rut` varchar(50) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `id_ferreteria`, `rut`, `nombre`, `id_direccion`, `email`, `fecha_creacion`) VALUES
(1, 1, '100000001-1', 'Cliente Uno', 1, 'cli1@mail.com', '2025-10-30 14:20:32'),
(2, 2, '100000002-1', 'Cliente Dos', 2, 'cli2@mail.com', '2025-10-30 14:20:32'),
(3, 3, '100000003-1', 'Cliente Tres', 3, 'cli3@mail.com', '2025-10-30 14:20:32'),
(4, 4, '100000004-1', 'Cliente Cuatro', 4, 'cli4@mail.com', '2025-10-30 14:20:32'),
(5, 5, '100000005-1', 'Cliente Cinco', 5, 'cli5@mail.com', '2025-10-30 14:20:32'),
(6, 6, '100000006-1', 'Cliente Seis', 6, 'cli6@mail.com', '2025-10-30 14:20:32'),
(7, 7, '100000007-1', 'Cliente Siete', 7, 'cli7@mail.com', '2025-10-30 14:20:32'),
(8, 8, '100000008-1', 'Cliente Ocho', 8, 'cli8@mail.com', '2025-10-30 14:20:32'),
(9, 9, '100000009-1', 'Cliente Nueve', 9, 'cli9@mail.com', '2025-10-30 14:20:32'),
(10, 10, '100000010-1', 'Cliente Diez', 10, 'cli10@mail.com', '2025-10-30 14:20:32'),
(11, 11, '100000011-1', 'Cliente 11', 11, 'cli11@mail.com', '2025-10-30 14:20:32'),
(12, 12, '100000012-1', 'Cliente 12', 12, 'cli12@mail.com', '2025-10-30 14:20:32'),
(13, 13, '100000013-1', 'Cliente 13', 13, 'cli13@mail.com', '2025-10-30 14:20:32'),
(14, 14, '100000014-1', 'Cliente 14', 14, 'cli14@mail.com', '2025-10-30 14:20:32'),
(15, 15, '100000015-1', 'Cliente 15', 15, 'cli15@mail.com', '2025-10-30 14:20:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_telefono`
--

CREATE TABLE `cliente_telefono` (
  `id_telefono` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente_telefono`
--

INSERT INTO `cliente_telefono` (`id_telefono`, `id_cliente`, `telefono`) VALUES
(1, 1, '600100001'),
(2, 2, '600100002'),
(3, 3, '600100003'),
(4, 4, '600100004'),
(5, 5, '600100005'),
(6, 6, '600100006'),
(7, 7, '600100007'),
(8, 8, '600100008'),
(9, 9, '600100009'),
(10, 10, '600100010'),
(11, 11, '600100011'),
(12, 12, '600100012'),
(13, 13, '600100013'),
(14, 14, '600100014'),
(15, 15, '600100015');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_detalle` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio_venta_momento` decimal(12,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(14,2) GENERATED ALWAYS AS (`precio_venta_momento` * `cantidad`) STORED,
  `iva_aplicado` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_detalle`, `id_factura`, `id_producto`, `precio_venta_momento`, `cantidad`, `iva_aplicado`) VALUES
(1, 1, 1, 12.00, 2, 4.56),
(2, 1, 5, 8.00, 1, 1.52),
(3, 2, 8, 5.00, 1, 0.95),
(4, 3, 10, 35.00, 3, 19.95),
(5, 3, 2, 28.00, 1, 5.32),
(6, 4, 4, 18.00, 2, 6.84),
(7, 5, 11, 4.00, 10, 7.60),
(8, 6, 3, 22.00, 1, 4.18),
(9, 7, 5, 8.00, 20, 30.40),
(10, 8, 13, 1.80, 1, 0.34),
(11, 9, 9, 9.00, 2, 3.42),
(12, 10, 7, 35.00, 3, 19.95),
(13, 11, 12, 6.50, 1, 1.23),
(14, 12, 15, 17.00, 2, 5.13),
(15, 13, 13, 1.80, 5, 1.71);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle_pedido` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(12,2) NOT NULL,
  `subtotal` decimal(14,2) GENERATED ALWAYS AS (`cantidad` * `precio_compra`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle_pedido`, `id_pedido`, `id_producto`, `cantidad`, `precio_compra`) VALUES
(1, 1, 1, 50, 8.00),
(2, 2, 2, 40, 20.00),
(3, 3, 3, 60, 15.00),
(4, 4, 4, 30, 12.00),
(5, 5, 5, 200, 5.00),
(6, 6, 6, 70, 10.00),
(7, 7, 7, 20, 25.00),
(8, 8, 8, 200, 3.00),
(9, 9, 9, 150, 6.00),
(10, 10, 10, 80, 25.00),
(11, 11, 11, 90, 2.50),
(12, 12, 12, 60, 4.00),
(13, 13, 13, 300, 1.00),
(14, 14, 14, 40, 7.00),
(15, 15, 15, 120, 12.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_recepcion`
--

CREATE TABLE `detalle_recepcion` (
  `id_detalle_recepcion` int(11) NOT NULL,
  `id_recepcion` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_recibida` int(11) NOT NULL,
  `precio_compra` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_recepcion`
--

INSERT INTO `detalle_recepcion` (`id_detalle_recepcion`, `id_recepcion`, `id_producto`, `cantidad_recibida`, `precio_compra`) VALUES
(1, 1, 1, 50, 8.00),
(2, 2, 2, 40, 20.00),
(3, 3, 3, 60, 15.00),
(4, 4, 4, 30, 12.00),
(5, 5, 5, 200, 5.00),
(6, 6, 6, 70, 10.00),
(7, 7, 7, 20, 25.00),
(8, 8, 8, 200, 3.00),
(9, 9, 9, 150, 6.00),
(10, 10, 10, 80, 25.00),
(11, 11, 11, 90, 2.50),
(12, 12, 12, 60, 4.00),
(13, 13, 13, 300, 1.00),
(14, 14, 14, 40, 7.00),
(15, 15, 15, 120, 12.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `calle` varchar(120) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `localidad` varchar(100) DEFAULT NULL,
  `barrio` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT 'Colombia',
  `referencia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_direccion`, `calle`, `numero`, `localidad`, `barrio`, `ciudad`, `departamento`, `pais`, `referencia`) VALUES
(1, 'Calle 1', '10', 'Localidad 1', 'Barrio 1', 'Bogotá', 'Cundinamarca', 'Colombia', 'Ref A1'),
(2, 'Calle 2', '20', 'Localidad 2', 'Barrio 2', 'Bogotá', 'Cundinamarca', 'Colombia', 'Ref A2'),
(3, 'Calle 3', '30', 'Localidad 3', 'Barrio 3', 'Medellín', 'Antioquia', 'Colombia', 'Ref A3'),
(4, 'Calle 4', '40', 'Localidad 4', 'Barrio 4', 'Cali', 'Valle', 'Colombia', 'Ref A4'),
(5, 'Calle 5', '50', 'Localidad 5', 'Barrio 5', 'Barranquilla', 'Atlántico', 'Colombia', 'Ref A5'),
(6, 'Calle 6', '60', 'Localidad 6', 'Barrio 6', 'Pereira', 'Risaralda', 'Colombia', 'Ref A6'),
(7, 'Calle 7', '70', 'Localidad 7', 'Barrio 7', 'Bucaramanga', 'Santander', 'Colombia', 'Ref A7'),
(8, 'Calle 8', '80', 'Localidad 8', 'Barrio 8', 'Manizales', 'Caldas', 'Colombia', 'Ref A8'),
(9, 'Calle 9', '90', 'Localidad 9', 'Barrio 9', 'Ibagué', 'Tolima', 'Colombia', 'Ref A9'),
(10, 'Calle 10', '100', 'Localidad 10', 'Barrio 10', 'Cartagena', 'Bolívar', 'Colombia', 'Ref A10'),
(11, 'Calle 11', '110', 'Localidad 11', 'Barrio 11', 'Sincelejo', 'Sucre', 'Colombia', 'Ref A11'),
(12, 'Calle 12', '120', 'Localidad 12', 'Barrio 12', 'Valledupar', 'Cesar', 'Colombia', 'Ref A12'),
(13, 'Calle 13', '130', 'Localidad 13', 'Barrio 13', 'Popayán', 'Cauca', 'Colombia', 'Ref A13'),
(14, 'Calle 14', '140', 'Localidad 14', 'Barrio 14', 'Armenia', 'Quindío', 'Colombia', 'Ref A14'),
(15, 'Calle 15', '150', 'Localidad 15', 'Barrio 15', 'Pasto', 'Nariño', 'Colombia', 'Ref A15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `id_ferreteria` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `cargo` varchar(80) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `id_ferreteria`, `nombre`, `apellido`, `cargo`, `fecha_contratacion`, `id_direccion`, `email`, `telefono`, `fecha_creacion`) VALUES
(1, 1, 'Juan', 'Pérez', 'Vendedor', '2024-01-10', 1, 'juan.p@mail.com', '311100001', '2025-10-30 14:20:32'),
(2, 2, 'Ana', 'Gómez', 'Cajera', '2024-02-11', 2, 'ana.g@mail.com', '311100002', '2025-10-30 14:20:32'),
(3, 3, 'Carlos', 'Ruiz', 'Administrador', '2023-03-12', 3, 'carlos.r@mail.com', '311100003', '2025-10-30 14:20:32'),
(4, 4, 'María', 'López', 'Vendedor', '2023-04-13', 4, 'maria.l@mail.com', '311100004', '2025-10-30 14:20:32'),
(5, 5, 'Luis', 'Martínez', 'Auxiliar', '2023-05-14', 5, 'luis.m@mail.com', '311100005', '2025-10-30 14:20:32'),
(6, 6, 'Sofía', 'Torres', 'Vendedor', '2023-06-15', 6, 'sofia.t@mail.com', '311100006', '2025-10-30 14:20:32'),
(7, 7, 'Diego', 'Ramos', 'Cajero', '2023-07-16', 7, 'diego.r@mail.com', '311100007', '2025-10-30 14:20:32'),
(8, 8, 'Lucía', 'Vega', 'Vendedor', '2023-08-17', 8, 'lucia.v@mail.com', '311100008', '2025-10-30 14:20:32'),
(9, 9, 'Andrés', 'Salinas', 'Auxiliar', '2023-09-18', 9, 'andres.s@mail.com', '311100009', '2025-10-30 14:20:32'),
(10, 10, 'Paula', 'Castro', 'Administrador', '2023-10-19', 10, 'paula.c@mail.com', '311100010', '2025-10-30 14:20:32'),
(11, 11, 'Ricardo', 'Duarte', 'Vendedor', '2022-11-20', 11, 'ricardo.d@mail.com', '311100011', '2025-10-30 14:20:32'),
(12, 12, 'Carolina', 'Molina', 'Cajera', '2022-12-21', 12, 'carolina.m@mail.com', '311100012', '2025-10-30 14:20:32'),
(13, 13, 'Felipe', 'Ortega', 'Auxiliar', '2021-01-05', 13, 'felipe.o@mail.com', '311100013', '2025-10-30 14:20:32'),
(14, 14, 'Natalia', 'Ríos', 'Vendedor', '2021-02-06', 14, 'natalia.r@mail.com', '311100014', '2025-10-30 14:20:32'),
(15, 15, 'Óscar', 'Benítez', 'Administrador', '2020-03-07', 15, 'oscar.b@mail.com', '311100015', '2025-10-30 14:20:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_pago`
--

CREATE TABLE `factura_pago` (
  `id_factura_pago` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_forma_pago` int(11) NOT NULL,
  `monto` decimal(14,2) NOT NULL,
  `referencia` varchar(200) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_pago`
--

INSERT INTO `factura_pago` (`id_factura_pago`, `id_factura`, `id_forma_pago`, `monto`, `referencia`, `fecha_pago`) VALUES
(1, 1, 1, 142.80, '', '2025-02-01 00:00:00'),
(2, 2, 2, 53.55, '', '2025-02-02 00:00:00'),
(3, 3, 3, 236.00, '', '2025-02-03 00:00:00'),
(4, 4, 1, 89.25, '', '2025-02-04 00:00:00'),
(5, 5, 4, 357.00, '', '2025-02-05 00:00:00'),
(6, 6, 1, 71.40, '', '2025-02-06 00:00:00'),
(7, 7, 2, 499.80, '', '2025-02-07 00:00:00'),
(8, 8, 1, 21.42, '', '2025-02-08 00:00:00'),
(9, 9, 1, 104.72, '', '2025-02-09 00:00:00'),
(10, 10, 3, 178.50, '', '2025-02-10 00:00:00'),
(11, 11, 1, 42.84, '', '2025-02-11 00:00:00'),
(12, 12, 4, 285.60, '', '2025-02-12 00:00:00'),
(13, 13, 1, 10.71, '', '2025-02-13 00:00:00'),
(14, 14, 2, 590.00, '', '2025-02-14 00:00:00'),
(15, 15, 1, 154.70, '', '2025-02-15 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_venta`
--

CREATE TABLE `factura_venta` (
  `id_factura` int(11) NOT NULL,
  `id_ferreteria` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `descuento_global` decimal(12,2) DEFAULT 0.00,
  `subtotal` decimal(14,2) DEFAULT 0.00,
  `iva_total` decimal(14,2) DEFAULT 0.00,
  `monto_final` decimal(14,2) DEFAULT 0.00,
  `num_items` int(11) DEFAULT 0,
  `estado` enum('PAGADA','PENDIENTE','ANULADA') DEFAULT 'PENDIENTE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_venta`
--

INSERT INTO `factura_venta` (`id_factura`, `id_ferreteria`, `id_cliente`, `fecha`, `descuento_global`, `subtotal`, `iva_total`, `monto_final`, `num_items`, `estado`) VALUES
(1, 1, 1, '2025-02-01 00:00:00', 0.00, 120.00, 22.80, 142.80, 2, 'PAGADA'),
(2, 2, 2, '2025-02-02 00:00:00', 0.00, 45.00, 8.55, 53.55, 1, 'PAGADA'),
(3, 3, 3, '2025-02-03 00:00:00', 2.00, 200.00, 38.00, 236.00, 4, 'PAGADA'),
(4, 4, 4, '2025-02-04 00:00:00', 0.00, 75.00, 14.25, 89.25, 2, 'PAGADA'),
(5, 5, 5, '2025-02-05 00:00:00', 0.00, 300.00, 57.00, 357.00, 6, 'PAGADA'),
(6, 6, 6, '2025-02-06 00:00:00', 0.00, 60.00, 11.40, 71.40, 1, 'PAGADA'),
(7, 7, 7, '2025-02-07 00:00:00', 0.00, 420.00, 79.80, 499.80, 9, 'PAGADA'),
(8, 8, 8, '2025-02-08 00:00:00', 0.00, 18.00, 3.42, 21.42, 1, 'PAGADA'),
(9, 9, 9, '2025-02-09 00:00:00', 0.00, 88.00, 16.72, 104.72, 2, 'PAGADA'),
(10, 10, 10, '2025-02-10 00:00:00', 0.00, 150.00, 28.50, 178.50, 3, 'PAGADA'),
(11, 11, 11, '2025-02-11 00:00:00', 0.00, 36.00, 6.84, 42.84, 1, 'PAGADA'),
(12, 12, 12, '2025-02-12 00:00:00', 0.00, 240.00, 45.60, 285.60, 5, 'PAGADA'),
(13, 13, 13, '2025-02-13 00:00:00', 0.00, 9.00, 1.71, 10.71, 1, 'PAGADA'),
(14, 14, 14, '2025-02-14 00:00:00', 5.00, 500.00, 95.00, 590.00, 10, 'PAGADA'),
(15, 15, 15, '2025-02-15 00:00:00', 0.00, 130.00, 24.70, 154.70, 3, 'PAGADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ferreteria`
--

CREATE TABLE `ferreteria` (
  `id_ferreteria` int(11) NOT NULL,
  `nit` varchar(50) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ferreteria`
--

INSERT INTO `ferreteria` (`id_ferreteria`, `nit`, `nombre`, `id_direccion`, `telefono`, `email`, `estado`, `fecha_registro`) VALUES
(1, '900000001-1', 'Ferreteria Central', 1, '310100001', 'central@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(2, '900000002-1', 'Ferreteria Norte', 2, '310100002', 'norte@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(3, '900000003-1', 'Ferreteria Sur', 3, '310100003', 'sur@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(4, '900000004-1', 'Ferreteria Este', 4, '310100004', 'este@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(5, '900000005-1', 'Ferreteria Oeste', 5, '310100005', 'oeste@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(6, '900000006-1', 'Ferreteria La 6', 6, '310100006', 'f6@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(7, '900000007-1', 'Ferreteria La 7', 7, '310100007', 'f7@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(8, '900000008-1', 'Ferreteria La 8', 8, '310100008', 'f8@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(9, '900000009-1', 'Ferreteria La 9', 9, '310100009', 'f9@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(10, '900000010-1', 'Ferreteria Diez', 10, '310100010', 'f10@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(11, '900000011-1', 'Ferreteria 11', 11, '310100011', 'f11@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(12, '900000012-1', 'Ferreteria 12', 12, '310100012', 'f12@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(13, '900000013-1', 'Ferreteria 13', 13, '310100013', 'f13@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(14, '900000014-1', 'Ferreteria 14', 14, '310100014', 'f14@ferre.com', 'ACTIVO', '2025-10-30 14:20:31'),
(15, '900000015-1', 'Ferreteria 15', 15, '310100015', 'f15@ferre.com', 'ACTIVO', '2025-10-30 14:20:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id_forma_pago` int(11) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`id_forma_pago`, `codigo`, `descripcion`) VALUES
(1, 'EFECTIVO', 'Efectivo'),
(2, 'TARJETA_DEBITO', 'Tarjeta débito'),
(3, 'TARJETA_CREDITO', 'Tarjeta crédito'),
(4, 'TRANSFERENCIA', 'Transferencia bancaria'),
(5, 'CHEQUE', 'Cheque'),
(6, 'PSE', 'PSE'),
(7, 'CONTRAENTREGA', 'Contra entrega'),
(8, 'PAYU', 'PayU'),
(9, 'NEQUI', 'Nequi'),
(10, 'DAVIPLATA', 'Daviplata'),
(11, 'CRYPTO', 'Criptomoneda'),
(12, 'CUPON', 'Cupón descuento'),
(13, 'FIADO', 'Fiado (crédito local)'),
(14, 'OTRO1', 'Forma otro 1'),
(15, 'OTRO2', 'Forma otro 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_inventario`
--

CREATE TABLE `movimiento_inventario` (
  `id_movimiento` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `tipo_movimiento` enum('ENTRADA','SALIDA','AJUSTE') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `referencia_tabla` varchar(50) DEFAULT NULL,
  `referencia_id` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimiento_inventario`
--

INSERT INTO `movimiento_inventario` (`id_movimiento`, `id_producto`, `fecha`, `tipo_movimiento`, `cantidad`, `referencia_tabla`, `referencia_id`, `descripcion`) VALUES
(1, 1, '2025-10-30 14:20:32', 'ENTRADA', 50, 'recepcion', 1, 'Ingreso producto 1'),
(2, 2, '2025-10-30 14:20:32', 'ENTRADA', 40, 'recepcion', 2, 'Ingreso producto 2'),
(3, 3, '2025-10-30 14:20:32', 'ENTRADA', 60, 'recepcion', 3, 'Ingreso producto 3'),
(4, 4, '2025-10-30 14:20:32', 'ENTRADA', 30, 'recepcion', 4, 'Ingreso producto 4'),
(5, 5, '2025-10-30 14:20:32', 'ENTRADA', 200, 'recepcion', 5, 'Ingreso producto 5'),
(6, 6, '2025-10-30 14:20:32', 'ENTRADA', 70, 'recepcion', 6, 'Ingreso producto 6'),
(7, 7, '2025-10-30 14:20:32', 'ENTRADA', 20, 'recepcion', 7, 'Ingreso producto 7'),
(8, 8, '2025-10-30 14:20:32', 'ENTRADA', 200, 'recepcion', 8, 'Ingreso producto 8'),
(9, 9, '2025-10-30 14:20:32', 'ENTRADA', 150, 'recepcion', 9, 'Ingreso producto 9'),
(10, 10, '2025-10-30 14:20:32', 'ENTRADA', 80, 'recepcion', 10, 'Ingreso producto 10'),
(11, 11, '2025-10-30 14:20:32', 'ENTRADA', 90, 'recepcion', 11, 'Ingreso producto 11'),
(12, 12, '2025-10-30 14:20:32', 'ENTRADA', 60, 'recepcion', 12, 'Ingreso producto 12'),
(13, 13, '2025-10-30 14:20:32', 'ENTRADA', 300, 'recepcion', 13, 'Ingreso producto 13'),
(14, 14, '2025-10-30 14:20:32', 'ENTRADA', 40, 'recepcion', 14, 'Ingreso producto 14'),
(15, 15, '2025-10-30 14:20:32', 'ENTRADA', 120, 'recepcion', 15, 'Ingreso producto 15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_ferreteria` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha_pedido` datetime DEFAULT current_timestamp(),
  `estado` enum('PENDIENTE','RECIBIDO','PARCIAL','CANCELADO') DEFAULT 'PENDIENTE',
  `fecha_entrega_estimada` date DEFAULT NULL,
  `comentarios` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_ferreteria`, `id_proveedor`, `fecha_pedido`, `estado`, `fecha_entrega_estimada`, `comentarios`) VALUES
(1, 1, 1, '2025-01-10 00:00:00', 'PENDIENTE', '2025-01-15', 'Pedido inicial 1'),
(2, 2, 2, '2025-01-11 00:00:00', 'PENDIENTE', '2025-01-16', 'Pedido inicial 2'),
(3, 3, 3, '2025-01-12 00:00:00', 'PENDIENTE', '2025-01-17', 'Pedido inicial 3'),
(4, 4, 4, '2025-01-13 00:00:00', 'PENDIENTE', '2025-01-18', 'Pedido inicial 4'),
(5, 5, 5, '2025-01-14 00:00:00', 'PENDIENTE', '2025-01-19', 'Pedido inicial 5'),
(6, 6, 6, '2025-01-15 00:00:00', 'PENDIENTE', '2025-01-20', 'Pedido inicial 6'),
(7, 7, 7, '2025-01-16 00:00:00', 'PENDIENTE', '2025-01-21', 'Pedido inicial 7'),
(8, 8, 8, '2025-01-17 00:00:00', 'PENDIENTE', '2025-01-22', 'Pedido inicial 8'),
(9, 9, 9, '2025-01-18 00:00:00', 'PENDIENTE', '2025-01-23', 'Pedido inicial 9'),
(10, 10, 10, '2025-01-19 00:00:00', 'PENDIENTE', '2025-01-24', 'Pedido inicial 10'),
(11, 11, 11, '2025-01-20 00:00:00', 'PENDIENTE', '2025-01-25', 'Pedido inicial 11'),
(12, 12, 12, '2025-01-21 00:00:00', 'PENDIENTE', '2025-01-26', 'Pedido inicial 12'),
(13, 13, 13, '2025-01-22 00:00:00', 'PENDIENTE', '2025-01-27', 'Pedido inicial 13'),
(14, 14, 14, '2025-01-23 00:00:00', 'PENDIENTE', '2025-01-28', 'Pedido inicial 14'),
(15, 15, 15, '2025-01-24 00:00:00', 'PENDIENTE', '2025-01-29', 'Pedido inicial 15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `id_ferreteria` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(200) NOT NULL,
  `presentacion` varchar(100) DEFAULT NULL,
  `precio_compra` decimal(12,2) DEFAULT 0.00,
  `precio_venta` decimal(12,2) DEFAULT 0.00,
  `descuento` decimal(7,2) DEFAULT 0.00,
  `stock_minimo` int(11) DEFAULT 0,
  `stock_actual` int(11) DEFAULT 0,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `id_ferreteria`, `id_proveedor`, `id_categoria`, `codigo`, `nombre`, `presentacion`, `precio_compra`, `precio_venta`, `descuento`, `stock_minimo`, `stock_actual`, `fecha_creacion`) VALUES
(1, 1, 1, 1, 'PR-001', 'Martillo 16oz', 'Unidad', 8.00, 12.00, 0.00, 5, 50, '2025-10-30 14:20:32'),
(2, 2, 2, 2, 'PR-002', 'Cable 2mm', 'Rollo', 20.00, 28.00, 0.00, 10, 40, '2025-10-30 14:20:32'),
(3, 3, 3, 3, 'PR-003', 'Llave Ajustable 8\"', 'Unidad', 15.00, 22.00, 0.00, 5, 60, '2025-10-30 14:20:32'),
(4, 4, 4, 4, 'PR-004', 'Pintura Blanca 1lt', 'Bote', 12.00, 18.00, 0.00, 6, 30, '2025-10-30 14:20:32'),
(5, 5, 5, 5, 'PR-005', 'Tornillo M6 x 30', 'Caja', 5.00, 8.00, 0.00, 100, 500, '2025-10-30 14:20:32'),
(6, 6, 6, 6, 'PR-006', 'Alicate 7\"', 'Unidad', 10.00, 15.00, 0.00, 5, 70, '2025-10-30 14:20:32'),
(7, 7, 7, 7, 'PR-007', 'Filtro de agua', 'Unidad', 25.00, 35.00, 0.00, 2, 20, '2025-10-30 14:20:32'),
(8, 8, 8, 8, 'PR-008', 'Bombillo LED 9W', 'Unidad', 3.00, 5.00, 0.00, 10, 200, '2025-10-30 14:20:32'),
(9, 9, 9, 9, 'PR-009', 'Guantes de seguridad', 'Par', 6.00, 9.00, 0.00, 10, 150, '2025-10-30 14:20:32'),
(10, 10, 10, 10, 'PR-010', 'Cemento 42.5kg', 'Saco', 25.00, 35.00, 0.00, 5, 80, '2025-10-30 14:20:32'),
(11, 11, 11, 11, 'PR-011', 'Brocha 2\"', 'Unidad', 2.50, 4.00, 0.00, 10, 90, '2025-10-30 14:20:32'),
(12, 12, 12, 12, 'PR-012', 'Silicona 300ml', 'Cartucho', 4.00, 6.50, 0.00, 10, 60, '2025-10-30 14:20:32'),
(13, 13, 13, 13, 'PR-013', 'Cinta aislante 19mm', 'Unidad', 1.00, 1.80, 0.00, 30, 300, '2025-10-30 14:20:32'),
(14, 14, 14, 14, 'PR-014', 'Tubo PVC 2\"', 'Unidad', 7.00, 10.00, 0.00, 8, 40, '2025-10-30 14:20:32'),
(15, 15, 15, 15, 'PR-015', 'Pernos M8 x 50', 'Caja', 12.00, 17.00, 0.00, 50, 120, '2025-10-30 14:20:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `id_ferreteria` int(11) NOT NULL,
  `rut` varchar(50) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `pagina_web` varchar(200) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `id_ferreteria`, `rut`, `nombre`, `id_direccion`, `telefono`, `pagina_web`, `fecha_creacion`) VALUES
(1, 1, '800000001-1', 'Proveedor A', 1, '320200001', 'http://provA.local', '2025-10-30 14:20:31'),
(2, 2, '800000002-1', 'Proveedor B', 2, '320200002', 'http://provB.local', '2025-10-30 14:20:31'),
(3, 3, '800000003-1', 'Proveedor C', 3, '320200003', 'http://provC.local', '2025-10-30 14:20:31'),
(4, 4, '800000004-1', 'Proveedor D', 4, '320200004', 'http://provD.local', '2025-10-30 14:20:31'),
(5, 5, '800000005-1', 'Proveedor E', 5, '320200005', 'http://provE.local', '2025-10-30 14:20:31'),
(6, 6, '800000006-1', 'Proveedor F', 6, '320200006', 'http://provF.local', '2025-10-30 14:20:31'),
(7, 7, '800000007-1', 'Proveedor G', 7, '320200007', 'http://provG.local', '2025-10-30 14:20:31'),
(8, 8, '800000008-1', 'Proveedor H', 8, '320200008', 'http://provH.local', '2025-10-30 14:20:31'),
(9, 9, '800000009-1', 'Proveedor I', 9, '320200009', 'http://provI.local', '2025-10-30 14:20:31'),
(10, 10, '800000010-1', 'Proveedor J', 10, '320200010', 'http://provJ.local', '2025-10-30 14:20:31'),
(11, 11, '800000011-1', 'Proveedor K', 11, '320200011', 'http://provK.local', '2025-10-30 14:20:31'),
(12, 12, '800000012-1', 'Proveedor L', 12, '320200012', 'http://provL.local', '2025-10-30 14:20:31'),
(13, 13, '800000013-1', 'Proveedor M', 13, '320200013', 'http://provM.local', '2025-10-30 14:20:31'),
(14, 14, '800000014-1', 'Proveedor N', 14, '320200014', 'http://provN.local', '2025-10-30 14:20:31'),
(15, 15, '800000015-1', 'Proveedor O', 15, '320200015', 'http://provO.local', '2025-10-30 14:20:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recepcion`
--

CREATE TABLE `recepcion` (
  `id_recepcion` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `fecha_recepcion` datetime DEFAULT current_timestamp(),
  `id_empleado` int(11) DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recepcion`
--

INSERT INTO `recepcion` (`id_recepcion`, `id_pedido`, `fecha_recepcion`, `id_empleado`, `observaciones`) VALUES
(1, 1, '2025-01-15 00:00:00', 1, 'Recepción ok 1'),
(2, 2, '2025-01-16 00:00:00', 2, 'Recepción ok 2'),
(3, 3, '2025-01-17 00:00:00', 3, 'Recepción ok 3'),
(4, 4, '2025-01-18 00:00:00', 4, 'Recepción ok 4'),
(5, 5, '2025-01-19 00:00:00', 5, 'Recepción ok 5'),
(6, 6, '2025-01-20 00:00:00', 6, 'Recepción ok 6'),
(7, 7, '2025-01-21 00:00:00', 7, 'Recepción ok 7'),
(8, 8, '2025-01-22 00:00:00', 8, 'Recepción ok 8'),
(9, 9, '2025-01-23 00:00:00', 9, 'Recepción ok 9'),
(10, 10, '2025-01-24 00:00:00', 10, 'Recepción ok 10'),
(11, 11, '2025-01-25 00:00:00', 11, 'Recepción ok 11'),
(12, 12, '2025-01-26 00:00:00', 12, 'Recepción ok 12'),
(13, 13, '2025-01-27 00:00:00', 13, 'Recepción ok 13'),
(14, 14, '2025-01-28 00:00:00', 14, 'Recepción ok 14'),
(15, 15, '2025-01-29 00:00:00', 15, 'Recepción ok 15');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion_proveedor`
--
ALTER TABLE `calificacion_proveedor`
  ADD PRIMARY KEY (`id_calificacion`),
  ADD KEY `fk_calif_empleado` (`id_empleado`),
  ADD KEY `id_proveedor` (`id_proveedor`,`fecha`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `uq_cliente_rut` (`id_ferreteria`,`rut`),
  ADD KEY `fk_cliente_direccion` (`id_direccion`),
  ADD KEY `id_ferreteria` (`id_ferreteria`);

--
-- Indices de la tabla `cliente_telefono`
--
ALTER TABLE `cliente_telefono`
  ADD PRIMARY KEY (`id_telefono`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle_pedido`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_recepcion`
--
ALTER TABLE `detalle_recepcion`
  ADD PRIMARY KEY (`id_detalle_recepcion`),
  ADD KEY `id_recepcion` (`id_recepcion`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `fk_empleado_direccion` (`id_direccion`),
  ADD KEY `id_ferreteria` (`id_ferreteria`);

--
-- Indices de la tabla `factura_pago`
--
ALTER TABLE `factura_pago`
  ADD PRIMARY KEY (`id_factura_pago`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_forma_pago` (`id_forma_pago`);

--
-- Indices de la tabla `factura_venta`
--
ALTER TABLE `factura_venta`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `fk_factura_ferreteria` (`id_ferreteria`),
  ADD KEY `fecha` (`fecha`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `ferreteria`
--
ALTER TABLE `ferreteria`
  ADD PRIMARY KEY (`id_ferreteria`),
  ADD UNIQUE KEY `nit` (`nit`),
  ADD KEY `fk_ferreteria_direccion` (`id_direccion`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`id_forma_pago`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `id_producto` (`id_producto`,`fecha`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedido_ferreteria` (`id_ferreteria`),
  ADD KEY `id_proveedor` (`id_proveedor`,`estado`,`fecha_pedido`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `uq_producto_codigo` (`id_ferreteria`,`codigo`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `stock_actual` (`stock_actual`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `uq_proveedor_rut` (`id_ferreteria`,`rut`),
  ADD KEY `fk_proveedor_direccion` (`id_direccion`),
  ADD KEY `id_ferreteria` (`id_ferreteria`);

--
-- Indices de la tabla `recepcion`
--
ALTER TABLE `recepcion`
  ADD PRIMARY KEY (`id_recepcion`),
  ADD KEY `fk_recepcion_empleado` (`id_empleado`),
  ADD KEY `id_pedido` (`id_pedido`,`fecha_recepcion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion_proveedor`
--
ALTER TABLE `calificacion_proveedor`
  MODIFY `id_calificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `cliente_telefono`
--
ALTER TABLE `cliente_telefono`
  MODIFY `id_telefono` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `detalle_recepcion`
--
ALTER TABLE `detalle_recepcion`
  MODIFY `id_detalle_recepcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `factura_pago`
--
ALTER TABLE `factura_pago`
  MODIFY `id_factura_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `factura_venta`
--
ALTER TABLE `factura_venta`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `ferreteria`
--
ALTER TABLE `ferreteria`
  MODIFY `id_ferreteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id_forma_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `recepcion`
--
ALTER TABLE `recepcion`
  MODIFY `id_recepcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacion_proveedor`
--
ALTER TABLE `calificacion_proveedor`
  ADD CONSTRAINT `fk_calif_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_calif_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cliente_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria` (`id_ferreteria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente_telefono`
--
ALTER TABLE `cliente_telefono`
  ADD CONSTRAINT `fk_cliente_tel_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `fk_detfac_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura_venta` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detfac_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detpedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detpedido_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_recepcion`
--
ALTER TABLE `detalle_recepcion`
  ADD CONSTRAINT `fk_detrec_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detrec_recepcion` FOREIGN KEY (`id_recepcion`) REFERENCES `recepcion` (`id_recepcion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empleado_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria` (`id_ferreteria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura_pago`
--
ALTER TABLE `factura_pago`
  ADD CONSTRAINT `fk_facturapago_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura_venta` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_facturapago_formapago` FOREIGN KEY (`id_forma_pago`) REFERENCES `forma_pago` (`id_forma_pago`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura_venta`
--
ALTER TABLE `factura_venta`
  ADD CONSTRAINT `fk_factura_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_factura_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria` (`id_ferreteria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ferreteria`
--
ALTER TABLE `ferreteria`
  ADD CONSTRAINT `fk_ferreteria_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  ADD CONSTRAINT `fk_movinv_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria` (`id_ferreteria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedido_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_prod_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_producto` (`id_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prod_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria` (`id_ferreteria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prod_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_proveedor_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_proveedor_ferreteria` FOREIGN KEY (`id_ferreteria`) REFERENCES `ferreteria` (`id_ferreteria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `recepcion`
--
ALTER TABLE `recepcion`
  ADD CONSTRAINT `fk_recepcion_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recepcion_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
