-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2021 a las 01:00:25
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `productos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id_articulo` varchar(4) NOT NULL,
  `descripcion` varchar(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id_articulo`, `descripcion`, `cantidad`) VALUES
('A01', 'ARROZ', 100),
('A02', 'MAIZ', 50),
('A03', 'PAPA', 80),
('A04', 'YUCA', 75),
('A05', 'PANELA', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` varchar(4) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `ciudad`, `sexo`) VALUES
('C01', 'JUAN', 'SAHAGUN', 'M'),
('C02', 'PEDRO', 'MONTERIA', 'M'),
('C03', 'MARTA', 'CALI', 'F'),
('C04', 'MIRTA', 'BUGA', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `numero` varchar(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `valor_total` int(11) DEFAULT NULL,
  `cliente` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`numero`, `fecha`, `valor_total`, `cliente`) VALUES
('F001', '0000-00-00', 2000, 'C01'),
('F002', '0000-00-00', 2140, 'C03'),
('F003', '0000-00-00', 1475, 'C01'),
('F004', '0000-00-00', 1220, 'C02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemfactura`
--

CREATE TABLE `itemfactura` (
  `nfactura` varchar(4) NOT NULL,
  `articulo` varchar(5) NOT NULL,
  `cant` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `itemfactura`
--

INSERT INTO `itemfactura` (`nfactura`, `articulo`, `cant`, `valor`) VALUES
('F001', 'A01', 10, 1000),
('F001', 'A03', 5, 400),
('F001', 'A04', 6, 450),
('F002', 'A01', 8, 800),
('F002', 'A02', 3, 150),
('F002', 'A03', 3, 240),
('F002', 'A04', 6, 450),
('F002', 'A05', 10, 500),
('F003', 'A01', 4, 400),
('F003', 'A02', 6, 300),
('F003', 'A03', 5, 400),
('F003', 'A04', 5, 375),
('F004', 'A01', 4, 400),
('F004', 'A02', 10, 500),
('F004', 'A03', 4, 320);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id_articulo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `cliente` (`cliente`);

--
-- Indices de la tabla `itemfactura`
--
ALTER TABLE `itemfactura`
  ADD PRIMARY KEY (`nfactura`,`articulo`),
  ADD KEY `articulo` (`articulo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `itemfactura`
--
ALTER TABLE `itemfactura`
  ADD CONSTRAINT `itemfactura_ibfk_1` FOREIGN KEY (`nfactura`) REFERENCES `factura` (`numero`),
  ADD CONSTRAINT `itemfactura_ibfk_2` FOREIGN KEY (`articulo`) REFERENCES `articulos` (`id_articulo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
