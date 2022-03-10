/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.4.22-MariaDB : Database - empresa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`empresa` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `empresa`;

/*Table structure for table `atencion` */

DROP TABLE IF EXISTS `atencion`;

CREATE TABLE `atencion` (
  `id_atencion` int(11) NOT NULL AUTO_INCREMENT,
  `id_personal` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  PRIMARY KEY (`id_atencion`),
  KEY `id_personal` (`id_personal`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `atencion_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`),
  CONSTRAINT `atencion_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `atencion` */

insert  into `atencion`(`id_atencion`,`id_personal`,`id_departamento`) values 
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10);

/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id_ciudades` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_ciudad` varchar(255) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  PRIMARY KEY (`id_ciudades`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ciudades` */

insert  into `ciudades`(`id_ciudades`,`detalle_ciudad`,`id_departamento`) values 
(1,'Colón',1),
(2,'Mocoa',1),
(3,'Orito',1),
(4,'Puerto Asís',1),
(5,'Puerto Caicedo',1),
(6,'Puerto Guzmán',1),
(7,'Puerto Leguízamo',1),
(8,'San Francisco',1),
(9,'San Miguel',1),
(10,'Santiago',1),
(11,'Sibundoy',1),
(12,'Valle del Guamuez',1),
(13,'Villagarzón',1),
(14,'Armenia',2),
(15,'Buenavista',2),
(16,'Calarcá',2),
(17,'Circasia',2),
(18,'Córdoba',2),
(19,'Filandia',2),
(20,'Génova',2),
(21,'La Tebaida',2),
(22,'Montenegro',2),
(23,'Pijao',2),
(24,'Quimbaya',2),
(25,'Salento',2),
(26,'Apía',3),
(27,'Balboa',3),
(28,'Belén de Umbría',3),
(29,'Dosquebradas',3),
(30,'Guática',3),
(31,'La Celia',3),
(32,'La Virginia',3),
(33,'Marsella',3),
(34,'Mistrató',3),
(35,'Pereira',3),
(36,'Pueblo Rico',3),
(37,'Quinchía',3),
(38,'Santa Rosa de Cabal',3),
(39,'Santuario',3),
(40,'Barbosa',4),
(41,'Bello',4),
(42,'Caldas',4),
(43,'Copacabana',4),
(44,'Envigado',4),
(45,'Girardota',4),
(46,'Itagüí',4),
(47,'La Estrella',4),
(48,'Medellín',4),
(49,'Sabaneta',4),
(50,'Barranquilla',5),
(51,'Baranoa',5),
(52,'Campo de la Cruz',5),
(53,'Candelaria',5),
(54,'Galapa',5),
(55,'Juan de Acosta',5),
(56,'Luruaco',5),
(57,'Malambo',5),
(58,'Manatí',5),
(59,'Palmar de Varela',5),
(60,'Toluviejo',6),
(61,'Buenavista',6),
(62,'Corozal',6),
(63,'El Roble',6),
(64,'Galeras',6),
(65,'Los Palmitos',6),
(66,'Sampués',6),
(67,'San Juan de Betulia',6),
(68,'San Pedro',6),
(69,'Sincé',6),
(70,'Caimito',6),
(71,'La Unión',6),
(72,'Alvarado',7),
(73,'Anzoátegui',7),
(74,'Cajamarca',7),
(75,'Coello',7),
(76,'El Espinal',7),
(77,'Flandes',7),
(78,'Ibagué',7),
(79,'Piedras',7),
(80,'Rovira',7),
(81,'San Luis',7),
(82,'Valle de San Juan',7),
(83,'Alcalá',8),
(84,'Andalucía',8),
(85,'Ansermanuevo',8),
(86,'Argelia',8),
(87,'Bolívar',8),
(88,'Buenaventura',8),
(89,'Buga',8),
(90,'Bugalagrande',8),
(91,'Caicedonia',8),
(92,'Cali',8),
(93,'Calima - El Darién',8),
(94,'Candelaria',8),
(95,'Mitú',9),
(96,'Pacoa',9),
(97,'Papunaua',9),
(98,'Taraira',9),
(99,'Yavaraté',9),
(100,'Cumaribo',10),
(101,'La Primavera',10),
(102,'Puerto Carreño',10),
(103,'Santa Rosalía',10);

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `celular` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `cc_cliente` int(12) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `cliente_ibfk_1` (`id_ciudad`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudades`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8mb4;

/*Data for the table `cliente` */

insert  into `cliente`(`id_cliente`,`nombre`,`celular`,`id_ciudad`,`cc_cliente`) values 
(1,'Jenica',791,1,0),
(2,'Nathanial',595,2,0),
(3,'Codie',566,3,0),
(4,'Krystle',117,4,0),
(5,'Amy',124,5,0),
(6,'Candi',824,6,0),
(7,'Anderson',991,7,0),
(8,'Salomone',554,8,0),
(9,'Shepherd',241,9,0),
(10,'Helenelizabeth',596,10,0),
(11,'Verile',157,11,0),
(12,'Aleksandr',372,12,0),
(13,'Inesita',866,13,0),
(14,'Ingunna',838,14,0),
(15,'Gretta',473,15,0),
(16,'Sinclare',461,16,0),
(17,'Cyrillus',567,17,0),
(18,'Carce',591,18,0),
(19,'Pietro',802,19,0),
(20,'Sabra',777,20,0),
(21,'Alonso',280,21,0),
(22,'Teena',622,22,0),
(23,'Hamid',195,23,0),
(24,'Vicky',124,24,0),
(25,'See',553,25,0),
(26,'Beitris',344,26,0),
(27,'Estrellita',974,27,0),
(28,'Alla',247,28,0),
(29,'Nikos',336,29,0),
(30,'Gretal',865,30,0),
(31,'Bethena',734,31,0),
(32,'Dukey',783,32,0),
(33,'Gerri',478,33,0),
(34,'Kelley',355,34,0),
(35,'Verena',529,35,0),
(36,'Cassaundra',101,36,0),
(37,'Beatrisa',633,37,0),
(38,'Misti',709,38,0),
(39,'Tammy',192,39,0),
(40,'Stephie',233,40,0),
(41,'Sandor',361,41,0),
(42,'Thatcher',548,42,0),
(43,'Bridgette',955,43,0),
(44,'Way',936,44,0),
(45,'Charmian',551,45,0),
(46,'Tanner',707,46,0),
(47,'Ode',134,47,0),
(48,'Garek',691,48,0),
(49,'Shayne',822,49,0),
(50,'Hortensia',185,50,0),
(51,'Dorena',999,51,0),
(52,'Addy',723,52,0),
(53,'Clea',628,53,0),
(54,'Mala',847,54,0),
(55,'Melisa',304,55,0),
(56,'Tamarah',471,56,0),
(57,'Arnaldo',804,57,0),
(58,'Arch',855,58,0),
(59,'Dorthea',695,59,0),
(60,'Agatha',560,60,0),
(61,'Roderich',539,61,0),
(62,'Mariette',713,62,0),
(63,'Byrle',680,63,0),
(64,'Laina',466,64,0),
(65,'Fielding',626,65,0),
(66,'Genvieve',967,66,0),
(67,'Hermina',720,67,0),
(68,'Lyle',671,68,0),
(69,'Trina',318,69,0),
(70,'Gabe',213,70,0),
(71,'Sada',588,71,0),
(72,'Georgy',227,72,0),
(73,'Esta',847,73,0),
(74,'Blondell',770,74,0),
(75,'Aguistin',731,75,0),
(76,'Albina',910,76,0),
(77,'Ingmar',269,77,0),
(78,'Marigold',444,78,0),
(79,'Emlynn',750,79,0),
(80,'Del',140,80,0),
(81,'Perren',943,81,0),
(82,'Pandora',448,82,0),
(83,'Rubie',936,83,0),
(84,'Kally',607,84,0),
(85,'Zak',674,85,0),
(86,'Mickey',932,86,0),
(87,'Waldon',146,87,0),
(88,'Ernaline',577,88,0),
(89,'Lynnette',406,89,0),
(90,'Maryjane',578,90,0),
(91,'Augy',839,91,0),
(92,'Hedy',152,92,0),
(93,'Tremayne',625,93,0),
(94,'Dorris',285,94,0),
(95,'Shelden',418,95,0),
(96,'Lawry',960,96,0),
(97,'Hardy',317,97,0),
(98,'Mort',195,98,0),
(99,'Marleah',616,99,0),
(100,'Bordie',473,100,0),
(101,'Alfonse',849,101,0),
(102,'Lotty',756,102,0),
(103,'Felix',376,103,0),
(104,'Min',809,92,0),
(105,'Cornie',632,95,0),
(106,'Kerrin',588,95,0),
(107,'Benedikta',328,97,0),
(108,'Sawyere',911,100,0),
(109,'Dosi',456,3,0),
(110,'Annadiane',592,2,0);

/*Table structure for table `departamentos` */

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_departamento` varchar(255) NOT NULL,
  `id_pais` int(11) NOT NULL,
  PRIMARY KEY (`id_departamento`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

/*Data for the table `departamentos` */

insert  into `departamentos`(`id_departamento`,`detalle_departamento`,`id_pais`) values 
(1,'Putumayo',1),
(2,'Quindío',1),
(3,'Risaralda',1),
(4,'Antioquia',1),
(5,'Atlantico',1),
(6,'Sucre',1),
(7,'Tolima',1),
(8,'Valle del Cauca',1),
(9,'Vaupés',1),
(10,'Vichada',1);

/*Table structure for table `paises` */

DROP TABLE IF EXISTS `paises`;

CREATE TABLE `paises` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_pais` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `paises` */

insert  into `paises`(`id_pais`,`detalle_pais`) values 
(1,'colombia');

/*Table structure for table `personal` */

DROP TABLE IF EXISTS `personal`;

CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `celular` varchar(20) NOT NULL,
  PRIMARY KEY (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

/*Data for the table `personal` */

insert  into `personal`(`id_personal`,`nombre`,`direccion`,`celular`) values 
(1,'Noland','5 Surrey Street','+1 564 583 8403'),
(2,'Penelopa','96835 Dunning Park','+30 783 154 5562'),
(3,'Trevar','24470 Hollow Ridge Hill','+47 726 641 7622'),
(4,'Dre','8428 Bluestem Street','+49 721 160 1816'),
(5,'Shelagh','8 Alpine Trail','+86 417 383 5424'),
(6,'Norrie','517 Beilfuss Plaza','+46 511 684 7816'),
(7,'Fidelia','5 Lawn Alley','+351 388 363 4094'),
(8,'Tobiah','94177 Kropf Way','+54 472 322 0147'),
(9,'Bartholemy','89975 Charing Cross Lane','+63 772 518 0540'),
(10,'Jed','2000 Fuller Alley','+1 620 391 1399');

/*Table structure for table `sucursales` */

DROP TABLE IF EXISTS `sucursales`;

CREATE TABLE `sucursales` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `encargado` varchar(255) NOT NULL,
  `contacto` decimal(20,0) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `id_ciudad` (`id_ciudad`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudades`),
  CONSTRAINT `sucursales_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sucursales` */

insert  into `sucursales`(`id_sucursal`,`encargado`,`contacto`,`direccion`,`id_ciudad`,`id_cliente`) values 
(1,'Noland',1,'5 Surrey Street',1,1),
(2,'Penelopa',30,'96835 Dunning Park',2,2),
(3,'Trevar',47,'24470 Hollow Ridge Hill',3,3),
(4,'Dre',49,'8428 Bluestem Street',4,4),
(5,'Shelagh',86,'8 Alpine Trail',5,5),
(6,'Norrie',46,'517 Beilfuss Plaza',6,6),
(7,'Fidelia',351,'5 Lawn Alley',7,7),
(8,'Tobiah',54,'94177 Kropf Way',8,8),
(9,'Bartholemy',63,'89975 Charing Cross Lane',9,9),
(10,'Jed',1,'2000 Fuller Alley',10,10),
(11,'Noland',1,'5 Surrey Street',11,11),
(12,'Penelopa',30,'96835 Dunning Park',12,12),
(13,'Trevar',47,'24470 Hollow Ridge Hill',13,13),
(14,'Dre',49,'8428 Bluestem Street',14,14),
(15,'Shelagh',86,'8 Alpine Trail',15,15),
(16,'Norrie',46,'517 Beilfuss Plaza',16,16),
(17,'Fidelia',351,'5 Lawn Alley',17,17),
(18,'Tobiah',54,'94177 Kropf Way',18,18),
(19,'Bartholemy',63,'89975 Charing Cross Lane',19,19),
(20,'Jed',1,'2000 Fuller Alley',20,20),
(21,'Noland',1,'5 Surrey Street',21,21),
(22,'Penelopa',30,'96835 Dunning Park',22,22),
(23,'Trevar',47,'24470 Hollow Ridge Hill',23,23),
(24,'Dre',49,'8428 Bluestem Street',24,24),
(25,'Shelagh',86,'8 Alpine Trail',25,25),
(26,'Norrie',46,'517 Beilfuss Plaza',26,26),
(27,'Fidelia',351,'5 Lawn Alley',27,27),
(28,'Tobiah',54,'94177 Kropf Way',28,28),
(29,'Bartholemy',63,'89975 Charing Cross Lane',29,29),
(30,'Jed',1,'2000 Fuller Alley',30,30),
(31,'Noland',1,'5 Surrey Street',31,31),
(32,'Penelopa',30,'96835 Dunning Park',32,32),
(33,'Trevar',47,'24470 Hollow Ridge Hill',33,33),
(34,'Dre',49,'8428 Bluestem Street',34,34),
(35,'Shelagh',86,'8 Alpine Trail',35,35),
(36,'Norrie',46,'517 Beilfuss Plaza',36,36),
(37,'Fidelia',351,'5 Lawn Alley',37,37),
(38,'Tobiah',54,'94177 Kropf Way',38,38),
(39,'Bartholemy',63,'89975 Charing Cross Lane',39,39),
(40,'Jed',1,'2000 Fuller Alley',40,40),
(41,'Noland',1,'5 Surrey Street',41,41),
(42,'Penelopa',30,'96835 Dunning Park',42,42),
(43,'Trevar',47,'24470 Hollow Ridge Hill',43,43),
(44,'Dre',49,'8428 Bluestem Street',44,44),
(45,'Shelagh',86,'8 Alpine Trail',45,45),
(46,'Norrie',46,'517 Beilfuss Plaza',46,46),
(47,'Fidelia',351,'5 Lawn Alley',47,47),
(48,'Tobiah',54,'94177 Kropf Way',48,48),
(49,'Bartholemy',63,'89975 Charing Cross Lane',49,49),
(50,'Jed',1,'2000 Fuller Alley',50,50),
(51,'Noland',1,'5 Surrey Street',51,51),
(52,'Penelopa',30,'96835 Dunning Park',52,52),
(53,'Trevar',47,'24470 Hollow Ridge Hill',53,53),
(54,'Dre',49,'8428 Bluestem Street',54,54),
(55,'Shelagh',86,'8 Alpine Trail',55,55),
(56,'Norrie',46,'517 Beilfuss Plaza',56,56),
(57,'Fidelia',351,'5 Lawn Alley',57,57),
(58,'Tobiah',54,'94177 Kropf Way',58,58),
(59,'Bartholemy',63,'89975 Charing Cross Lane',59,59),
(60,'Jed',1,'2000 Fuller Alley',60,60),
(61,'Noland',1,'5 Surrey Street',61,61),
(62,'Penelopa',30,'96835 Dunning Park',62,62),
(63,'Trevar',47,'24470 Hollow Ridge Hill',63,63),
(64,'Dre',49,'8428 Bluestem Street',64,64),
(65,'Shelagh',86,'8 Alpine Trail',65,65),
(66,'Norrie',46,'517 Beilfuss Plaza',66,66),
(67,'Fidelia',351,'5 Lawn Alley',67,67),
(68,'Tobiah',54,'94177 Kropf Way',68,68),
(69,'Bartholemy',63,'89975 Charing Cross Lane',69,69),
(70,'Jed',1,'2000 Fuller Alley',70,70),
(71,'Noland',1,'5 Surrey Street',71,71),
(72,'Penelopa',30,'96835 Dunning Park',72,72),
(73,'Trevar',47,'24470 Hollow Ridge Hill',73,73),
(74,'Dre',49,'8428 Bluestem Street',74,74),
(75,'Shelagh',86,'8 Alpine Trail',75,75),
(76,'Norrie',46,'517 Beilfuss Plaza',76,76),
(77,'Fidelia',351,'5 Lawn Alley',77,77),
(78,'Tobiah',54,'94177 Kropf Way',78,78),
(79,'Bartholemy',63,'89975 Charing Cross Lane',79,79),
(80,'Jed',1,'2000 Fuller Alley',80,80),
(81,'Noland',1,'5 Surrey Street',81,81),
(82,'Penelopa',30,'96835 Dunning Park',82,82),
(83,'Trevar',47,'24470 Hollow Ridge Hill',83,83),
(84,'Dre',49,'8428 Bluestem Street',84,84),
(85,'Shelagh',86,'8 Alpine Trail',85,85),
(86,'Norrie',46,'517 Beilfuss Plaza',86,86),
(87,'Fidelia',351,'5 Lawn Alley',87,87),
(88,'Tobiah',54,'94177 Kropf Way',88,88),
(89,'Bartholemy',63,'89975 Charing Cross Lane',89,89),
(90,'Jed',1,'2000 Fuller Alley',90,90),
(91,'Noland',1,'5 Surrey Street',91,91),
(92,'Penelopa',30,'96835 Dunning Park',92,92),
(93,'Trevar',47,'24470 Hollow Ridge Hill',93,93),
(94,'Dre',49,'8428 Bluestem Street',94,94),
(95,'Shelagh',86,'8 Alpine Trail',95,95),
(96,'Norrie',46,'517 Beilfuss Plaza',96,96),
(97,'Fidelia',351,'5 Lawn Alley',97,97),
(98,'Tobiah',54,'94177 Kropf Way',98,98),
(99,'Bartholemy',63,'89975 Charing Cross Lane',99,99),
(100,'Jed',1,'2000 Fuller Alley',100,100),
(101,'Noland',1,'5 Surrey Street',101,101),
(102,'Penelopa',30,'96835 Dunning Park',102,102),
(103,'Trevar',47,'24470 Hollow Ridge Hill',103,103),
(104,'Dre',49,'8428 Bluestem Street',92,104),
(105,'Shelagh',86,'8 Alpine Trail',95,105),
(106,'Norrie',46,'517 Beilfuss Plaza',95,106),
(107,'Fidelia',351,'5 Lawn Alley',97,107),
(108,'Tobiah',54,'94177 Kropf Way',100,108),
(109,'Bartholemy',63,'89975 Charing Cross Lane',3,109),
(110,'Jed',1,'2000 Fuller Alley',2,110);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
