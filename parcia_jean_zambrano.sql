/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.22-MariaDB : Database - parcial
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`parcial` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `parcial`;

/*Table structure for table `academicperiodgroups` */

DROP TABLE IF EXISTS `academicperiodgroups`;

CREATE TABLE `academicperiodgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `journeyId` int(11) DEFAULT NULL,
  `degreeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `academicperiodgroups` */

insert  into `academicperiodgroups`(`id`,`name`,`quota`,`groupId`,`journeyId`,`degreeId`) values 
(1,NULL,NULL,10,23,NULL),
(2,NULL,NULL,10,24,NULL),
(3,NULL,NULL,10,25,NULL),
(4,NULL,NULL,10,26,NULL),
(5,NULL,NULL,10,27,NULL),
(6,NULL,NULL,10,28,NULL),
(7,NULL,NULL,10,29,NULL),
(8,NULL,NULL,10,30,NULL),
(9,NULL,NULL,10,31,NULL),
(10,NULL,NULL,10,32,NULL);

/*Table structure for table `degrees` */

DROP TABLE IF EXISTS `degrees`;

CREATE TABLE `degrees` (
  `id` int(11) NOT NULL,
  `levelId` int(11) DEFAULT NULL,
  `name` varchar(155) DEFAULT NULL,
  `abbreviation` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `degrees` */

insert  into `degrees`(`id`,`levelId`,`name`,`abbreviation`,`createdAt`,`updatedAt`) values 
(23,11,'Kínder',NULL,'2021-11-19 08:15:43',NULL),
(24,11,'Preparatoria',NULL,'2021-11-19 08:15:05',NULL),
(25,11,'Primero Primaria',NULL,'2021-11-19 08:15:15',NULL),
(26,11,'Segundo Primaria',NULL,'2021-11-19 08:15:21',NULL),
(27,12,'Tercero Primaria',NULL,'2021-11-19 08:15:46',NULL),
(28,12,'Cuarto Primaria',NULL,'2021-11-19 08:15:52',NULL),
(29,12,'Quinto Primaria',NULL,'2021-11-19 08:15:58',NULL),
(30,12,'Sexto Primaria',NULL,'2021-11-19 08:16:04',NULL),
(31,13,'Primero Básico',NULL,'2021-11-19 08:16:48',NULL),
(32,13,'Segundo Básico',NULL,'2021-11-19 08:16:55',NULL);

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`updatedAt`,`createdAt`,`abbreviation`) values 
(10,'Sección A','','2021-11-19 07:44:23','A');

/*Table structure for table `journeys` */

DROP TABLE IF EXISTS `journeys`;

CREATE TABLE `journeys` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `journeys` */

insert  into `journeys`(`id`,`name`,`updatedAt`,`createdAt`,`abbreviation`) values 
(16,'Matutina',NULL,'2021-11-19 07:42:22','Mat.');

/*Table structure for table `levels` */

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `abbreviation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `levels` */

insert  into `levels`(`id`,`name`,`updatedAt`,`createdAt`,`abbreviation`) values 
(11,'Preprimaria y Primaria Baja',NULL,'2021-11-19 08:13:48',NULL),
(12,'Primaria Alta',NULL,'2021-11-19 08:13:35',NULL),
(13,'Secundaria',NULL,'2021-11-19 08:13:39',NULL);

/*Table structure for table `matriculates` */

DROP TABLE IF EXISTS `matriculates`;

CREATE TABLE `matriculates` (
  `id` int(11) NOT NULL,
  `academicPeriodGroupId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `matriculates` */

insert  into `matriculates`(`id`,`academicPeriodGroupId`) values 
(0,62),
(2,63),
(3,64),
(4,65),
(5,66),
(6,67),
(7,68),
(8,69),
(9,70),
(10,71);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
