SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `IdCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(200) NOT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `categorias` (`IdCategoria`, `Categoria`) VALUES
(1, 'Cervezas tiradas'),
(2, 'Cervezas de litro'),
(3, 'Porrones'),
(4, 'Destilados'),
(5, 'Aperitivos'),
(6, 'Licores'),
(7, 'Bebidas sin alcohol'),
(8, 'Porrones');

DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE IF NOT EXISTS `movimientos` (
  `IdMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `IdProducto` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` float NOT NULL,
  `Nota` varchar(700) NOT NULL,
  `IdTipoMovimiento` int(11) NOT NULL,
  `ultVenta` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdMovimiento`),
  KEY `IdMovimiento` (`IdTipoMovimiento`),
  KEY `IdProducto` (`IdProducto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `IdProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `StockMinimo` int(11) NOT NULL,
  `StockMaximo` int(11) NOT NULL,
  `IdUnidad` int(11) NOT NULL,
  `IdCategoria` int(11) NOT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `IdUnidad` (`IdUnidad`,`IdCategoria`),
  KEY `IdCategoria` (`IdCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `productosventas`;
CREATE TABLE IF NOT EXISTS `productosventas` (
  `IdProductoVenta` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`IdProductoVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `recetas`;
CREATE TABLE IF NOT EXISTS `recetas` (
  `IdProducto` int(11) NOT NULL,
  `IdProductoVenta` int(11) NOT NULL,
  `Cantidad` float NOT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `IdProductoVenta` (`IdProductoVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tipomovimientos`;
CREATE TABLE IF NOT EXISTS `tipomovimientos` (
  `IdTipoMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `TipoMovimiento` varchar(100) NOT NULL,
  PRIMARY KEY (`IdTipoMovimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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

DROP TABLE IF EXISTS `unidades`;
CREATE TABLE IF NOT EXISTS `unidades` (
  `IdUnidad` int(11) NOT NULL AUTO_INCREMENT,
  `TipoUnidad` varchar(10) NOT NULL,
  PRIMARY KEY (`IdUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `unidades` (`IdUnidad`, `TipoUnidad`) VALUES
(1, 'Unidades'),
(2, 'Mililitros'),
(3, 'Kilos'),
(4, 'Gramos');

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) NOT NULL,
  `Contrasena` varchar(50) NOT NULL,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `usuarios` (`IdUsuario`, `Usuario`, `Contrasena`) VALUES
(1, 'Admin', 'Admin'),
(2, 'Gonzalo', '123456');


ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`IdTipoMovimiento`) REFERENCES `tipomovimientos` (`IdTipoMovimiento`),
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`);

ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`IdUnidad`) REFERENCES `unidades` (`IdUnidad`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`IdCategoria`);

ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  ADD CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`IdProductoVenta`) REFERENCES `productosventas` (`IdProductoVenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
