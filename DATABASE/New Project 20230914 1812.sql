-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema empattendance
--

CREATE DATABASE IF NOT EXISTS empattendance;
USE empattendance;

--
-- Definition of table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL auto_increment,
  `date` date NOT NULL,
  `is_present` tinyint(1) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `ename` varchar(45) NOT NULL,
  `dept` varchar(45) NOT NULL,
  `designation` varchar(45) NOT NULL,
  `dtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;


--
-- Definition of table `emp_details`
--

DROP TABLE IF EXISTS `emp_details`;
CREATE TABLE `emp_details` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `empid` varchar(45) NOT NULL,
  `ename` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` longtext NOT NULL,
  `pass` varchar(45) NOT NULL,
  `ephoto` longblob NOT NULL,
  `dept` varchar(45) NOT NULL,
  `estatus` varchar(45) NOT NULL default 'Waiting',
  `designation` varchar(45) NOT NULL,
  `image_data` longblob,
  `unique_id` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_details`
--

/*!40000 ALTER TABLE `emp_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_details` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
