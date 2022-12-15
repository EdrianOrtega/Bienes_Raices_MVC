-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bienes_raices
CREATE DATABASE IF NOT EXISTS `bienes_raices` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bienes_raices`;

-- Volcando estructura para tabla bienes_raices.propiedades
CREATE TABLE IF NOT EXISTS `propiedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL,
  `habitaciones` int(1) DEFAULT NULL,
  `wc` int(1) DEFAULT NULL,
  `estacionamiento` int(1) DEFAULT NULL,
  `creado` date DEFAULT NULL,
  `vendedorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendedorId_idx` (`vendedorId`),
  CONSTRAINT `vendedorId` FOREIGN KEY (`vendedorId`) REFERENCES `vendedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bienes_raices.propiedades: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT IGNORE INTO `propiedades` (`id`, `titulo`, `precio`, `imagen`, `descripcion`, `habitaciones`, `wc`, `estacionamiento`, `creado`, `vendedorId`) VALUES
	(1, 'YugoLandia - ACTUALIZADO CON MVC¡', 123123.00, 'f349e7a938dc218349e7075384f3bfc0.jpg', '        Esta es una actualización para ver si funciona de verdad.      ', 3, 3, 3, '0000-00-00', 1),
	(2, 'La Casa de Liliana ', 1000000.00, 'b5611c434a1066da051a4afab23bd46b.jpg', '      Esta casa es muy grande.     Esta casa es muy grande.     Esta casa es muy grande.     Esta casa es muy grande.     Esta casa es muy grande.     ', 5, 4, 1, '2022-08-07', 1),
	(4, ' Liga de Villanos ', 1000.00, '4e72a409d7042d936218152f6e931603.jpg', '  Shigaraki Tomura,   Shigaraki Tomura,   Shigaraki Tomura,   Shigaraki Tomura,   Shigaraki Tomura,   Shigaraki Tomura,   Shigaraki Tomura, ', 8, 8, 8, '2022-10-28', 1),
	(5, 'Pug 2.0', 14.00, '3ce469b918a089af72e45668aaa7fcef.jpg', ' Alaben al mas grande  de los pugs, jijijija, pug, pug, pug, pug, pug, pug, pug, pug, pug, pug, pug, pug, pug\r\n ', 2, 2, 3, '2022-11-05', 1),
	(22, ' Retumbar', 100.00, '905c3e273e1b3b0e177426f01a89f415.jpg', '     Retumbar eren   ', 3, 2, 1, '2022-11-25', 9);
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;

-- Volcando estructura para tabla bienes_raices.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` char(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bienes_raices.usuarios: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT IGNORE INTO `usuarios` (`id`, `email`, `password`) VALUES
	(1, 'correo@correo.com', '$2y$10$qf6td4DryH5.EOORYBgyLu4xwq1X/7h6x6TOgvOD8YLwKRh63lcYK');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla bienes_raices.vendedores
CREATE TABLE IF NOT EXISTS `vendedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bienes_raices.vendedores: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT IGNORE INTO `vendedores` (`id`, `nombre`, `apellido`, `telefono`) VALUES
	(1, 'Juan ', 'de la Torre', '1019301011'),
	(2, 'Andrea', 'Perez', '129371234'),
	(3, 'Miguel', 'Perez', '2034820348'),
	(7, ' Pablo', 'Escobar ', '2323232323'),
	(9, ' Liliana', 'Ortega Hernandez', '1239123123'),
	(10, ' Edrian', 'Ortega', '7772223333'),
	(11, ' Brandao', 'López', '1234567890');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
