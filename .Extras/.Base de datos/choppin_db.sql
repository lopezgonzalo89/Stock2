-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2019 a las 12:18:55
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `IdCategoria` int(11) NOT NULL,
  `Categoria` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(8, 'Porrones'),
(9, 'Espumantes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `IdMovimiento` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Cantidad` float NOT NULL,
  `Nota` varchar(700) DEFAULT NULL,
  `IdTipoMovimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IdProducto` int(11) NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `StockMinimo` int(11) NOT NULL,
  `StockMaximo` int(11) NOT NULL,
  `IdUnidad` int(11) NOT NULL,
  `IdCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IdProducto`, `Nombre`, `StockMinimo`, `StockMaximo`, `IdUnidad`, `IdCategoria`) VALUES
(1, 'Bebida Heineken', 24, 48, 1, 2),
(2, 'Tirada Equmm Ipa', 50, 100, 2, 1),
(3, 'Coca Cola', 6, 12, 2, 7),
(4, 'Fernet Branca', 2, 6, 2, 5),
(5, 'Tirada Equmm Honey', 50, 100, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `IdProductoVenta` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `Cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`IdProductoVenta`, `IdProducto`, `Cantidad`) VALUES
(101, 2, 0.5),
(102, 5, 0.5),
(804, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomovimientos`
--

CREATE TABLE `tipomovimientos` (
  `IdTipoMovimiento` int(11) NOT NULL,
  `TipoMovimiento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `ultventa` (
  `IdUltVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `IdUnidad` int(11) NOT NULL,
  `TipoUnidad` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`IdUnidad`, `TipoUnidad`) VALUES
(1, 'Unidades'),
(2, 'Litros'),
(3, 'Kilos'),
(4, 'Gramos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Contrasena` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `Usuario`, `Contrasena`) VALUES
(1, 'Admin', 'Admin'),
(2, 'Gonzalo', '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventassimulador`
--

CREATE TABLE `ventassimulador` (
  `IdVentaDetalle` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventassimulador`
--

INSERT INTO `ventassimulador` (`IdVentaDetalle`, `IdProducto`, `cantidad`) VALUES
(1, 804, 1),
(2, 804, 2),
(3, 800, 5),
(4, 804, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`IdMovimiento`),
  ADD KEY `IdMovimiento` (`IdTipoMovimiento`),
  ADD KEY `IdProducto` (`IdProducto`) USING BTREE;

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IdProducto`),
  ADD KEY `IdUnidad` (`IdUnidad`,`IdCategoria`),
  ADD KEY `IdCategoria` (`IdCategoria`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`IdProductoVenta`,`IdProducto`);

--
-- Indices de la tabla `tipomovimientos`
--
ALTER TABLE `tipomovimientos`
  ADD PRIMARY KEY (`IdTipoMovimiento`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`IdUnidad`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- Indices de la tabla `ventassimulador`
--
ALTER TABLE `ventassimulador`
  ADD PRIMARY KEY (`IdVentaDetalle`),
  ADD KEY `IdProducto` (`IdProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `IdCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `IdMovimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `IdProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipomovimientos`
--
ALTER TABLE `tipomovimientos`
  MODIFY `IdTipoMovimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `IdUnidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
