USE fantasy_haikyuu

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
-- Dumping data for table `alineacion`
--

LOCK TABLES `alineacion` WRITE;
/*!40000 ALTER TABLE `alineacion` DISABLE KEYS */;
INSERT INTO `alineacion` VALUES (1,1,1,1,1,18),(2,1,2,1,1,22),(3,2,3,1,1,20),(4,3,4,1,1,25),(5,4,6,1,0,10);
/*!40000 ALTER TABLE `alineacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entrenador`
--

LOCK TABLES `entrenador` WRITE;
/*!40000 ALTER TABLE `entrenador` DISABLE KEYS */;
INSERT INTO `entrenador` VALUES (6,1.15,'Ataque rápido sincronizado'),(7,1.05,'Motivación y cohesión de equipo'),(8,1.20,'Defensa férrea y contraataque'),(9,1.25,'Potencia individual absoluta'),(10,1.12,'Lectura táctica del rival');
/*!40000 ALTER TABLE `entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Cuervos de Sergio',4300000.00,5,1,1),(2,'Colocadores de Juanma',5900000.00,3,2,1),(3,'Gatos del Basurero',5500000.00,2,3,1),(4,'Águilas Blancas',4500000.00,2,4,1),(5,'Seijoh Power',5300000.00,0,5,1);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `equipo_personaje`
--

LOCK TABLES `equipo_personaje` WRITE;
/*!40000 ALTER TABLE `equipo_personaje` DISABLE KEYS */;
INSERT INTO `equipo_personaje` VALUES (1,1,'2026-11-13 09:16:56'),(1,2,'2026-11-13 09:16:56'),(2,3,'2026-11-13 09:16:56'),(3,4,'2026-11-13 09:16:56'),(4,6,'2026-11-13 09:16:56'),(5,10,'2026-11-13 09:16:56');
/*!40000 ALTER TABLE `equipo_personaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `invitacion`
--

LOCK TABLES `invitacion` WRITE;
/*!40000 ALTER TABLE `invitacion` DISABLE KEYS */;
INSERT INTO `invitacion` VALUES (1,1,2,1,'aceptada','2026-11-13 09:16:56'),(2,1,3,1,'aceptada','2026-11-13 09:16:56'),(3,1,4,1,'aceptada','2026-11-13 09:16:56'),(4,1,5,1,'aceptada','2026-11-13 09:16:56'),(5,2,3,2,'pendiente','2026-11-13 09:16:56');
/*!40000 ALTER TABLE `invitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` (`id_personaje`, `posicion`, `ataque`, `bloqueo`, `colocacion`, `recepcion`, `saque`) VALUES (1,'Central',92,74,65,72,70),(2,'Colocador',85,82,98,84,93),(3,'Colocador',84,80,96,85,95),(4,'Opuesto',99,88,70,82,94),(5,'Central',84,95,78,88,85);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `liga`
--

LOCK TABLES `liga` WRITE;
/*!40000 ALTER TABLE `liga` DISABLE KEYS */;
INSERT INTO `liga` VALUES (1,'Liga Nacional Karasuno','KARA2026','2026-11-13 09:16:56',1),(2,'Torneo de Primavera','PRIM2026','2026-11-13 09:16:56',2),(3,'Batalla del Basurero','BASU2026','2026-11-13 09:16:56',1),(4,'Copa Prefectura Miyagi','MIYA2026','2026-11-13 09:16:56',3),(5,'Superliga Voleibol','SUPE2026','2026-11-13 09:16:56',4);
/*!40000 ALTER TABLE `liga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` (`id_partido`, `id_equipo_local`, `id_equipo_visitante`, `resultado`, `fecha`) VALUES (1,1,2,'2-0','2026-11-10 18:00:00'),(2,3,4,'1-2','2026-11-10 19:00:00'),(3,5,2,'0-2','2026-11-11 18:00:00'),(4,1,3,'2-1','2026-11-11 19:00:00'),(5,4,3,'1-2','2026-11-12 18:00:00');
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personaje`
--

LOCK TABLES `personaje` WRITE;
/*!40000 ALTER TABLE `personaje` DISABLE KEYS */;
INSERT INTO `personaje` VALUES (1,'Shoyo Hinata','Karasuno',2500000.00,'El Señuelo Definitivo','jugador',1),(2,'Tobio Kageyama','Karasuno',3200000.00,'El Rey de la Cancha','jugador',1),(3,'Toru Oikawa','Aoba Johsai',3100000.00,'El Gran Rey','jugador',1),(4,'Wakatoshi Ushijima','Shiratorizawa',3500000.00,'Ushiwaka','jugador',1),(5,'Tetsuro Kuroo','Nekoma',2900000.00,'Capitán Gato','jugador',0),(6,'Keishin Ukai','Karasuno',1500000.00,'Entrenador Ukai','entrenador',1),(7,'Ittetsu Takeda','Karasuno',1000000.00,'Profe Takeda','entrenador',1),(8,'Yasufumi Nekomata','Nekoma',1800000.00,'Maestro Nekomata','entrenador',1),(9,'Tanji Washijo','Shiratorizawa',2000000.00,'El Viejo Washijo','entrenador',1),(10,'Nobuteru Irihata','Aoba Johsai',1600000.00,'Irihata','entrenador',1);
/*!40000 ALTER TABLE `personaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Sergio Galán','sergio@fantasyhaikyuu.es','$2b$10$hashSergioPrueba123456789','2026-11-13 09:16:56','@sergio_haikyuu'),(2,'Juanma Domínguez','juanma@fantasyhaikyuu.es','$2b$10$hashJuanmaPrueba123456789','2026-11-13 09:16:56','@juanma_setter'),(3,'Shoyo Hinata','hinata10@karasuno.jp','$2b$10$hashHinataPrueba123456789','2026-11-13 09:16:56','@hinata_10'),(4,'Tobio Kageyama','kageyama9@karasuno.jp','$2b$10$hashTobioPrueba1234567890','2026-11-13 09:16:56','@king_court'),(5,'Toru Oikawa','oikawa1@aobajohsai.jp','$2b$10$hashOikawaPrueba123456789','2026-11-13 09:16:56','@grand_king');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario_liga`
--

LOCK TABLES `usuario_liga` WRITE;
/*!40000 ALTER TABLE `usuario_liga` DISABLE KEYS */;
INSERT INTO `usuario_liga` VALUES (1,1,'2026-11-13 09:16:56'),(2,1,'2026-11-13 09:16:56'),(2,2,'2026-11-13 09:16:56'),(3,1,'2026-11-13 09:16:56'),(4,1,'2026-11-13 09:16:56'),(5,1,'2026-11-13 09:16:56');
/*!40000 ALTER TABLE `usuario_liga` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-19 12:33:51
