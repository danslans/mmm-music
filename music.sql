-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-01-2017 a las 19:11:48
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `music`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar` (IN `id` INT, IN `fecha` VARCHAR(100), IN `orden` INT)  BEGIN
INSERT Into TBL_ASIGNAR_CANCION (id_img,fecha,num_orden) VALUES(id,fecha,orden);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `truncateAsignar` ()  BEGIN
declare result int;
TRUNCATE TBL_ASIGNAR_CANCION;
SET result =1;
SELECT result;
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `insertHistoria` () RETURNS VARCHAR(100) CHARSET utf8 COLLATE utf8_spanish2_ci begin 
	declare idF int;
    declare fecha date;
    declare msn varchar(50);
	set idF=(Select a.id from TBL_ASIGNAR_CANCION a order by a.id desc limit 1);
    set fecha =(select a.fecha from TBL_ASIGNAR_CANCION a where a.id=idF);
if idF >0 then
    insert into TBL_HISTORIAL_CANCION values(null,fecha,idF);
    set msn='datos ingresados';
	ELSE	
    set msn="null";
    end if;
    return msn;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_ASIGNAR_CANCION`
--

CREATE TABLE `TBL_ASIGNAR_CANCION` (
  `id` int(11) NOT NULL,
  `id_img` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `num_orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `TBL_ASIGNAR_CANCION`
--

INSERT INTO `TBL_ASIGNAR_CANCION` (`id`, `id_img`, `fecha`, `num_orden`) VALUES
(1, 19, '2017-01-01', 3),
(2, 32, '2017-01-01', 2),
(3, 31, '2017-01-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_HISTORIAL_CANCION`
--

CREATE TABLE `TBL_HISTORIAL_CANCION` (
  `id_historial` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_img` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `TBL_HISTORIAL_CANCION`
--

INSERT INTO `TBL_HISTORIAL_CANCION` (`id_historial`, `fecha`, `id_img`) VALUES
(1, '2017-01-01', 1),
(2, '2017-01-01', 2),
(3, '2017-01-01', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_IMG`
--

CREATE TABLE `TBL_IMG` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `TBL_IMG`
--

INSERT INTO `TBL_IMG` (`id`, `nombre`, `descripcion`, `direccion`) VALUES
(1, 'Aclamad a Dios', 'Aclamad a Dios', 'images/thumbs/1 Aclamad a Dios.png'),
(2, 'Alabad a jehova', 'Alabad a jehova', 'images/thumbs/2 Alabad a Jehova.png'),
(3, 'Alabad a jehova', 'Alabad a jehova', 'images/thumbs/3 Alabad a Jehova.png'),
(4, 'Alabare', 'Alabare', 'images/thumbs/4 Alabare.png'),
(5, 'aunque otros canten', 'aunque otros canten', 'images/thumbs/5 Aunque otros Canten.png'),
(6, 'Bendecid al Señor', 'Bendecid al Señor', 'images/thumbs/6 Bendecid al Senor.png'),
(7, 'Bendecir a Jehova', 'Bendecir a Jehova', 'images/thumbs/7 Bendecire a Jehova.png'),
(8, 'Bendito se Jehova la Roca', 'Bendito se Jehova la Roca', 'images/thumbs/8 Bendito se Jehova la Roca.png'),
(9, 'Bueno Es', 'Bueno Es', 'images/thumbs/9 Bueno Es.png'),
(10, 'Bueno es Alabar', 'Bueno es Alabar', 'images/thumbs/10 Bueno es Alabar.png'),
(11, 'Bueno es Alabarte Jehova', 'Bueno es Alabarte Jehova', 'images/thumbs/11 Bueno es Alabarte Jehova.png'),
(12, 'Canta a Dios un Canto Nuevo', 'Canta a Dios un Canto Nuevo', 'images/thumbs/12 Canta a Dios un Canto Nuevo.png'),
(13, 'Cantad a Jehova Cantico Nuevo', 'Cantad a Jehova Cantico Nuevo', 'images/thumbs/13 Cantad a Jehova Cantico Nuevo.png'),
(14, 'Canten Todos', 'Canten Todos', 'images/thumbs/14 Canten Todos.png'),
(15, 'Celebrad a Cristo', 'Celebrad a Cristo', 'images/thumbs/15 Celebrad a Cristo.png'),
(16, 'Celebrare y Cantare', 'Celebrare y Cantare', 'images/thumbs/16 Celebrare y Cantare.png'),
(17, 'Conozco un hombre de Poder', 'Conozco un hombre de Poder', 'images/thumbs/17 Conozco un hombre de Poder.png'),
(18, 'Con que me Presentare', 'Con que me Presentare', 'images/thumbs/18 Con que me Presentare.png'),
(19, 'Digno de alabar ', 'Digno de alabar ', 'images/thumbs/19 Digno de alabar .png'),
(20, 'Dios esta aqui', 'Dios esta aqui', 'images/thumbs/20 Dios esta aqui.png'),
(21, 'Dios esta Presente', 'Dios esta Presente', 'images/thumbs/21 Dios esta Presente.png'),
(22, 'El me ha vestido de Alegria', 'El me ha vestido de Alegria', 'images/thumbs/22 El me ha vestido de Alegria.png'),
(23, 'El poderoso de Israel', 'El poderoso de Israel', 'images/thumbs/23 El poderoso de Israel.png'),
(24, 'En Dios Haremos', 'En Dios Haremos', 'images/thumbs/24 En Dios Haremos.png'),
(25, 'En Gran Manera', 'En Gran Manera', 'images/thumbs/25 En Gran Manera.png'),
(26, 'Gocemonos y Alegremonos', 'Gocemonos y Alegremonos', 'images/thumbs/26 Gocemonos y Alegremonos.png'),
(27, 'Gocemonos y Alegremonos', 'Gocemonos y Alegremonos', 'images/thumbs/27 Gocemonos y Alegremonos.png'),
(28, 'Gocense y Alegrense', 'Gocense y Alegrense', 'images/thumbs/28 Gocense y Alegrense.png'),
(29, 'Gozate delante del Señor', 'Gozate delante del Señor', 'images/thumbs/29 Gozate delante del senor.png'),
(30, 'Grande es el Señor', 'Grande es el Senñor', 'images/thumbs/30 Grande es el Señor.png'),
(31, 'Grande es el Señor', 'Grande es el Sennor', 'images/thumbs/31 Grande es el Senor.png'),
(32, 'Grandes y Maravillosas', 'Grandes y Maravillosas', 'images/thumbs/32 Grandes y Maravillosas.png'),
(33, 'Has Cambiado ', 'Has Cambiado ', 'images/thumbs/33 Has Cambiado .png'),
(34, 'Hosanna', 'Hosanna', 'images/thumbs/34 Hosanna.png'),
(35, 'Hoy Venimos', 'Hoy Venimos', 'images/thumbs/35 Hoy Venimos.png'),
(36, 'Jehova esta en su templo', 'Jehova esta en su templo', 'images/thumbs/36 Jehova esta en su templo.png'),
(37, 'La Alabanza a Dios', 'La Alabanza a Dios', 'images/thumbs/37 La Alabanza a Dios.png'),
(38, 'Maravilloso es el Señor', 'Maravilloso es el Señor', 'images/thumbs/38 Maravilloso es el Señor.png'),
(39, 'Me Gozare', 'Me Gozare', 'images/thumbs/39 Me Gozare.png'),
(40, 'Me Gozare en tu Presencia', 'Me Gozare en tu Presencia', 'images/thumbs/40 Me Gozare en tu Presencia.png'),
(41, 'Mi Amado ', 'Mi Amado ', 'images/thumbs/41 Mi Amado .png'),
(42, 'Mirad Bendecid', 'Mirad Bendecid', 'images/thumbs/42 Mirad Bendecid.png'),
(43, 'No hay Dios como mi Dios', 'No hay Dios como mi Dios', 'images/thumbs/43 No hay Dios como mi Dios.png'),
(44, 'Oh Moradora', 'Oh Moradora', 'images/thumbs/45 Oh Moradora.png'),
(45, 'Para ti oh Jehova', 'Para ti oh Jehova', 'images/thumbs/46 Para ti oh Jehova.png'),
(46, 'Pelearan Contra el Cordero', 'Pelearan Contra el Cordero', 'images/thumbs/47 Pelearan Contra el Cordero.png'),
(47, 'Proclamemos con Gozo', 'Proclamemos con Gozo', 'images/thumbs/48 Proclamemos con Gozo.png'),
(48, 'Pueblos todos Batid Manos', 'Pueblos todos Batid Manos', 'images/thumbs/49 Pueblos todos Batid Manos.png'),
(49, 'Que viva Cristo', 'Que viva Cristo', 'images/thumbs/50 Que viva Cristo.png'),
(50, '¿Quien Como Jehova?', '¿Quien Como Jehova?', 'images/thumbs/51 Quien Como Jehova.png'),
(51, '¿Quien es el rey?', '¿Quien es el rey?', 'images/thumbs/53 Quien es el rey.png'),
(52, 'Santo, Santo, Santo', 'Santo, Santo, Santo', 'images/thumbs/54 Santo, Santo, Santo.png'),
(53, 'Santo, Santo tu eres', 'Santo, Santo tu eres', 'images/thumbs/55 Santo, Santo tu eres.png'),
(54, '¿Senor a Quien Iremos?', '¿Senor a Quien Iremos?', 'images/thumbs/56 Senor a Quien Iremos.png'),
(55, 'Su Gloria Cubrio los Cielos', 'Su Gloria Cubrio los Cielos', 'images/thumbs/57 Su Gloria Cubrio los Cielos.png'),
(56, 'Su Nombre de Guerra', 'Su Nombre de Guerra', 'images/thumbs/58 Su Nombre de Guerra.png'),
(57, 'Te alabaran oh Jehova', 'Te alabaran oh Jehova', 'images/thumbs/59 Te alabaran oh Jehova.png'),
(58, 'Te Alabare', 'Te Alabare', 'images/thumbs/60 Te Alabare.png'),
(59, 'Te alabare oh Dios', 'Te alabare oh Dios', 'images/thumbs/61 Te alabare oh Dios.png'),
(60, 'Te amo oh, Jehova', 'Te amo oh, Jehova', 'images/thumbs/62 Te amo oh, Jehova.png'),
(61, 'Toda la noche sin parar', 'Toda la noche sin parar', 'images/thumbs/63 Toda la noche sin parar.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `TBL_ASIGNAR_CANCION`
--
ALTER TABLE `TBL_ASIGNAR_CANCION`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_img` (`id_img`);

--
-- Indices de la tabla `TBL_HISTORIAL_CANCION`
--
ALTER TABLE `TBL_HISTORIAL_CANCION`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_img` (`id_img`);

--
-- Indices de la tabla `TBL_IMG`
--
ALTER TABLE `TBL_IMG`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `TBL_ASIGNAR_CANCION`
--
ALTER TABLE `TBL_ASIGNAR_CANCION`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `TBL_HISTORIAL_CANCION`
--
ALTER TABLE `TBL_HISTORIAL_CANCION`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `TBL_IMG`
--
ALTER TABLE `TBL_IMG`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
