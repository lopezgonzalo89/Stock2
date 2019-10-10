-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 10-10-2019 a las 20:57:12
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `choppin_db`
--
CREATE DATABASE IF NOT EXISTS `choppin_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `choppin_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `IdCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(200) NOT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`IdCategoria`, `Categoria`) VALUES
(1, 'Cervezas tiradas'),
(2, 'Cervezas de litro'),
(3, 'Porrones'),
(4, 'Destilados'),
(5, 'Aperitivos'),
(6, 'Licores'),
(7, 'Bebidas sin alcohol'),
(8, 'Porrones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE IF NOT EXISTS `movimientos` (
  `IdMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `IdProducto` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` float NOT NULL,
  `Nota` varchar(700) NOT NULL,
  `IdTipoMovimiento` int(11) NOT NULL,
  PRIMARY KEY (`IdMovimiento`),
  KEY `IdMovimiento` (`IdTipoMovimiento`),
  KEY `IdProducto` (`IdProducto`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`IdMovimiento`, `IdProducto`, `Fecha`, `Cantidad`, `Nota`, `IdTipoMovimiento`) VALUES
(1, 1, '2019-10-11', 12, '', 1),
(2, 4, '2019-10-04', 4, '', 1),
(4, 3, '2019-10-03', 2, '', 1),
(13, 1, '2019-10-09', -3, 'Insertado desde C#', 3),
(14, 1, '2019-10-09', -2, 'Insertado desde C#', 3),
(15, 3, '2019-10-09', -0.05, 'Insertado desde C#', 3),
(16, 4, '2019-10-09', -0.2, 'Insertado desde C#', 3),
(17, 3, '2019-10-09', -0.15, 'Insertado desde C#', 3),
(18, 4, '2019-10-09', -0.6, 'Insertado desde C#', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `IdProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `Activo` tinyint(1) NOT NULL,
  `StockMinimo` int(11) NOT NULL,
  `StockMaximo` int(11) NOT NULL,
  `IdUnidad` int(11) NOT NULL,
  `IdCategoria` int(11) NOT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `IdUnidad` (`IdUnidad`,`IdCategoria`),
  KEY `IdCategoria` (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IdProducto`, `Nombre`, `Activo`, `StockMinimo`, `StockMaximo`, `IdUnidad`, `IdCategoria`) VALUES
(1, 'Cerveza Heineken', 1, 12, 36, 1, 2),
(3, 'Fernet Branca', 1, 1, 3, 1, 5),
(4, 'Coca Cola', 1, 3, 12, 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosventas`
--

DROP TABLE IF EXISTS `productosventas`;
CREATE TABLE IF NOT EXISTS `productosventas` (
  `IdProductoVenta` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`IdProductoVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productosventas`
--

INSERT INTO `productosventas` (`IdProductoVenta`, `Nombre`) VALUES
(1, 'Fernet'),
(2, 'Cerveza Heineken');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

DROP TABLE IF EXISTS `recetas`;
CREATE TABLE IF NOT EXISTS `recetas` (
  `IdProducto` int(11) NOT NULL,
  `IdProductoVenta` int(11) NOT NULL,
  `Cantidad` float NOT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `IdProductoVenta` (`IdProductoVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`IdProducto`, `IdProductoVenta`, `Cantidad`) VALUES
(1, 2, 1),
(3, 1, 0.05),
(4, 1, 0.2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomovimientos`
--

DROP TABLE IF EXISTS `tipomovimientos`;
CREATE TABLE IF NOT EXISTS `tipomovimientos` (
  `IdTipoMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `TipoMovimiento` varchar(100) NOT NULL,
  PRIMARY KEY (`IdTipoMovimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipomovimientos`
--

INSERT INTO `tipomovimientos` (`IdTipoMovimiento`, `TipoMovimiento`) VALUES
(1, 'Compra'),
(3, 'Venta'),
(4, 'Merma'),
(5, 'Roturas'),
(6, 'Perdidas'),
(7, 'Ajuste'),
(8, 'Gonzalo'),
(9, 'Sebastian'),
(10, 'Omar'),
(11, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ultventa`
--

DROP TABLE IF EXISTS `ultventa`;
CREATE TABLE IF NOT EXISTS `ultventa` (
  `UltVenta` int(11) NOT NULL,
  PRIMARY KEY (`UltVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ultventa`
--

INSERT INTO `ultventa` (`UltVenta`) VALUES
(1),
(2),
(3),
(4),
(5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

DROP TABLE IF EXISTS `unidades`;
CREATE TABLE IF NOT EXISTS `unidades` (
  `IdUnidad` int(11) NOT NULL AUTO_INCREMENT,
  `TipoUnidad` varchar(10) NOT NULL,
  PRIMARY KEY (`IdUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`IdUnidad`, `TipoUnidad`) VALUES
(1, 'Unidades'),
(2, 'Mililitros'),
(3, 'Kilos'),
(4, 'Gramos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) NOT NULL,
  `Contrasena` varchar(50) NOT NULL,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `Usuario`, `Contrasena`) VALUES
(1, 'Admin', 'Admin'),
(2, 'Gonzalo', '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `IdVenta` int(11) NOT NULL AUTO_INCREMENT,
  `IdProductoVenta` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`IdVenta`),
  KEY `IdProductoVenta` (`IdProductoVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`IdVenta`, `IdProductoVenta`, `Cantidad`) VALUES
(2, 2, 3),
(3, 2, 2),
(4, 1, 1),
(5, 1, 3);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`IdTipoMovimiento`) REFERENCES `tipomovimientos` (`IdTipoMovimiento`),
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`IdUnidad`) REFERENCES `unidades` (`IdUnidad`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`IdCategoria`);

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  ADD CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`IdProductoVenta`) REFERENCES `productosventas` (`IdProductoVenta`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`IdProductoVenta`) REFERENCES `productosventas` (`IdProductoVenta`);
--
-- Base de datos: `registro`
--
CREATE DATABASE IF NOT EXISTS `registro` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `registro`;
--
-- Base de datos: `rodri_db`
--
CREATE DATABASE IF NOT EXISTS `rodri_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `rodri_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(100) NOT NULL AUTO_INCREMENT,
  `id_prestamo` int(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dni` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  KEY `id_prestamo` (`id_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotas`
--

DROP TABLE IF EXISTS `cuotas`;
CREATE TABLE IF NOT EXISTS `cuotas` (
  `id_cuotas` int(100) NOT NULL AUTO_INCREMENT,
  `fecha_vencimiento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cantidad_cuotas` int(100) NOT NULL,
  `monto_cuota` int(100) NOT NULL,
  `id_pago` int(100) NOT NULL,
  PRIMARY KEY (`id_cuotas`),
  KEY `id_pago` (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formadepagos`
--

DROP TABLE IF EXISTS `formadepagos`;
CREATE TABLE IF NOT EXISTS `formadepagos` (
  `id_formaPago` int(100) NOT NULL AUTO_INCREMENT,
  `diario` varchar(100) NOT NULL,
  `semanal` varchar(100) NOT NULL,
  `quincenal` varchar(100) NOT NULL,
  `mensual` varchar(100) NOT NULL,
  PRIMARY KEY (`id_formaPago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

DROP TABLE IF EXISTS `monedas`;
CREATE TABLE IF NOT EXISTS `monedas` (
  `id_moneda` int(100) NOT NULL AUTO_INCREMENT,
  `nombre_moneda` varchar(100) NOT NULL,
  PRIMARY KEY (`id_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

DROP TABLE IF EXISTS `pagos`;
CREATE TABLE IF NOT EXISTS `pagos` (
  `id_pago` int(100) NOT NULL AUTO_INCREMENT,
  `fecha_pago` date NOT NULL,
  `monto_pago` int(100) NOT NULL,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
CREATE TABLE IF NOT EXISTS `prestamos` (
  `id_prestamo` int(100) NOT NULL AUTO_INCREMENT,
  `monto` int(100) NOT NULL,
  `interes` int(100) NOT NULL,
  `id_moneda` int(100) NOT NULL,
  `id_cuotas` int(100) NOT NULL,
  `id_formaPago` int(100) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `fk_monedas_prestamos` (`id_moneda`),
  KEY `id_moneda` (`id_moneda`),
  KEY `id_cuotas` (`id_cuotas`),
  KEY `id_cuotas_2` (`id_cuotas`),
  KEY `id_formaPago` (`id_formaPago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamos` (`id_prestamo`);

--
-- Filtros para la tabla `cuotas`
--
ALTER TABLE `cuotas`
  ADD CONSTRAINT `cuotas_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `fk_monedas_prestamos` FOREIGN KEY (`id_moneda`) REFERENCES `monedas` (`id_moneda`),
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`id_cuotas`) REFERENCES `cuotas` (`id_cuotas`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_formaPago`) REFERENCES `formadepagos` (`id_formaPago`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
