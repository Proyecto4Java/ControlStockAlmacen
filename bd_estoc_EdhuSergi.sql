-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-12-2016 a las 17:43:34
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_estoc_EdhuSergi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `categoria_id` int(11) NOT NULL,
  `categoria_nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`categoria_id`, `categoria_nom`) VALUES
(1, 'mangas'),
(2, 'figuras'),
(3, 'peluches'),
(4, 'camisetas'),
(5, 'tazas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_comanda`
--

CREATE TABLE `tbl_comanda` (
  `comanda_id` int(11) NOT NULL,
  `comanda_quantitat` int(5) NOT NULL,
  `comanda_data` date NOT NULL,
  `prov_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_comanda`
--

INSERT INTO `tbl_comanda` (`comanda_id`, `comanda_quantitat`, `comanda_data`, `prov_id`) VALUES
(1, 4, '2016-12-14', 1),
(2, 3, '2016-12-15', 1),
(3, 4, '2016-12-19', 2),
(4, 3, '2016-12-25', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detall_com`
--

CREATE TABLE `tbl_detall_com` (
  `detall_com_id` int(11) NOT NULL,
  `comanda_id` int(11) NOT NULL,
  `prod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_detall_com`
--

INSERT INTO `tbl_detall_com` (`detall_com_id`, `comanda_id`, `prod_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 4),
(4, 4, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estoc`
--

CREATE TABLE `tbl_estoc` (
  `estoc_id` int(11) NOT NULL,
  `estoc_q_actual` int(5) NOT NULL,
  `estoc_q_min` int(5) NOT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `lloc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_estoc`
--

INSERT INTO `tbl_estoc` (`estoc_id`, `estoc_q_actual`, `estoc_q_min`, `prod_id`, `lloc_id`) VALUES
(1, 3, 2, 1, 1),
(2, 4, 2, 2, 2),
(3, 5, 2, 3, 3),
(4, 3, 2, 4, 4),
(5, 7, 2, 5, 5),
(6, 6, 2, 6, 6),
(7, 9, 2, 7, 7),
(8, 12, 2, 8, 8),
(9, 4, 2, 9, 9),
(10, 6, 2, 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_lloc`
--

CREATE TABLE `tbl_lloc` (
  `lloc_id` int(11) NOT NULL,
  `num_bloc` enum('Bloc 1','Bloc 2','Bloc3','Bloc 4','Bloc 5','Bloc 6','Bloc 7','Bloc 8') COLLATE utf8_unicode_ci NOT NULL,
  `num_passadis` enum('passadis 1','passadis 2','passadis 3','passadis 4','passadis 5','passadis 6','passadis 7','passadis 8','passadis 9','passadis 10','passadis 11','passadis 12') COLLATE utf8_unicode_ci NOT NULL,
  `num_lleixa` enum('lleixa 1','lleixa 2','lleixa 3','lleixa 4','lleixa 5','lleixa 6','lleixa 7','lleixa 8') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_lloc`
--

INSERT INTO `tbl_lloc` (`lloc_id`, `num_bloc`, `num_passadis`, `num_lleixa`) VALUES
(1, 'Bloc 1', 'passadis 2', 'lleixa 8'),
(2, 'Bloc 4', 'passadis 4', 'lleixa 4'),
(3, 'Bloc 5', 'passadis 7', 'lleixa 4'),
(4, 'Bloc 6', 'passadis 10', 'lleixa 1'),
(5, 'Bloc3', 'passadis 3', 'lleixa 5'),
(6, 'Bloc 1', 'passadis 9', 'lleixa 4'),
(7, 'Bloc 8', 'passadis 2', 'lleixa 6'),
(8, 'Bloc 6', 'passadis 12', 'lleixa 5'),
(9, 'Bloc 2', 'passadis 4', 'lleixa 7'),
(10, 'Bloc 5', 'passadis 11', 'lleixa 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_personas`
--

CREATE TABLE `tbl_personas` (
  `persona_id` int(2) NOT NULL,
  `persona_usuario` varchar(15) NOT NULL,
  `persona_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_personas`
--

INSERT INTO `tbl_personas` (`persona_id`, `persona_usuario`, `persona_password`) VALUES
(1, 'dmarin', 'asdf'),
(2, 'sjimenez', 'qwer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producte`
--

CREATE TABLE `tbl_producte` (
  `prod_id` int(11) NOT NULL,
  `prod_nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `prod_foto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `serie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_producte`
--

INSERT INTO `tbl_producte` (`prod_id`, `prod_nom`, `prod_foto`, `serie_id`) VALUES
(1, 'Dragon Ball', '', 10),
(2, 'One Piece', '', 11),
(3, 'Luffy', '', 12),
(4, 'Kirito', '', 13),
(5, 'Pikachu', '', 14),
(6, 'Totoro', '', 15),
(7, 'Naruto', '', 16),
(8, 'SAO', '', 17),
(9, 'Star Trek', '', 18),
(10, 'Star Wars', '', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proveidor`
--

CREATE TABLE `tbl_proveidor` (
  `prov_id` int(11) NOT NULL,
  `prov_nom` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `prov_adre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prov_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_proveidor`
--

INSERT INTO `tbl_proveidor` (`prov_id`, `prov_nom`, `prov_adre`, `prov_email`) VALUES
(1, 'MangaPanda', 'c/ Barcelona 40', 'hola@mangapanda.com'),
(2, 'Figma', 'c/ Torrent de les Flors s/n', 'figma@figma.com'),
(3, 'PeluchesALL', 'c/ Laguna 20', 'peluches@peluches.all'),
(4, 'TusCamisetas', 'av Gran Via 2', 'hola@camisetas.io'),
(5, 'MuchasTazas', 'c/ Castelao 30', 'hola@muchastazas.org');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_serie`
--

CREATE TABLE `tbl_serie` (
  `serie_id` int(11) NOT NULL,
  `serie_nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_serie`
--

INSERT INTO `tbl_serie` (`serie_id`, `serie_nom`, `categoria_id`) VALUES
(10, 'accion', 1),
(11, 'aventura', 1),
(12, 'fijas', 2),
(13, 'articuladas', 2),
(14, 'algodon', 3),
(15, 'felpa', 3),
(16, 'medianas', 4),
(17, 'grandes', 4),
(18, 'te', 5),
(19, 'cafe', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `tbl_comanda`
--
ALTER TABLE `tbl_comanda`
  ADD PRIMARY KEY (`comanda_id`),
  ADD KEY `FK_comanda_prov` (`prov_id`);

--
-- Indices de la tabla `tbl_detall_com`
--
ALTER TABLE `tbl_detall_com`
  ADD PRIMARY KEY (`detall_com_id`),
  ADD KEY `FK_detall_com_prod` (`prod_id`),
  ADD KEY `FK_detall_com_comanda` (`comanda_id`);

--
-- Indices de la tabla `tbl_estoc`
--
ALTER TABLE `tbl_estoc`
  ADD PRIMARY KEY (`estoc_id`),
  ADD KEY `FK_estoc_prod` (`prod_id`),
  ADD KEY `FK_estoc_lloc` (`lloc_id`);

--
-- Indices de la tabla `tbl_lloc`
--
ALTER TABLE `tbl_lloc`
  ADD PRIMARY KEY (`lloc_id`);

--
-- Indices de la tabla `tbl_personas`
--
ALTER TABLE `tbl_personas`
  ADD PRIMARY KEY (`persona_id`);

--
-- Indices de la tabla `tbl_producte`
--
ALTER TABLE `tbl_producte`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `FK_prod_serie` (`serie_id`);

--
-- Indices de la tabla `tbl_proveidor`
--
ALTER TABLE `tbl_proveidor`
  ADD PRIMARY KEY (`prov_id`);

--
-- Indices de la tabla `tbl_serie`
--
ALTER TABLE `tbl_serie`
  ADD PRIMARY KEY (`serie_id`),
  ADD KEY `FK_serie_categoria` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tbl_comanda`
--
ALTER TABLE `tbl_comanda`
  MODIFY `comanda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tbl_detall_com`
--
ALTER TABLE `tbl_detall_com`
  MODIFY `detall_com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tbl_estoc`
--
ALTER TABLE `tbl_estoc`
  MODIFY `estoc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `tbl_lloc`
--
ALTER TABLE `tbl_lloc`
  MODIFY `lloc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `tbl_personas`
--
ALTER TABLE `tbl_personas`
  MODIFY `persona_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_producte`
--
ALTER TABLE `tbl_producte`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `tbl_proveidor`
--
ALTER TABLE `tbl_proveidor`
  MODIFY `prov_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tbl_serie`
--
ALTER TABLE `tbl_serie`
  MODIFY `serie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_comanda`
--
ALTER TABLE `tbl_comanda`
  ADD CONSTRAINT `FK_comanda_prov` FOREIGN KEY (`prov_id`) REFERENCES `tbl_proveidor` (`prov_id`);

--
-- Filtros para la tabla `tbl_detall_com`
--
ALTER TABLE `tbl_detall_com`
  ADD CONSTRAINT `FK_detall_com_comanda` FOREIGN KEY (`comanda_id`) REFERENCES `tbl_comanda` (`comanda_id`),
  ADD CONSTRAINT `FK_detall_com_prod` FOREIGN KEY (`prod_id`) REFERENCES `tbl_producte` (`prod_id`);

--
-- Filtros para la tabla `tbl_estoc`
--
ALTER TABLE `tbl_estoc`
  ADD CONSTRAINT `FK_estoc_lloc` FOREIGN KEY (`lloc_id`) REFERENCES `tbl_lloc` (`lloc_id`),
  ADD CONSTRAINT `FK_estoc_prod` FOREIGN KEY (`prod_id`) REFERENCES `tbl_producte` (`prod_id`);

--
-- Filtros para la tabla `tbl_producte`
--
ALTER TABLE `tbl_producte`
  ADD CONSTRAINT `FK_prod_serie` FOREIGN KEY (`serie_id`) REFERENCES `tbl_serie` (`serie_id`);

--
-- Filtros para la tabla `tbl_serie`
--
ALTER TABLE `tbl_serie`
  ADD CONSTRAINT `FK_serie_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `tbl_categoria` (`categoria_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
