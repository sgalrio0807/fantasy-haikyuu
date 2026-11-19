-- MySQL dump 10.13  Distrib 26.10.0, for Win64 (x86_64)
--
-- Host: localhost    Database: fantasy_haikyuu
-- ------------------------------------------------------
-- Server version	26.10.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `fantasy_haikyuu`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fantasy_haikyuu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `fantasy_haikyuu`;

--
-- Table structure for table `alineacion`
--

DROP TABLE IF EXISTS `alineacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alineacion` (
  `id_alineacion` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int NOT NULL,
  `id_personaje` int NOT NULL,
  `jornada` int NOT NULL,
  `es_titular` tinyint(1) NOT NULL DEFAULT '1',
  `puntos` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_alineacion`),
  UNIQUE KEY `uq_alineacion_jornada` (`id_equipo`,`id_personaje`,`jornada`),
  KEY `fk_alineacion_personaje` (`id_personaje`),
  CONSTRAINT `fk_alineacion_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`) ON DELETE CASCADE,
  CONSTRAINT `fk_alineacion_personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personaje` (`id_personaje`) ON DELETE RESTRICT,
  CONSTRAINT `alineacion_chk_1` CHECK ((`jornada` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenador` (
  `id_personaje` int NOT NULL,
  `bonus_tactico` decimal(4,2) NOT NULL DEFAULT '1.00',
  `estilo_juego` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_personaje`),
  CONSTRAINT `fk_entrenador_personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personaje` (`id_personaje`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `presupuesto` decimal(10,2) NOT NULL DEFAULT '10000000.00',
  `puntos` int NOT NULL DEFAULT '0',
  `id_usuario` int NOT NULL,
  `id_liga` int NOT NULL,
  PRIMARY KEY (`id_equipo`),
  UNIQUE KEY `uq_usuario_liga` (`id_usuario`,`id_liga`),
  KEY `fk_equipo_liga` (`id_liga`),
  CONSTRAINT `fk_equipo_liga` FOREIGN KEY (`id_liga`) REFERENCES `liga` (`id_liga`) ON DELETE CASCADE,
  CONSTRAINT `fk_equipo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `equipo_chk_1` CHECK ((`presupuesto` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipo_personaje`
--

DROP TABLE IF EXISTS `equipo_personaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo_personaje` (
  `id_equipo` int NOT NULL,
  `id_personaje` int NOT NULL,
  `fecha_fichaje` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_equipo`,`id_personaje`),
  KEY `fk_ep_personaje` (`id_personaje`),
  CONSTRAINT `fk_ep_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`) ON DELETE CASCADE,
  CONSTRAINT `fk_ep_personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personaje` (`id_personaje`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invitacion`
--

DROP TABLE IF EXISTS `invitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitacion` (
  `id_invitacion` int NOT NULL AUTO_INCREMENT,
  `id_usuario_emisor` int NOT NULL,
  `id_usuario_receptor` int NOT NULL,
  `id_liga` int NOT NULL,
  `estado` enum('pendiente','aceptada','rechazada') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pendiente',
  `fecha_envio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_invitacion`),
  KEY `fk_inv_emisor` (`id_usuario_emisor`),
  KEY `fk_inv_receptor` (`id_usuario_receptor`),
  KEY `fk_inv_liga` (`id_liga`),
  CONSTRAINT `fk_inv_emisor` FOREIGN KEY (`id_usuario_emisor`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `fk_inv_liga` FOREIGN KEY (`id_liga`) REFERENCES `liga` (`id_liga`) ON DELETE CASCADE,
  CONSTRAINT `fk_inv_receptor` FOREIGN KEY (`id_usuario_receptor`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `chk_invitacion_distintos` CHECK ((`id_usuario_emisor` <> `id_usuario_receptor`))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `id_personaje` int NOT NULL,
  `posicion` enum('Colocador','Rematador','Central','Opuesto','Libero') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ataque` tinyint unsigned NOT NULL,
  `bloqueo` tinyint unsigned NOT NULL,
  `colocacion` tinyint unsigned NOT NULL,
  `recepcion` tinyint unsigned NOT NULL,
  `saque` tinyint unsigned NOT NULL,
  `valoracion_media` decimal(4,2) GENERATED ALWAYS AS ((((((`ataque` + `bloqueo`) + `colocacion`) + `recepcion`) + `saque`) / 5)) STORED,
  PRIMARY KEY (`id_personaje`),
  CONSTRAINT `fk_jugador_personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personaje` (`id_personaje`) ON DELETE CASCADE,
  CONSTRAINT `jugador_chk_1` CHECK ((`ataque` between 1 and 100)),
  CONSTRAINT `jugador_chk_2` CHECK ((`bloqueo` between 1 and 100)),
  CONSTRAINT `jugador_chk_3` CHECK ((`colocacion` between 1 and 100)),
  CONSTRAINT `jugador_chk_4` CHECK ((`recepcion` between 1 and 100)),
  CONSTRAINT `jugador_chk_5` CHECK ((`saque` between 1 and 100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liga`
--

DROP TABLE IF EXISTS `liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liga` (
  `id_liga` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_invitacion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_creador` int NOT NULL,
  PRIMARY KEY (`id_liga`),
  UNIQUE KEY `cod_invitacion` (`cod_invitacion`),
  KEY `fk_liga_creador` (`id_creador`),
  CONSTRAINT `fk_liga_creador` FOREIGN KEY (`id_creador`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `id_partido` int NOT NULL AUTO_INCREMENT,
  `id_equipo_local` int NOT NULL,
  `id_equipo_visitante` int NOT NULL,
  `resultado` enum('2-0','2-1','0-2','1-2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `puntos_ganador` tinyint unsigned GENERATED ALWAYS AS ((case when (`resultado` in (_utf8mb4'2-0',_utf8mb4'0-2')) then 3 else 2 end)) STORED,
  PRIMARY KEY (`id_partido`),
  KEY `fk_partido_local` (`id_equipo_local`),
  KEY `fk_partido_visitante` (`id_equipo_visitante`),
  CONSTRAINT `fk_partido_local` FOREIGN KEY (`id_equipo_local`) REFERENCES `equipo` (`id_equipo`) ON DELETE CASCADE,
  CONSTRAINT `fk_partido_visitante` FOREIGN KEY (`id_equipo_visitante`) REFERENCES `equipo` (`id_equipo`) ON DELETE CASCADE,
  CONSTRAINT `chk_equipos_distintos` CHECK ((`id_equipo_local` <> `id_equipo_visitante`))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personaje`
--

DROP TABLE IF EXISTS `personaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personaje` (
  `id_personaje` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equipo` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `apodo` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` enum('jugador','entrenador') COLLATE utf8mb4_unicode_ci NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_personaje`),
  CONSTRAINT `personaje_chk_1` CHECK ((`precio` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `redes_sociales` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario_liga`
--

DROP TABLE IF EXISTS `usuario_liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_liga` (
  `id_usuario` int NOT NULL,
  `id_liga` int NOT NULL,
  `fecha_union` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`,`id_liga`),
  KEY `fk_ul_liga` (`id_liga`),
  CONSTRAINT `fk_ul_liga` FOREIGN KEY (`id_liga`) REFERENCES `liga` (`id_liga`) ON DELETE CASCADE,
  CONSTRAINT `fk_ul_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-19 12:33:42
