-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-11-2018 a las 06:12:19
-- Versión del servidor: 5.7.21
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `herbalife_online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAdmin` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `intentos` int(11) NOT NULL DEFAULT '0',
  `fechaCreado` date NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdmin`, `nombreAdmin`, `password`, `rol`, `intentos`, `fechaCreado`) VALUES
(5, 'peter29', '123', 'A', 0, '2018-11-24'),
(8, 'wendy27', 'PWsMmY58', 'A', 0, '2018-11-26'),
(9, 'peter123', '123Abc', 'U', 2, '2018-11-26'),
(10, 'ptzul', 'PWsMmY58', 'U', 0, '2018-11-26'),
(11, 'ptzul', 'PWsMmY58', 'U', 0, '2018-11-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nombreCategoria`) VALUES
(10, 'Nutrición'),
(11, ' Cuidado Personal '),
(12, 'Recetas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE IF NOT EXISTS `ciudad` (
  `idCiudad` int(11) NOT NULL,
  `nombreCiudad` varchar(60) NOT NULL,
  `codPostal` int(4) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  PRIMARY KEY (`idCiudad`),
  KEY `codPostal` (`codPostal`),
  KEY `FK_ciudad_provincia` (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`idCiudad`, `nombreCiudad`, `codPostal`, `idProvincia`) VALUES
(1, 'CIUDAD DE GUATEMALA', 1000, 1),
(2, 'ALTA VERAPAZ', 16000, 2),
(3, 'BAJA VERAPAZ', 15000, 2),
(4, 'CHIQUIMULA', 20000, 3),
(5, 'EL PROGRESO', 2000, 3),
(6, 'IZABAL', 18000, 3),
(7, 'ZACAPA', 19000, 3),
(8, 'JUTIAPA', 22000, 4),
(9, 'JALAPA', 21000, 4),
(10, 'SANTA ROSA', 6000, 4),
(11, 'CHIMALTENANGO', 4000, 5),
(12, 'SACATEPÉQUEZ', 3000, 5),
(13, 'ESCUINTLA', 5000, 5),
(14, 'QUETZALTENANGO', 9000, 6),
(15, 'RETALHULEU', 11000, 6),
(16, 'SAN MARCOS', 12000, 6),
(17, 'SUCHITEPÉQUEZ', 10000, 6),
(18, 'SOLOLÁ', 7000, 6),
(19, 'TOTONICAPÁN', 8000, 6),
(20, 'HUEHUETENANGO', 13000, 7),
(21, 'QUICHÉ', 14000, 7),
(22, 'PETÉN', 17000, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCliente` varchar(150) NOT NULL,
  `apellidoCliente` varchar(150) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `usuarioCliente` varchar(50) NOT NULL,
  `passwordCliente` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `emailCliente` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  `cuit` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `FK_clientes_provincia` (`idProvincia`),
  KEY `FK_clientes_ciudad` (`idCiudad`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombreCliente`, `apellidoCliente`, `idProvincia`, `estado`, `usuarioCliente`, `passwordCliente`, `telefono`, `emailCliente`, `direccion`, `idCiudad`, `cuit`) VALUES
(14, 'Gerardo', 'Tzul', 1, 1, 'ptzul', '123456', '32750646', 'petertzul@hotmail.es', 'Canton Juchanep', 20, 16165215),
(15, 'Javier', 'Tzul', 3, 0, 'jtzul', '123', '230912423', 'javier_tzul@hotmail.es', 'Canton Juchanep', 1, 451256132);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

DROP TABLE IF EXISTS `detalles`;
CREATE TABLE IF NOT EXISTS `detalles` (
  `idDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `fechaVenta` date NOT NULL,
  `precioVenta` double NOT NULL,
  `cantidadKilos` int(11) NOT NULL,
  `totalVenta` double NOT NULL,
  `numFac` int(110) NOT NULL,
  `tipoFactura` varchar(5) NOT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `FK_detalles_clientes` (`idCliente`),
  KEY `FK_detalles_productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalles`
--

INSERT INTO `detalles` (`idDetalle`, `idCliente`, `idProducto`, `fechaVenta`, `precioVenta`, `cantidadKilos`, `totalVenta`, `numFac`, `tipoFactura`) VALUES
(170, 14, 32, '2018-11-26', 50, 2, 100, 1, 'B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `numFac` int(110) NOT NULL,
  `fechaVenta` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idAdmin` int(11) NOT NULL,
  `totalVenta` double NOT NULL,
  `tipoFactura` varchar(50) NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `FK_factura_clientes` (`idCliente`),
  KEY `FK_factura_administrador` (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `numFac`, `fechaVenta`, `idCliente`, `idAdmin`, `totalVenta`, `tipoFactura`) VALUES
(56, 1, '2018-11-26', 14, 10, 100, 'B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `idInventario` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadIngresada` int(11) NOT NULL,
  `precioVenta` double NOT NULL,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idInventario`),
  KEY `FK_inventario_productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idInventario`, `cantidadIngresada`, `precioVenta`, `idProducto`) VALUES
(20, 45, 50, 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pass`
--

DROP TABLE IF EXISTS `pass`;
CREATE TABLE IF NOT EXISTS `pass` (
  `idpass` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) NOT NULL,
  `idAdmin` int(11) NOT NULL,
  PRIMARY KEY (`idpass`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(50) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `precioProducto` double NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `FK_productos_categorias` (`idCategoria`),
  KEY `FK_productos_proveedores` (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombreProducto`, `idProveedor`, `precioProducto`, `idCategoria`) VALUES
(32, 'Batido Nutricional', 17, 150, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProveedor` varchar(100) NOT NULL,
  `apellidoProveedor` varchar(100) NOT NULL,
  `nombreEmpresa` varchar(100) DEFAULT NULL,
  `telefonoProveedor` varchar(100) NOT NULL,
  `direccionProveedor` varchar(100) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `FK_proveedores_ciudad` (`idCiudad`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `nombreProveedor`, `apellidoProveedor`, `nombreEmpresa`, `telefonoProveedor`, `direccionProveedor`, `idCiudad`) VALUES
(17, 'Juan ', 'Perez', 'Herbalife', '239012145', '5ta Avenida 5-90 Zona 11  Col. Mariscal', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE IF NOT EXISTS `provincia` (
  `idProvincia` int(11) NOT NULL,
  `nombreProvincia` varchar(50) NOT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`idProvincia`, `nombreProvincia`) VALUES
(1, 'Región Metropolitana'),
(2, 'Región Norte'),
(3, 'Región Nororiente'),
(4, 'Región Suroriente'),
(5, 'Región Central '),
(6, 'Región Suroccidente'),
(7, 'Regíón Noroccidente'),
(8, 'Región Petén');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp`
--

DROP TABLE IF EXISTS `temp`;
CREATE TABLE IF NOT EXISTS `temp` (
  `idTemp` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `precioVenta` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `iva` double NOT NULL,
  `totalVenta` double NOT NULL,
  `numFac` int(11) NOT NULL,
  `fechaVenta` date NOT NULL,
  `unidad` int(11) NOT NULL,
  `tipoFactura` varchar(5) NOT NULL,
  PRIMARY KEY (`idTemp`),
  KEY `FK_temp_productos` (`idProducto`),
  KEY `FK_temp_clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`idProvincia`) REFERENCES `provincia` (`idProvincia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`idProvincia`) REFERENCES `provincia` (`idProvincia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `detalles_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalles_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idAdmin`) REFERENCES `administrador` (`idAdmin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `temp`
--
ALTER TABLE `temp`
  ADD CONSTRAINT `temp_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
