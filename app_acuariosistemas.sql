/*
SQLyog Ultimate v8.82 
MySQL - 5.5.5-10.4.32-MariaDB : Database - app_acuariosistemsa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`app_acuariosistemsa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `app_acuariosistemsa`;

/*Table structure for table `emp01_empresas` */

DROP TABLE IF EXISTS `emp01_empresas`;

CREATE TABLE `emp01_empresas` (
  `Clave_Empresa` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Empresa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Clave_Empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `emp02_empresas_usuarios` */

DROP TABLE IF EXISTS `emp02_empresas_usuarios`;

CREATE TABLE `emp02_empresas_usuarios` (
  `Clave_Empresa` int(11) NOT NULL,
  `login` varchar(190) NOT NULL,
  PRIMARY KEY (`Clave_Empresa`,`login`),
  KEY `FK_emp02_01` (`login`),
  CONSTRAINT `FK_emp02_01` FOREIGN KEY (`login`) REFERENCES `sec_users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_emp02_02` FOREIGN KEY (`Clave_Empresa`) REFERENCES `emp01_empresas` (`Clave_Empresa`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `notif_inbox` */

DROP TABLE IF EXISTS `notif_inbox`;

CREATE TABLE `notif_inbox` (
  `inbox_id` int(11) NOT NULL AUTO_INCREMENT,
  `notif_id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `notif_dtsent` datetime NOT NULL DEFAULT current_timestamp(),
  `notif_ontop` int(11) NOT NULL DEFAULT 0,
  `notif_isread` int(11) NOT NULL DEFAULT 0,
  `notif_dtread` datetime DEFAULT NULL,
  `notif_tags` varchar(255) DEFAULT NULL,
  `notif_important` int(11) DEFAULT NULL,
  PRIMARY KEY (`inbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `notif_notifications` */

DROP TABLE IF EXISTS `notif_notifications`;

CREATE TABLE `notif_notifications` (
  `notif_id` int(11) NOT NULL AUTO_INCREMENT,
  `notif_title` varchar(255) NOT NULL,
  `notif_message` text NOT NULL,
  `notif_dtcreated` datetime NOT NULL DEFAULT current_timestamp(),
  `notif_ontop` int(11) NOT NULL DEFAULT 0,
  `notif_dtexpire` datetime DEFAULT NULL,
  `notif_categ` varchar(60) DEFAULT NULL,
  `notif_login_sender` varchar(255) NOT NULL,
  `notif_type` varchar(60) DEFAULT NULL,
  `notif_link` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`notif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `notif_pref` */

DROP TABLE IF EXISTS `notif_pref`;

CREATE TABLE `notif_pref` (
  `login` varchar(255) NOT NULL,
  `receive_email` int(11) NOT NULL DEFAULT 0,
  `receive_sms` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `notif_profiles` */

DROP TABLE IF EXISTS `notif_profiles`;

CREATE TABLE `notif_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) DEFAULT NULL,
  `profile_users` text DEFAULT NULL,
  `profile_groups` text DEFAULT NULL,
  `profile_public` int(11) NOT NULL DEFAULT 0,
  `profile_owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `notif_tags` */

DROP TABLE IF EXISTS `notif_tags`;

CREATE TABLE `notif_tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_title` varchar(50) NOT NULL,
  `login` varchar(255) NOT NULL,
  `tag_color` varchar(100) DEFAULT NULL,
  `tag_active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `notif_user_tags` */

DROP TABLE IF EXISTS `notif_user_tags`;

CREATE TABLE `notif_user_tags` (
  `user_tags_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `login_sender` varchar(255) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `rec01_recursos` */

DROP TABLE IF EXISTS `rec01_recursos`;

CREATE TABLE `rec01_recursos` (
  `Clave_Recurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_recurso` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user` varchar(90) DEFAULT NULL,
  `vicisitud` varchar(255) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Clave_Recurso`),
  UNIQUE KEY `No_duplicado` (`url`,`user`)
) ENGINE=InnoDB AUTO_INCREMENT=978 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `rec02_recursos_empresas` */

DROP TABLE IF EXISTS `rec02_recursos_empresas`;

CREATE TABLE `rec02_recursos_empresas` (
  `Clave_Empresa` int(11) NOT NULL,
  `Clave_Recurso` int(11) NOT NULL,
  PRIMARY KEY (`Clave_Empresa`,`Clave_Recurso`),
  KEY `FK_rec02_recursos_empresas` (`Clave_Recurso`),
  CONSTRAINT `FK_rec02_recursos_empresas` FOREIGN KEY (`Clave_Recurso`) REFERENCES `rec01_recursos` (`Clave_Recurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rec03_recursos_empresas` FOREIGN KEY (`Clave_Empresa`) REFERENCES `emp01_empresas` (`Clave_Empresa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `rec03_recursos_usuarios` */

DROP TABLE IF EXISTS `rec03_recursos_usuarios`;

CREATE TABLE `rec03_recursos_usuarios` (
  `Clave_Recurso` int(11) NOT NULL,
  `login` varchar(190) NOT NULL,
  PRIMARY KEY (`Clave_Recurso`,`login`),
  KEY `FK_rec03_recursos_usuarios` (`login`),
  CONSTRAINT `FK_rec03_recursos_usuarios` FOREIGN KEY (`login`) REFERENCES `sec_users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rec04_recursos_usuarios` FOREIGN KEY (`Clave_Recurso`) REFERENCES `rec01_recursos` (`Clave_Recurso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `sc_log` */

DROP TABLE IF EXISTS `sc_log`;

CREATE TABLE `sc_log` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inserted_date` datetime DEFAULT NULL,
  `username` varchar(90) NOT NULL,
  `application` varchar(255) NOT NULL,
  `creator` varchar(30) NOT NULL,
  `ip_user` varchar(255) NOT NULL,
  `action` varchar(30) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `sec_apps` */

DROP TABLE IF EXISTS `sec_apps`;

CREATE TABLE `sec_apps` (
  `app_name` varchar(128) NOT NULL,
  `app_type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`app_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `sec_groups` */

DROP TABLE IF EXISTS `sec_groups`;

CREATE TABLE `sec_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `sec_groups_apps` */

DROP TABLE IF EXISTS `sec_groups_apps`;

CREATE TABLE `sec_groups_apps` (
  `group_id` int(11) NOT NULL,
  `app_name` varchar(128) NOT NULL,
  `priv_access` varchar(1) DEFAULT NULL,
  `priv_insert` varchar(1) DEFAULT NULL,
  `priv_delete` varchar(1) DEFAULT NULL,
  `priv_update` varchar(1) DEFAULT NULL,
  `priv_export` varchar(1) DEFAULT NULL,
  `priv_print` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`group_id`,`app_name`),
  KEY `sec_groups_apps_ibfk_2` (`app_name`),
  CONSTRAINT `sec_groups_apps_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `sec_groups_apps_ibfk_2` FOREIGN KEY (`app_name`) REFERENCES `sec_apps` (`app_name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `sec_settings` */

DROP TABLE IF EXISTS `sec_settings`;

CREATE TABLE `sec_settings` (
  `set_name` varchar(255) NOT NULL,
  `set_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `sec_users` */

DROP TABLE IF EXISTS `sec_users`;

CREATE TABLE `sec_users` (
  `login` varchar(190) NOT NULL,
  `pswd` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  `activation_code` varchar(32) DEFAULT NULL,
  `priv_admin` varchar(1) DEFAULT NULL,
  `mfa` varchar(255) DEFAULT NULL,
  `picture` longblob DEFAULT NULL,
  `role` varchar(128) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `pswd_last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mfa_last_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `sec_users_groups` */

DROP TABLE IF EXISTS `sec_users_groups`;

CREATE TABLE `sec_users_groups` (
  `login` varchar(190) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`login`,`group_id`),
  KEY `sec_users_groups_ibfk_2` (`group_id`),
  CONSTRAINT `sec_users_groups_ibfk_1` FOREIGN KEY (`login`) REFERENCES `sec_users` (`login`) ON DELETE CASCADE,
  CONSTRAINT `sec_users_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
