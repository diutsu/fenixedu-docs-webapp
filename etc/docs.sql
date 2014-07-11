-- MySQL dump 10.13  Distrib 5.1.43, for apple-darwin10.2.0 (i386)
--
-- Host: localhost    Database: docs
-- ------------------------------------------------------
-- Server version	5.1.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ABSTRACT_FILE_NODE`
--

DROP TABLE IF EXISTS `ABSTRACT_FILE_NODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ABSTRACT_FILE_NODE` (
  `OID_REPOSITORY_USER` bigint(20) unsigned DEFAULT NULL,
  `OID_WRITE_PERSISTENT_GROUP` bigint(20) unsigned DEFAULT NULL,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_DOCUMENT` bigint(20) unsigned DEFAULT NULL,
  `QUOTA` bigint(20) DEFAULT NULL,
  `OID_SHARED_FOLDER_USER` bigint(20) unsigned DEFAULT NULL,
  `SIZE` bigint(20) DEFAULT NULL,
  `FILENAME_TEMPLATE` text,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `SLUG` text,
  `NAME` text,
  `OID_USER` bigint(20) unsigned DEFAULT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  `OID_DEFAULT_TEMPLATE` bigint(20) unsigned DEFAULT NULL,
  `OID_READ_PERSISTENT_GROUP` bigint(20) unsigned DEFAULT NULL,
  `CREATED` timestamp NULL DEFAULT NULL,
  `OID_PARENT` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_FILE_MANAGEMENT_SYSTEM` bigint(20) unsigned DEFAULT NULL,
  `MODIFIED` timestamp NULL DEFAULT NULL,
  `OID_INNER_NODE` bigint(20) unsigned DEFAULT NULL,
  `OID_TRASH` bigint(20) unsigned DEFAULT NULL,
  `OID_ROOT_TRASH_DIR_NODE` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_READ_PERSISTENT_GROUP` (`OID_READ_PERSISTENT_GROUP`),
  KEY `OID_REPOSITORY_USER` (`OID_REPOSITORY_USER`),
  KEY `OID_WRITE_PERSISTENT_GROUP` (`OID_WRITE_PERSISTENT_GROUP`),
  KEY `OID_DOCUMENT` (`OID_DOCUMENT`),
  KEY `OID_PARENT` (`OID_PARENT`),
  KEY `OID_FILE_MANAGEMENT_SYSTEM` (`OID_FILE_MANAGEMENT_SYSTEM`),
  KEY `OID` (`OID`),
  KEY `OID_INNER_NODE` (`OID_INNER_NODE`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ABSTRACT_FILE_NODE`
--

LOCK TABLES `ABSTRACT_FILE_NODE` WRITE;
/*!40000 ALTER TABLE `ABSTRACT_FILE_NODE` DISABLE KEYS */;
INSERT INTO `ABSTRACT_FILE_NODE` VALUES (NULL,304942678019,3,NULL,52428800,NULL,0,NULL,115964116995,NULL,'admin',NULL,NULL,NULL,304942678019,'2014-07-11 14:36:39',NULL,NULL,369367187457,'2014-07-11 14:36:39',NULL,115964116996,NULL),(NULL,287762808838,4,NULL,9223372036854775807,NULL,0,NULL,115964116996,NULL,'Lixo',NULL,NULL,NULL,304942678019,'2014-07-11 14:36:39',NULL,NULL,NULL,'2014-07-11 14:36:39',NULL,NULL,115964116995),(NULL,304942678019,6,NULL,NULL,NULL,0,NULL,115964116998,NULL,'Ficheiros Partilhados',NULL,NULL,NULL,304942678019,'2014-07-11 14:36:39',NULL,NULL,NULL,'2014-07-11 14:36:39',NULL,NULL,NULL),(NULL,304942678019,8,NULL,52428800,NULL,59412,NULL,115964117000,NULL,'admin',167503724545,NULL,NULL,304942678019,'2014-07-11 14:36:39',NULL,NULL,369367187457,'2014-07-11 14:38:21',NULL,115964117001,NULL),(NULL,287762808838,9,NULL,9223372036854775807,NULL,0,NULL,115964117001,NULL,'Lixo',NULL,NULL,NULL,304942678019,'2014-07-11 14:36:39',NULL,NULL,NULL,'2014-07-11 14:36:39',NULL,NULL,115964117000),(NULL,304942678019,10,NULL,NULL,167503724545,0,NULL,115964117002,NULL,'Ficheiros Partilhados',NULL,NULL,NULL,304942678019,'2014-07-11 14:36:39',NULL,NULL,NULL,'2014-07-11 14:36:39',NULL,NULL,NULL),(NULL,NULL,11,34359738370,NULL,NULL,NULL,NULL,227633266699,NULL,NULL,NULL,NULL,NULL,NULL,NULL,115964117000,NULL,NULL,NULL,NULL,NULL,NULL),(NULL,NULL,13,NULL,NULL,NULL,0,NULL,115964117005,NULL,'SDSFD',NULL,NULL,NULL,NULL,'2014-07-11 14:38:17',115964117000,NULL,NULL,'2014-07-11 14:38:17',NULL,NULL,NULL),(NULL,NULL,14,NULL,NULL,NULL,0,NULL,115964117006,NULL,'asdas',NULL,NULL,NULL,NULL,'2014-07-11 14:38:21',115964117000,NULL,NULL,'2014-07-11 14:38:21',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ABSTRACT_FILE_NODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ABSTRACT_LOG`
--

DROP TABLE IF EXISTS `ABSTRACT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ABSTRACT_LOG` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `VISIBILITY_GROUP` text,
  `VERSION_NUMBER` int(11) DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_DIR_NODE` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `OID_FILE_NODE` bigint(20) unsigned DEFAULT NULL,
  `OID_TARGET_PATH` bigint(20) unsigned DEFAULT NULL,
  `OID_TARGET_DIR_NODE` bigint(20) unsigned DEFAULT NULL,
  `OID_USER` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_DIR_NODE` (`OID_DIR_NODE`),
  KEY `OID_FILE_NODE` (`OID_FILE_NODE`),
  KEY `OID` (`OID`),
  KEY `OID_TARGET_DIR_NODE` (`OID_TARGET_DIR_NODE`),
  KEY `OID_USER` (`OID_USER`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ABSTRACT_LOG`
--

LOCK TABLES `ABSTRACT_LOG` WRITE;
/*!40000 ALTER TABLE `ABSTRACT_LOG` DISABLE KEYS */;
INSERT INTO `ABSTRACT_LOG` VALUES (1,NULL,NULL,'2014-07-11 14:37:54',NULL,NULL,343597383681,227633266699,219043332097,115964117000,167503724545),(2,NULL,NULL,'2014-07-11 14:38:17',NULL,115964117005,150323855362,NULL,219043332098,115964117000,167503724545),(3,NULL,NULL,'2014-07-11 14:38:21',NULL,115964117006,150323855363,NULL,219043332099,115964117000,167503724545);
/*!40000 ALTER TABLE `ABSTRACT_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ABSTRACT_NODE`
--

DROP TABLE IF EXISTS `ABSTRACT_NODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ABSTRACT_NODE` (
  `SUB_NODES_BY_OID` text,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_PARENT` bigint(20) unsigned DEFAULT NULL,
  `OID_NEXT` bigint(20) unsigned DEFAULT NULL,
  `DOMAIN_ENTRIES` text,
  `OID_PREVIOUS` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `SUB_NODES` blob,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `ENTRIES` blob,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_PARENT` (`OID_PARENT`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ABSTRACT_NODE`
--

LOCK TABLES `ABSTRACT_NODE` WRITE;
/*!40000 ALTER TABLE `ABSTRACT_NODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ABSTRACT_NODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ABSTRACT_NODE_ARRAY`
--

DROP TABLE IF EXISTS `ABSTRACT_NODE_ARRAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ABSTRACT_NODE_ARRAY` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_PARENT` bigint(20) unsigned DEFAULT NULL,
  `OID_NEXT` bigint(20) unsigned DEFAULT NULL,
  `OID_PREVIOUS` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `SUB_NODES` blob,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `ENTRIES` blob,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_PARENT` (`OID_PARENT`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ABSTRACT_NODE_ARRAY`
--

LOCK TABLES `ABSTRACT_NODE_ARRAY` WRITE;
/*!40000 ALTER TABLE `ABSTRACT_NODE_ARRAY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ABSTRACT_NODE_ARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BENNU`
--

DROP TABLE IF EXISTS `BENNU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BENNU` (
  `OID_SCHEDULER_SYSTEM` bigint(20) unsigned DEFAULT NULL,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_FILE_SUPPORT` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_ROOT` bigint(20) unsigned DEFAULT NULL,
  `OID_FILE_MANAGEMENT_SYSTEM` bigint(20) unsigned DEFAULT NULL,
  `OID_CONFIGURATION` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BENNU`
--

LOCK TABLES `BENNU` WRITE;
/*!40000 ALTER TABLE `BENNU` DISABLE KEYS */;
INSERT INTO `BENNU` VALUES (270582939650,1,73014444034,NULL,1,NULL,90194313218,347892350977);
/*!40000 ALTER TABLE `BENNU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `B_PLUS_TREE`
--

DROP TABLE IF EXISTS `B_PLUS_TREE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_PLUS_TREE` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_TREE_DATA` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_ROOT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `B_PLUS_TREE`
--

LOCK TABLES `B_PLUS_TREE` WRITE;
/*!40000 ALTER TABLE `B_PLUS_TREE` DISABLE KEYS */;
/*!40000 ALTER TABLE `B_PLUS_TREE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `B_PLUS_TREE_ARRAY`
--

DROP TABLE IF EXISTS `B_PLUS_TREE_ARRAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_PLUS_TREE_ARRAY` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_ROOT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `B_PLUS_TREE_ARRAY`
--

LOCK TABLES `B_PLUS_TREE_ARRAY` WRITE;
/*!40000 ALTER TABLE `B_PLUS_TREE_ARRAY` DISABLE KEYS */;
/*!40000 ALTER TABLE `B_PLUS_TREE_ARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDED_DOMAIN_META_OBJECTS_DEPENDING_DEPENDENCE_RECORDS`
--

DROP TABLE IF EXISTS `DEPENDED_DOMAIN_META_OBJECTS_DEPENDING_DEPENDENCE_RECORDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPENDED_DOMAIN_META_OBJECTS_DEPENDING_DEPENDENCE_RECORDS` (
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned NOT NULL DEFAULT '0',
  `OID_DOMAIN_DEPENDENCE_RECORD` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`OID_DOMAIN_META_OBJECT`,`OID_DOMAIN_DEPENDENCE_RECORD`),
  KEY `OID_DOMAIN_META_OBJECT` (`OID_DOMAIN_META_OBJECT`),
  KEY `OID_DOMAIN_DEPENDENCE_RECORD` (`OID_DOMAIN_DEPENDENCE_RECORD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPENDED_DOMAIN_META_OBJECTS_DEPENDING_DEPENDENCE_RECORDS`
--

LOCK TABLES `DEPENDED_DOMAIN_META_OBJECTS_DEPENDING_DEPENDENCE_RECORDS` WRITE;
/*!40000 ALTER TABLE `DEPENDED_DOMAIN_META_OBJECTS_DEPENDING_DEPENDENCE_RECORDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DEPENDED_DOMAIN_META_OBJECTS_DEPENDING_DEPENDENCE_RECORDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIFFERENCE_GROUP_REST`
--

DROP TABLE IF EXISTS `DIFFERENCE_GROUP_REST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIFFERENCE_GROUP_REST` (
  `OID_PERSISTENT_GROUP` bigint(20) unsigned NOT NULL DEFAULT '0',
  `OID_PERSISTENT_DIFFERENCE_GROUP` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`OID_PERSISTENT_GROUP`,`OID_PERSISTENT_DIFFERENCE_GROUP`),
  KEY `OID_PERSISTENT_GROUP` (`OID_PERSISTENT_GROUP`),
  KEY `OID_PERSISTENT_DIFFERENCE_GROUP` (`OID_PERSISTENT_DIFFERENCE_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIFFERENCE_GROUP_REST`
--

LOCK TABLES `DIFFERENCE_GROUP_REST` WRITE;
/*!40000 ALTER TABLE `DIFFERENCE_GROUP_REST` DISABLE KEYS */;
/*!40000 ALTER TABLE `DIFFERENCE_GROUP_REST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIR_NODE_PATH`
--

DROP TABLE IF EXISTS `DIR_NODE_PATH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIR_NODE_PATH` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_NEXT_PATH` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `OID_NODE` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIR_NODE_PATH`
--

LOCK TABLES `DIR_NODE_PATH` WRITE;
/*!40000 ALTER TABLE `DIR_NODE_PATH` DISABLE KEYS */;
INSERT INTO `DIR_NODE_PATH` VALUES (1,NULL,NULL,219043332097,115964117000),(2,NULL,NULL,219043332098,115964117000),(3,NULL,NULL,219043332099,115964117000);
/*!40000 ALTER TABLE `DIR_NODE_PATH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCUMENT`
--

DROP TABLE IF EXISTS `DOCUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCUMENT` (
  `OID_LAST_VERSIONED_FILE` bigint(20) unsigned DEFAULT NULL,
  `OID_WRITE_PERSISTENT_GROUP` bigint(20) unsigned DEFAULT NULL,
  `OID_READ_PERSISTENT_GROUP` bigint(20) unsigned DEFAULT NULL,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `LAST_MODIFIED_DATE` timestamp NULL DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_WRITE_PERSISTENT_GROUP` (`OID_WRITE_PERSISTENT_GROUP`),
  KEY `OID_READ_PERSISTENT_GROUP` (`OID_READ_PERSISTENT_GROUP`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCUMENT`
--

LOCK TABLES `DOCUMENT` WRITE;
/*!40000 ALTER TABLE `DOCUMENT` DISABLE KEYS */;
INSERT INTO `DOCUMENT` VALUES (77309411329,NULL,NULL,2,NULL,'2014-07-11 14:37:54',34359738370);
/*!40000 ALTER TABLE `DOCUMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOMAIN_B_PLUS_TREE_DATA`
--

DROP TABLE IF EXISTS `DOMAIN_B_PLUS_TREE_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOMAIN_B_PLUS_TREE_DATA` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `SIZE` int(11) DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `OID_TREE` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOMAIN_B_PLUS_TREE_DATA`
--

LOCK TABLES `DOMAIN_B_PLUS_TREE_DATA` WRITE;
/*!40000 ALTER TABLE `DOMAIN_B_PLUS_TREE_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `DOMAIN_B_PLUS_TREE_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOMAIN_CONSISTENCY_PREDICATE`
--

DROP TABLE IF EXISTS `DOMAIN_CONSISTENCY_PREDICATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOMAIN_CONSISTENCY_PREDICATE` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `INITIALIZED` tinyint(1) DEFAULT NULL,
  `OID_PUBLIC_CONSISTENCY_PREDICATE_OVERRIDDEN` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_CLASS` bigint(20) unsigned DEFAULT NULL,
  `PREDICATE` text,
  `OID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_PUBLIC_CONSISTENCY_PREDICATE_OVERRIDDEN` (`OID_PUBLIC_CONSISTENCY_PREDICATE_OVERRIDDEN`),
  KEY `OID_DOMAIN_META_CLASS` (`OID_DOMAIN_META_CLASS`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOMAIN_CONSISTENCY_PREDICATE`
--

LOCK TABLES `DOMAIN_CONSISTENCY_PREDICATE` WRITE;
/*!40000 ALTER TABLE `DOMAIN_CONSISTENCY_PREDICATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `DOMAIN_CONSISTENCY_PREDICATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOMAIN_DEPENDENCE_RECORD`
--

DROP TABLE IF EXISTS `DOMAIN_DEPENDENCE_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOMAIN_DEPENDENCE_RECORD` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_INCONSISTENT_PREDICATE` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_CONSISTENCY_PREDICATE` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_DEPENDENT_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_INCONSISTENT_PREDICATE` (`OID_INCONSISTENT_PREDICATE`),
  KEY `OID_DOMAIN_CONSISTENCY_PREDICATE` (`OID_DOMAIN_CONSISTENCY_PREDICATE`),
  KEY `OID_DEPENDENT_DOMAIN_META_OBJECT` (`OID_DEPENDENT_DOMAIN_META_OBJECT`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOMAIN_DEPENDENCE_RECORD`
--

LOCK TABLES `DOMAIN_DEPENDENCE_RECORD` WRITE;
/*!40000 ALTER TABLE `DOMAIN_DEPENDENCE_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `DOMAIN_DEPENDENCE_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOMAIN_FENIX_FRAMEWORK_ROOT`
--

DROP TABLE IF EXISTS `DOMAIN_FENIX_FRAMEWORK_ROOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOMAIN_FENIX_FRAMEWORK_ROOT` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_DOMAIN_ROOT` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOMAIN_FENIX_FRAMEWORK_ROOT`
--

LOCK TABLES `DOMAIN_FENIX_FRAMEWORK_ROOT` WRITE;
/*!40000 ALTER TABLE `DOMAIN_FENIX_FRAMEWORK_ROOT` DISABLE KEYS */;
INSERT INTO `DOMAIN_FENIX_FRAMEWORK_ROOT` VALUES (2,1,NULL,231928233986);
/*!40000 ALTER TABLE `DOMAIN_FENIX_FRAMEWORK_ROOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOMAIN_META_CLASS`
--

DROP TABLE IF EXISTS `DOMAIN_META_CLASS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOMAIN_META_CLASS` (
  `OID_DOMAIN_META_SUPERCLASS` bigint(20) unsigned DEFAULT NULL,
  `OID_EXISTING_DOMAIN_META_OBJECTS` bigint(20) unsigned DEFAULT NULL,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `DOMAIN_CLASS_NAME` text,
  `INITIALIZED` tinyint(1) DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_FENIX_FRAMEWORK_ROOT` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_DOMAIN_META_SUPERCLASS` (`OID_DOMAIN_META_SUPERCLASS`),
  KEY `OID_DOMAIN_FENIX_FRAMEWORK_ROOT` (`OID_DOMAIN_FENIX_FRAMEWORK_ROOT`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOMAIN_META_CLASS`
--

LOCK TABLES `DOMAIN_META_CLASS` WRITE;
/*!40000 ALTER TABLE `DOMAIN_META_CLASS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DOMAIN_META_CLASS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOMAIN_META_OBJECT`
--

DROP TABLE IF EXISTS `DOMAIN_META_OBJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOMAIN_META_OBJECT` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_CLASS` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_OBJECT` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOMAIN_META_OBJECT`
--

LOCK TABLES `DOMAIN_META_OBJECT` WRITE;
/*!40000 ALTER TABLE `DOMAIN_META_OBJECT` DISABLE KEYS */;
/*!40000 ALTER TABLE `DOMAIN_META_OBJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOMAIN_ROOT`
--

DROP TABLE IF EXISTS `DOMAIN_ROOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOMAIN_ROOT` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_BENNU` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `OID_INSTALLATION_DATA` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_FENIX_FRAMEWORK_ROOT` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOMAIN_ROOT`
--

LOCK TABLES `DOMAIN_ROOT` WRITE;
/*!40000 ALTER TABLE `DOMAIN_ROOT` DISABLE KEYS */;
INSERT INTO `DOMAIN_ROOT` VALUES (1,347892350977,NULL,1,236223201281,231928233986);
/*!40000 ALTER TABLE `DOMAIN_ROOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FF$DOMAIN_CLASS_INFO`
--

DROP TABLE IF EXISTS `FF$DOMAIN_CLASS_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FF$DOMAIN_CLASS_INFO` (
  `DOMAIN_CLASS_NAME` varchar(255) NOT NULL,
  `DOMAIN_CLASS_ID` int(11) NOT NULL,
  UNIQUE KEY `U1` (`DOMAIN_CLASS_NAME`),
  UNIQUE KEY `U2` (`DOMAIN_CLASS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FF$DOMAIN_CLASS_INFO`
--

LOCK TABLES `FF$DOMAIN_CLASS_INFO` WRITE;
/*!40000 ALTER TABLE `FF$DOMAIN_CLASS_INFO` DISABLE KEYS */;
INSERT INTO `FF$DOMAIN_CLASS_INFO` VALUES ('pt.ist.fenixframework.DomainRoot',0),('org.fenixedu.bennu.core.domain.groups.PersistentAnonymousGroup',1),('org.fenixedu.docs.domain.log.DeleteFileLog',2),('org.fenixedu.bennu.portal.domain.MenuContainer',3),('org.fenixedu.docs.domain.log.UnshareFileLog',4),('org.fenixedu.docs.domain.log.UnshareDirLog',5),('org.fenixedu.docs.domain.metadata.StringMetadata',6),('org.fenixedu.docs.domain.metadata.IntegerMetadata',7),('org.fenixedu.docs.domain.Document',8),('pt.ist.fenixframework.adt.bplustree.DomainInnerNode',9),('pt.ist.fenixframework.DomainBPlusTreeJVSTM',10),('org.fenixedu.bennu.core.domain.groups.PersistentIntersectionGroup',11),('pt.ist.fenixframework.DomainBPlusTreeData',12),('pt.ist.fenixframework.DomainMetaClass',13),('org.fenixedu.docs.domain.metadata.MetadataKey',14),('pt.ist.fenixframework.adt.bplustree.LeafNode',15),('org.fenixedu.bennu.core.domain.groups.PersistentNegationGroup',16),('org.fenixedu.bennu.io.domain.FileSupport',17),('org.fenixedu.docs.domain.VersionedFile',18),('org.fenixedu.docs.domain.log.AccessFileLog',19),('org.fenixedu.bennu.io.domain.DomainStorage',20),('org.fenixedu.bennu.portal.domain.PortalConfiguration',21),('org.fenixedu.docs.domain.metadata.UserMetadata',22),('org.fenixedu.docs.domain.SharedNode',23),('pt.ist.fenixframework.adt.bplustree.DomainLeafNode',24),('pt.ist.fenixframework.adt.bplustree.BPlusTreeArray',25),('org.fenixedu.bennu.io.domain.FileStorageConfiguration',26),('org.fenixedu.docs.domain.DirNode',27),('org.fenixedu.docs.domain.log.DeleteDirLog',28),('pt.ist.fenixframework.adt.bplustree.AbstractNodeArray',29),('org.fenixedu.bennu.io.domain.FileRawData',30),('org.fenixedu.docs.domain.metadata.SeqNumberMetadata',31),('pt.ist.fenixframework.adt.bplustree.AbstractNode',32),('org.fenixedu.docs.domain.AbstractFileNode',33),('pt.ist.fenixframework.consistencyPredicates.PrivateConsistencyPredicate',34),('org.fenixedu.docs.domain.log.CreateDirLog',35),('pt.ist.fenixframework.adt.bplustree.InnerNodeArray',36),('org.fenixedu.docs.domain.log.RecoverFileLog',37),('org.fenixedu.docs.domain.log.FileLog',38),('org.fenixedu.bennu.core.domain.User',39),('pt.ist.fenixframework.consistencyPredicates.PublicConsistencyPredicate',40),('org.fenixedu.bennu.io.domain.GroupBasedFile',41),('org.fenixedu.docs.domain.log.DirLog',42),('org.fenixedu.docs.domain.log.RecoverDirLog',43),('org.fenixedu.docs.domain.SharedFileNode',44),('org.fenixedu.docs.domain.metadata.DateTimeMetadata',45),('org.fenixedu.bennu.io.domain.LocalFileToDelete',46),('org.fenixedu.bennu.io.domain.FileStorage',47),('pt.ist.fenixframework.consistencyPredicates.FinalConsistencyPredicate',48),('org.fenixedu.bennu.core.domain.groups.GroupConstant',49),('pt.ist.fenixframework.adt.bplustree.BPlusTree',50),('org.fenixedu.docs.domain.log.DirNodePath',51),('pt.ist.fenixframework.adt.bplustree.DomainBPlusTree',52),('org.fenixedu.docs.domain.FileNode',53),('pt.ist.fenixframework.DomainFenixFrameworkRoot',54),('pt.ist.fenixframework.data.InstallationData',55),('pt.ist.fenixframework.consistencyPredicates.DomainConsistencyPredicate',56),('org.fenixedu.bennu.core.domain.groups.PersistentDifferenceGroup',57),('pt.ist.fenixframework.adt.bplustree.InnerNode',58),('org.fenixedu.bennu.core.domain.groups.PersistentGroup',59),('org.fenixedu.docs.domain.SharedDirNode',60),('org.fenixedu.bennu.core.domain.groups.PersistentDynamicGroup',61),('org.fenixedu.bennu.io.domain.LocalFileSystemStorage',62),('org.fenixedu.bennu.scheduler.domain.SchedulerSystem',63),('org.fenixedu.docs.domain.log.ShareFileLog',64),('pt.ist.fenixframework.consistencyPredicates.DomainDependenceRecord',65),('org.fenixedu.docs.domain.log.AbstractLog',66),('org.fenixedu.bennu.core.domain.groups.PersistentNobodyGroup',67),('org.fenixedu.docs.domain.log.ShareDirLog',68),('org.fenixedu.docs.domain.webdav.WebdavAuthentication',69),('org.fenixedu.bennu.io.domain.GenericFile',70),('org.fenixedu.bennu.core.domain.groups.PersistentUserGroup',71),('org.fenixedu.docs.domain.log.CreateNewVersionLog',72),('org.fenixedu.docs.domain.metadata.Metadata',73),('org.fenixedu.bennu.scheduler.domain.TaskSchedule',74),('org.fenixedu.docs.domain.metadata.MetadataTemplateRule',75),('org.fenixedu.bennu.core.domain.groups.PersistentLoggedGroup',76),('pt.ist.fenixframework.DomainMetaObject',77),('org.fenixedu.bennu.portal.domain.MenuFunctionality',78),('org.fenixedu.bennu.core.domain.groups.PersistentUnionGroup',79),('org.fenixedu.docs.domain.log.CreateFileLog',80),('org.fenixedu.bennu.core.domain.Bennu',81),('org.fenixedu.bennu.portal.domain.MenuItem',82),('org.fenixedu.docs.domain.metadata.MetadataTemplate',83),('pt.ist.fenixframework.adt.bplustree.LeafNodeArray',84),('org.fenixedu.bennu.core.domain.groups.PersistentAnyoneGroup',85),('org.fenixedu.docs.domain.FileManagementSystem',86);
/*!40000 ALTER TABLE `FF$DOMAIN_CLASS_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FF$LAST_TX_PROCESSED`
--

DROP TABLE IF EXISTS `FF$LAST_TX_PROCESSED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FF$LAST_TX_PROCESSED` (
  `SERVER` varchar(255) NOT NULL,
  `LAST_TX` int(11) NOT NULL,
  `LAST_UPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FF$LAST_TX_PROCESSED`
--

LOCK TABLES `FF$LAST_TX_PROCESSED` WRITE;
/*!40000 ALTER TABLE `FF$LAST_TX_PROCESSED` DISABLE KEYS */;
INSERT INTO `FF$LAST_TX_PROCESSED` VALUES ('pargana@127.0.0.1:fenixedu-docs-webapp:-1444d12b:14725d9ff2c:-8000',16,'2014-07-11 14:39:49');
/*!40000 ALTER TABLE `FF$LAST_TX_PROCESSED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FF$SERVER_ID_LEASE`
--

DROP TABLE IF EXISTS `FF$SERVER_ID_LEASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FF$SERVER_ID_LEASE` (
  `ID` int(11) NOT NULL,
  `SERVER` varchar(255) NOT NULL DEFAULT '',
  `EXPIRATION` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `U1` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FF$SERVER_ID_LEASE`
--

LOCK TABLES `FF$SERVER_ID_LEASE` WRITE;
/*!40000 ALTER TABLE `FF$SERVER_ID_LEASE` DISABLE KEYS */;
INSERT INTO `FF$SERVER_ID_LEASE` VALUES (1,'pargana@127.0.0.1:fenixedu-docs-webapp:-1444d12b:14725d9ff2c:-8000','2014-07-11 14:55:49');
/*!40000 ALTER TABLE `FF$SERVER_ID_LEASE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FF$TRANSACTION_STATISTICS`
--

DROP TABLE IF EXISTS `FF$TRANSACTION_STATISTICS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FF$TRANSACTION_STATISTICS` (
  `SERVER` varchar(255) NOT NULL DEFAULT '',
  `NUM_REPORT` int(11) NOT NULL,
  `NUM_READS` int(11) NOT NULL,
  `NUM_WRITES` int(11) NOT NULL,
  `NUM_ABORTS` int(11) NOT NULL,
  `NUM_CONFLICTS` int(11) NOT NULL,
  `SECONDS` int(11) NOT NULL,
  `STATS_WHEN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `READ_ONLY_READS_MIN` int(11) DEFAULT NULL,
  `READ_ONLY_READS_MAX` int(11) DEFAULT NULL,
  `READ_ONLY_READS_SUM` bigint(20) DEFAULT NULL,
  `READ_WRITE_READS_MIN` int(11) DEFAULT NULL,
  `READ_WRITE_READS_MAX` int(11) DEFAULT NULL,
  `READ_WRITE_READS_SUM` bigint(20) DEFAULT NULL,
  `READ_WRITE_WRITES_MIN` int(11) DEFAULT NULL,
  `READ_WRITE_WRITES_MAX` int(11) DEFAULT NULL,
  `READ_WRITE_WRITES_SUM` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FF$TRANSACTION_STATISTICS`
--

LOCK TABLES `FF$TRANSACTION_STATISTICS` WRITE;
/*!40000 ALTER TABLE `FF$TRANSACTION_STATISTICS` DISABLE KEYS */;
INSERT INTO `FF$TRANSACTION_STATISTICS` VALUES ('pargana@127.0.0.1:fenixedu-docs-webapp:-1444d12b:14725d9ff2c:-8000',1,100,19,0,3,300,'2014-07-11 14:40:49',1,163,1728,3,211,1110,1,15,83);
/*!40000 ALTER TABLE `FF$TRANSACTION_STATISTICS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FF$TX_CHANGE_LOGS`
--

DROP TABLE IF EXISTS `FF$TX_CHANGE_LOGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FF$TX_CHANGE_LOGS` (
  `OBJ_OID` bigint(20) NOT NULL,
  `OBJ_ATTR` varchar(255) NOT NULL,
  `TX_NUMBER` int(11) DEFAULT NULL,
  KEY `TX_NUMBER` (`TX_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FF$TX_CHANGE_LOGS`
--

LOCK TABLES `FF$TX_CHANGE_LOGS` WRITE;
/*!40000 ALTER TABLE `FF$TX_CHANGE_LOGS` DISABLE KEYS */;
INSERT INTO `FF$TX_CHANGE_LOGS` VALUES (115964117000,'child',16),(115964117000,'obj$state',16),(115964117000,'targetLog',16),(167503724545,'operationLog',16),(270582939650,'obj$state',17);
/*!40000 ALTER TABLE `FF$TX_CHANGE_LOGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILE_MANAGEMENT_SYSTEM`
--

DROP TABLE IF EXISTS `FILE_MANAGEMENT_SYSTEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FILE_MANAGEMENT_SYSTEM` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_MY_ORG` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILE_MANAGEMENT_SYSTEM`
--

LOCK TABLES `FILE_MANAGEMENT_SYSTEM` WRITE;
/*!40000 ALTER TABLE `FILE_MANAGEMENT_SYSTEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `FILE_MANAGEMENT_SYSTEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILE_RAW_DATA`
--

DROP TABLE IF EXISTS `FILE_RAW_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FILE_RAW_DATA` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_FILE_SUPPORT` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `CONTENT` longblob,
  `CONTENT_KEY` text,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_FILE_SUPPORT` (`OID_FILE_SUPPORT`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILE_RAW_DATA`
--

LOCK TABLES `FILE_RAW_DATA` WRITE;
/*!40000 ALTER TABLE `FILE_RAW_DATA` DISABLE KEYS */;
INSERT INTO `FILE_RAW_DATA` VALUES (1,73014444034,NULL,128849018881,'','77309411329');
/*!40000 ALTER TABLE `FILE_RAW_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILE_STORAGE`
--

DROP TABLE IF EXISTS `FILE_STORAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FILE_STORAGE` (
  `PATH` text,
  `OID_SCHEDULER_SYSTEM` bigint(20) unsigned DEFAULT NULL,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_FILE_SUPPORT` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `TREE_DIRECTORIES_NAME_LENGTH` int(11) DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `OID_FILE_SUPPORT_AS_DEFAULT` bigint(20) unsigned DEFAULT NULL,
  `NAME` text,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_FILE_SUPPORT` (`OID_FILE_SUPPORT`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILE_STORAGE`
--

LOCK TABLES `FILE_STORAGE` WRITE;
/*!40000 ALTER TABLE `FILE_STORAGE` DISABLE KEYS */;
INSERT INTO `FILE_STORAGE` VALUES (NULL,NULL,1,73014444034,NULL,NULL,85899345921,73014444034,'system-default'),('/var/folders/cd/98fzsdmx303_ly_5lynljb9c0000gn/T/1405089349881-0',270582939650,4,73014444034,NULL,0,266287972356,NULL,'schedulerSystemLoggingStorage');
/*!40000 ALTER TABLE `FILE_STORAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILE_STORAGE_CONFIGURATION`
--

DROP TABLE IF EXISTS `FILE_STORAGE_CONFIGURATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FILE_STORAGE_CONFIGURATION` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_FILE_SUPPORT` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `FILE_TYPE` text,
  `OID_STORAGE` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_FILE_SUPPORT` (`OID_FILE_SUPPORT`),
  KEY `OID_STORAGE` (`OID_STORAGE`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILE_STORAGE_CONFIGURATION`
--

LOCK TABLES `FILE_STORAGE_CONFIGURATION` WRITE;
/*!40000 ALTER TABLE `FILE_STORAGE_CONFIGURATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FILE_STORAGE_CONFIGURATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILE_SUPPORT`
--

DROP TABLE IF EXISTS `FILE_SUPPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FILE_SUPPORT` (
  `OID_DEFAULT_STORAGE` bigint(20) unsigned DEFAULT NULL,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_BENNU` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILE_SUPPORT`
--

LOCK TABLES `FILE_SUPPORT` WRITE;
/*!40000 ALTER TABLE `FILE_SUPPORT` DISABLE KEYS */;
INSERT INTO `FILE_SUPPORT` VALUES (85899345921,2,347892350977,NULL,73014444034);
/*!40000 ALTER TABLE `FILE_SUPPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GENERIC_FILE`
--

DROP TABLE IF EXISTS `GENERIC_FILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GENERIC_FILE` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `CHECKSUM` text,
  `OID_DOCUMENT` bigint(20) unsigned DEFAULT NULL,
  `OID_NEXT_VERSION` bigint(20) unsigned DEFAULT NULL,
  `CHECKSUM_ALGORITHM` text,
  `SIZE` bigint(20) DEFAULT NULL,
  `CREATION_DATE` timestamp NULL DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `CONTENT_KEY` text,
  `OID_GROUP` bigint(20) unsigned DEFAULT NULL,
  `DISPLAY_NAME` text,
  `OID_PREVIOUS_VERSION` bigint(20) unsigned DEFAULT NULL,
  `OID_FILE_SUPPORT` bigint(20) unsigned DEFAULT NULL,
  `CONTENT_TYPE` text,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_STORAGE` bigint(20) unsigned DEFAULT NULL,
  `FILENAME` text,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_FILE_SUPPORT` (`OID_FILE_SUPPORT`),
  KEY `OID_STORAGE` (`OID_STORAGE`),
  KEY `OID` (`OID`),
  KEY `OID_GROUP` (`OID_GROUP`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GENERIC_FILE`
--

LOCK TABLES `GENERIC_FILE` WRITE;
/*!40000 ALTER TABLE `GENERIC_FILE` DISABLE KEYS */;
INSERT INTO `GENERIC_FILE` VALUES (1,'c9e43d4f8f0151972cbf99880418988fe370994b',34359738370,NULL,'SHA',59412,'2014-07-11 14:37:54',77309411329,'128849018881',NULL,'certificado.pdf',NULL,73014444034,'application/pdf',NULL,85899345921,'certificado.pdf');
/*!40000 ALTER TABLE `GENERIC_FILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSTALLATION_DATA`
--

DROP TABLE IF EXISTS `INSTALLATION_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INSTALLATION_DATA` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_DOMAIN_ROOT` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `MODULE_DATA` text,
  `OID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSTALLATION_DATA`
--

LOCK TABLES `INSTALLATION_DATA` WRITE;
/*!40000 ALTER TABLE `INSTALLATION_DATA` DISABLE KEYS */;
INSERT INTO `INSTALLATION_DATA` VALUES (1,1,NULL,'{\"modules\":[{\"name\":\"bennu-core\",\"version\":\"3.1.0\"},{\"name\":\"fenix-framework-core-consistency-predicates\",\"version\":\"2.4.1\"},{\"name\":\"fenix-framework-backend-jvstm-ojb-runtime\",\"version\":\"2.4.1\"},{\"name\":\"bennu-portal\",\"version\":\"3.1.0\"},{\"name\":\"fenix-framework-core-api\",\"version\":\"2.4.1\"},{\"name\":\"bennu-scheduler\",\"version\":\"3.1.0\"},{\"name\":\"fenix-framework-core-adt-bplustree\",\"version\":\"2.4.1\"},{\"name\":\"docs-core\",\"version\":\"2.0.0-SNAPSHOT\"},{\"name\":\"fenixedu-docs-webapp\",\"version\":\"1.0-SNAPSHOT\"},{\"name\":\"bennu-io\",\"version\":\"3.1.0\"}]}',236223201281);
/*!40000 ALTER TABLE `INSTALLATION_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INTERSECTION_GROUP_COMPOSITION`
--

DROP TABLE IF EXISTS `INTERSECTION_GROUP_COMPOSITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTERSECTION_GROUP_COMPOSITION` (
  `OID_PERSISTENT_INTERSECTION_GROUP` bigint(20) unsigned NOT NULL DEFAULT '0',
  `OID_PERSISTENT_GROUP` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`OID_PERSISTENT_INTERSECTION_GROUP`,`OID_PERSISTENT_GROUP`),
  KEY `OID_PERSISTENT_INTERSECTION_GROUP` (`OID_PERSISTENT_INTERSECTION_GROUP`),
  KEY `OID_PERSISTENT_GROUP` (`OID_PERSISTENT_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INTERSECTION_GROUP_COMPOSITION`
--

LOCK TABLES `INTERSECTION_GROUP_COMPOSITION` WRITE;
/*!40000 ALTER TABLE `INTERSECTION_GROUP_COMPOSITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `INTERSECTION_GROUP_COMPOSITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCAL_FILE_TO_DELETE`
--

DROP TABLE IF EXISTS `LOCAL_FILE_TO_DELETE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOCAL_FILE_TO_DELETE` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_FILE_SUPPORT` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `FILE_PATH` text,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_FILE_SUPPORT` (`OID_FILE_SUPPORT`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCAL_FILE_TO_DELETE`
--

LOCK TABLES `LOCAL_FILE_TO_DELETE` WRITE;
/*!40000 ALTER TABLE `LOCAL_FILE_TO_DELETE` DISABLE KEYS */;
/*!40000 ALTER TABLE `LOCAL_FILE_TO_DELETE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MENU_ITEM`
--

DROP TABLE IF EXISTS `MENU_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MENU_ITEM` (
  `ORD` int(11) DEFAULT NULL,
  `PATH` text,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `LAYOUT` text,
  `OID_CONFIGURATION` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `OID_GROUP` bigint(20) unsigned DEFAULT NULL,
  `VISIBLE` tinyint(1) DEFAULT NULL,
  `FULL_PATH` text,
  `OID_PARENT` bigint(20) unsigned DEFAULT NULL,
  `DESCRIPTION` text,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `PROVIDER` text,
  `TITLE` text,
  `ITEM_KEY` text,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_PARENT` (`OID_PARENT`),
  KEY `OID` (`OID`),
  KEY `OID_GROUP` (`OID_GROUP`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENU_ITEM`
--

LOCK TABLES `MENU_ITEM` WRITE;
/*!40000 ALTER TABLE `MENU_ITEM` DISABLE KEYS */;
INSERT INTO `MENU_ITEM` VALUES (1,'ROOT_PATH',1,NULL,90194313218,12884901889,365072220162,0,'/ROOT_PATH',NULL,'{}',NULL,NULL,'{}',NULL),(1,'bennu-admin',3,NULL,NULL,12884901891,261993005060,1,'/bennu-admin',12884901889,'{\"pt-PT\":\"Gestão do Sistema\",\"en-GB\":\"System Management\"}',NULL,NULL,'{\"pt-PT\":\"Gestão do Sistema\",\"en-GB\":\"System Management\"}',NULL),(1,'#/domain-browser',4,NULL,NULL,335007449092,261993005060,1,'/bennu-admin/#/domain-browser',12884901891,'{\"pt-PT\":\"Domain Browser\",\"en-GB\":\"Domain Browser\"}',NULL,'client-side','{\"pt-PT\":\"Domain Browser\",\"en-GB\":\"Domain Browser\"}','#/domain-browser'),(2,'#/system/logger',5,NULL,NULL,335007449093,261993005060,1,'/bennu-admin/#/system/logger',12884901891,'{\"pt-PT\":\"Gestão de Loggers\",\"en-GB\":\"Logger Management\"}',NULL,'client-side','{\"pt-PT\":\"Gestão de Loggers\",\"en-GB\":\"Logger Management\"}','#/system/logger'),(3,'#/configuration',6,NULL,NULL,335007449094,261993005060,1,'/bennu-admin/#/configuration',12884901891,'{\"pt-PT\":\"Gestão do Portal\",\"en-GB\":\"Portal Manager\"}',NULL,'client-side','{\"pt-PT\":\"Gestão do Portal\",\"en-GB\":\"Portal Manager\"}','#/configuration'),(4,'#/system/info',7,NULL,NULL,335007449095,261993005060,1,'/bennu-admin/#/system/info',12884901891,'{\"pt-PT\":\"Informação de Sistema\",\"en-GB\":\"System Information\"}',NULL,'client-side','{\"pt-PT\":\"Informação de Sistema\",\"en-GB\":\"System Information\"}','#/system/info');
/*!40000 ALTER TABLE `MENU_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `METADATA`
--

DROP TABLE IF EXISTS `METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `METADATA` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_METADATA_KEY` bigint(20) unsigned DEFAULT NULL,
  `OID_DOCUMENT` bigint(20) unsigned DEFAULT NULL,
  `INTEGER_VALUE` int(11) DEFAULT NULL,
  `DATETIME_VALUE` timestamp NULL DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `STRING_VALUE` text,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `OID_USER` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_METADATA_KEY` (`OID_METADATA_KEY`),
  KEY `OID_DOCUMENT` (`OID_DOCUMENT`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `METADATA`
--

LOCK TABLES `METADATA` WRITE;
/*!40000 ALTER TABLE `METADATA` DISABLE KEYS */;
INSERT INTO `METADATA` VALUES (1,60129542145,34359738370,NULL,NULL,'2014-07-11 14:37:54',NULL,'admin',25769803777,NULL),(2,60129542146,34359738370,NULL,NULL,'2014-07-11 14:37:54',NULL,'certificado.pdf',25769803778,NULL),(3,60129542147,34359738370,NULL,NULL,'2014-07-11 14:37:54',NULL,'certificado.pdf',25769803779,NULL);
/*!40000 ALTER TABLE `METADATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `METADATA_KEY`
--

DROP TABLE IF EXISTS `METADATA_KEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `METADATA_KEY` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `METADATA_VALUE_TYPE` text,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_FILE_MANAGEMENT_SYSTEM` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `RESERVED` tinyint(1) DEFAULT NULL,
  `KEY_VALUE` text,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_FILE_MANAGEMENT_SYSTEM` (`OID_FILE_MANAGEMENT_SYSTEM`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `METADATA_KEY`
--

LOCK TABLES `METADATA_KEY` WRITE;
/*!40000 ALTER TABLE `METADATA_KEY` DISABLE KEYS */;
INSERT INTO `METADATA_KEY` VALUES (1,'org.fenixedu.docs.domain.metadata.StringMetadata',NULL,369367187457,60129542145,1,'document.new.version.key.value'),(2,'org.fenixedu.docs.domain.metadata.StringMetadata',NULL,369367187457,60129542146,1,'Nome do Ficheiro'),(3,'org.fenixedu.docs.domain.metadata.StringMetadata',NULL,369367187457,60129542147,1,'Nome'),(5,'org.fenixedu.docs.domain.metadata.StringMetadata',NULL,369367187457,60129542149,1,'Tipologia');
/*!40000 ALTER TABLE `METADATA_KEY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `METADATA_KEYS_TEMPLATE`
--

DROP TABLE IF EXISTS `METADATA_KEYS_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `METADATA_KEYS_TEMPLATE` (
  `OID_METADATA_TEMPLATE` bigint(20) unsigned NOT NULL DEFAULT '0',
  `OID_METADATA_KEY` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`OID_METADATA_TEMPLATE`,`OID_METADATA_KEY`),
  KEY `OID_METADATA_TEMPLATE` (`OID_METADATA_TEMPLATE`),
  KEY `OID_METADATA_KEY` (`OID_METADATA_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `METADATA_KEYS_TEMPLATE`
--

LOCK TABLES `METADATA_KEYS_TEMPLATE` WRITE;
/*!40000 ALTER TABLE `METADATA_KEYS_TEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `METADATA_KEYS_TEMPLATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `METADATA_TEMPLATE`
--

DROP TABLE IF EXISTS `METADATA_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `METADATA_TEMPLATE` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_PARENT` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_DIR_NODE` bigint(20) unsigned DEFAULT NULL,
  `OID_FILE_MANAGEMENT_SYSTEM` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `NAME` text,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_PARENT` (`OID_PARENT`),
  KEY `OID_FILE_MANAGEMENT_SYSTEM` (`OID_FILE_MANAGEMENT_SYSTEM`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `METADATA_TEMPLATE`
--

LOCK TABLES `METADATA_TEMPLATE` WRITE;
/*!40000 ALTER TABLE `METADATA_TEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `METADATA_TEMPLATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `METADATA_TEMPLATE_RULE`
--

DROP TABLE IF EXISTS `METADATA_TEMPLATE_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `METADATA_TEMPLATE_RULE` (
  `POSITION` int(11) DEFAULT NULL,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_KEY` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `REQUIRED` tinyint(1) DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `READ_ONLY` tinyint(1) DEFAULT NULL,
  `OID_TEMPLATE` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_KEY` (`OID_KEY`),
  KEY `OID` (`OID`),
  KEY `OID_TEMPLATE` (`OID_TEMPLATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `METADATA_TEMPLATE_RULE`
--

LOCK TABLES `METADATA_TEMPLATE_RULE` WRITE;
/*!40000 ALTER TABLE `METADATA_TEMPLATE_RULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `METADATA_TEMPLATE_RULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OJB_DLIST`
--

DROP TABLE IF EXISTS `OJB_DLIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OJB_DLIST` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `SIZE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OJB_DLIST`
--

LOCK TABLES `OJB_DLIST` WRITE;
/*!40000 ALTER TABLE `OJB_DLIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `OJB_DLIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OJB_DLIST_ENTRIES`
--

DROP TABLE IF EXISTS `OJB_DLIST_ENTRIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OJB_DLIST_ENTRIES` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `DLIST_ID` int(11) NOT NULL DEFAULT '0',
  `POSITION_` int(11) DEFAULT NULL,
  `OID_` longblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OJB_DLIST_ENTRIES`
--

LOCK TABLES `OJB_DLIST_ENTRIES` WRITE;
/*!40000 ALTER TABLE `OJB_DLIST_ENTRIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `OJB_DLIST_ENTRIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OJB_DMAP`
--

DROP TABLE IF EXISTS `OJB_DMAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OJB_DMAP` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `SIZE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OJB_DMAP`
--

LOCK TABLES `OJB_DMAP` WRITE;
/*!40000 ALTER TABLE `OJB_DMAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `OJB_DMAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OJB_DMAP_ENTRIES`
--

DROP TABLE IF EXISTS `OJB_DMAP_ENTRIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OJB_DMAP_ENTRIES` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `DMAP_ID` int(11) NOT NULL DEFAULT '0',
  `KEY_OID` longblob,
  `VALUE_OID` longblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OJB_DMAP_ENTRIES`
--

LOCK TABLES `OJB_DMAP_ENTRIES` WRITE;
/*!40000 ALTER TABLE `OJB_DMAP_ENTRIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `OJB_DMAP_ENTRIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OJB_DSET`
--

DROP TABLE IF EXISTS `OJB_DSET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OJB_DSET` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `SIZE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OJB_DSET`
--

LOCK TABLES `OJB_DSET` WRITE;
/*!40000 ALTER TABLE `OJB_DSET` DISABLE KEYS */;
/*!40000 ALTER TABLE `OJB_DSET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OJB_DSET_ENTRIES`
--

DROP TABLE IF EXISTS `OJB_DSET_ENTRIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OJB_DSET_ENTRIES` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `DLIST_ID` int(11) NOT NULL DEFAULT '0',
  `POSITION_` int(11) DEFAULT NULL,
  `OID_` longblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OJB_DSET_ENTRIES`
--

LOCK TABLES `OJB_DSET_ENTRIES` WRITE;
/*!40000 ALTER TABLE `OJB_DSET_ENTRIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `OJB_DSET_ENTRIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OJB_HL_SEQ`
--

DROP TABLE IF EXISTS `OJB_HL_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OJB_HL_SEQ` (
  `TABLENAME` varchar(175) NOT NULL DEFAULT '',
  `FIELDNAME` varchar(70) NOT NULL DEFAULT '',
  `MAX_KEY` int(11) DEFAULT NULL,
  `GRAB_SIZE` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`TABLENAME`,`FIELDNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OJB_HL_SEQ`
--

LOCK TABLES `OJB_HL_SEQ` WRITE;
/*!40000 ALTER TABLE `OJB_HL_SEQ` DISABLE KEYS */;
INSERT INTO `OJB_HL_SEQ` VALUES ('SEQ_ABSTRACT_FILE_NODE','deprecatedColumn',200,200,1),('SEQ_ABSTRACT_LOG','deprecatedColumn',200,200,1),('SEQ_BENNU','deprecatedColumn',200,200,1),('SEQ_DIR_NODE_PATH','deprecatedColumn',200,200,1),('SEQ_DOCUMENT','deprecatedColumn',200,200,1),('SEQ_DOMAIN_FENIX_FRAMEWORK_ROOT','deprecatedColumn',200,200,1),('SEQ_FILE_MANAGEMENT_SYSTEM','deprecatedColumn',200,200,1),('SEQ_FILE_RAW_DATA','deprecatedColumn',200,200,1),('SEQ_FILE_STORAGE','deprecatedColumn',200,200,1),('SEQ_FILE_SUPPORT','deprecatedColumn',200,200,1),('SEQ_GENERIC_FILE','deprecatedColumn',200,200,1),('SEQ_INSTALLATION_DATA','deprecatedColumn',200,200,1),('SEQ_MENU_ITEM','deprecatedColumn',200,200,1),('SEQ_METADATA','deprecatedColumn',200,200,1),('SEQ_METADATA_KEY','deprecatedColumn',200,200,1),('SEQ_PERSISTENT_GROUP','deprecatedColumn',200,200,1),('SEQ_PORTAL_CONFIGURATION','deprecatedColumn',200,200,1),('SEQ_SCHEDULER_SYSTEM','deprecatedColumn',200,200,1),('SEQ_USER','deprecatedColumn',200,200,1);
/*!40000 ALTER TABLE `OJB_HL_SEQ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OJB_LOCKENTRY`
--

DROP TABLE IF EXISTS `OJB_LOCKENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OJB_LOCKENTRY` (
  `OID_` varchar(250) NOT NULL DEFAULT '',
  `TX_ID` varchar(50) NOT NULL DEFAULT '',
  `TIMESTAMP_` decimal(10,0) DEFAULT NULL,
  `ISOLATIONLEVEL` int(11) DEFAULT NULL,
  `LOCKTYPE` int(11) DEFAULT NULL,
  PRIMARY KEY (`OID_`,`TX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OJB_LOCKENTRY`
--

LOCK TABLES `OJB_LOCKENTRY` WRITE;
/*!40000 ALTER TABLE `OJB_LOCKENTRY` DISABLE KEYS */;
/*!40000 ALTER TABLE `OJB_LOCKENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OJB_NRM`
--

DROP TABLE IF EXISTS `OJB_NRM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OJB_NRM` (
  `NAME` varchar(250) NOT NULL DEFAULT '',
  `OID_` longblob,
  PRIMARY KEY (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OJB_NRM`
--

LOCK TABLES `OJB_NRM` WRITE;
/*!40000 ALTER TABLE `OJB_NRM` DISABLE KEYS */;
/*!40000 ALTER TABLE `OJB_NRM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OJB_SEQ`
--

DROP TABLE IF EXISTS `OJB_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OJB_SEQ` (
  `TABLENAME` varchar(175) NOT NULL DEFAULT '',
  `FIELDNAME` varchar(70) NOT NULL DEFAULT '',
  `LAST_NUM` int(11) DEFAULT NULL,
  PRIMARY KEY (`TABLENAME`,`FIELDNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OJB_SEQ`
--

LOCK TABLES `OJB_SEQ` WRITE;
/*!40000 ALTER TABLE `OJB_SEQ` DISABLE KEYS */;
/*!40000 ALTER TABLE `OJB_SEQ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSISTENT_GROUP`
--

DROP TABLE IF EXISTS `PERSISTENT_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSISTENT_GROUP` (
  `OID_NEGATED` bigint(20) unsigned DEFAULT NULL,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_NEXT` bigint(20) unsigned DEFAULT NULL,
  `OID_PREVIOUS` bigint(20) unsigned DEFAULT NULL,
  `OID_NEGATION` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `OID_CREATOR` bigint(20) unsigned DEFAULT NULL,
  `OID_GROUP` bigint(20) unsigned DEFAULT NULL,
  `OID_ROOT_FOR_GROUP_CONSTANT` bigint(20) unsigned DEFAULT NULL,
  `OID_FIRST` bigint(20) unsigned DEFAULT NULL,
  `NAME` text,
  `CREATED` timestamp NULL DEFAULT NULL,
  `OID_ROOT_FOR_DYNAMIC_GROUP` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_ROOT` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_ROOT_FOR_DYNAMIC_GROUP` (`OID_ROOT_FOR_DYNAMIC_GROUP`),
  KEY `OID_ROOT` (`OID_ROOT`),
  KEY `OID` (`OID`),
  KEY `OID_CREATOR` (`OID_CREATOR`),
  KEY `OID_GROUP` (`OID_GROUP`),
  KEY `OID_FIRST` (`OID_FIRST`),
  KEY `OID_ROOT_FOR_GROUP_CONSTANT` (`OID_ROOT_FOR_GROUP_CONSTANT`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSISTENT_GROUP`
--

LOCK TABLES `PERSISTENT_GROUP` WRITE;
/*!40000 ALTER TABLE `PERSISTENT_GROUP` DISABLE KEYS */;
INSERT INTO `PERSISTENT_GROUP` VALUES (NULL,2,NULL,NULL,NULL,365072220162,NULL,NULL,347892350977,NULL,NULL,NULL,NULL,NULL,347892350977),(NULL,3,NULL,NULL,NULL,304942678019,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,347892350977),(NULL,4,NULL,NULL,NULL,261993005060,NULL,304942678019,NULL,NULL,'managers','2014-07-11 14:36:33',347892350977,NULL,347892350977),(NULL,6,NULL,NULL,NULL,287762808838,NULL,NULL,347892350977,NULL,NULL,NULL,NULL,NULL,347892350977);
/*!40000 ALTER TABLE `PERSISTENT_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PORTAL_CONFIGURATION`
--

DROP TABLE IF EXISTS `PORTAL_CONFIGURATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PORTAL_CONFIGURATION` (
  `SYSTEM_EMAIL_ADDRESS` text,
  `SUPPORT_EMAIL_ADDRESS` text,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `APPLICATION_TITLE` text,
  `THEME` text,
  `LOGO` blob,
  `FAVICON` blob,
  `HTML_TITLE` text,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `FAVICON_TYPE` text,
  `APPLICATION_COPYRIGHT` text,
  `APPLICATION_SUB_TITLE` text,
  `LOGO_TYPE` text,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_MENU` bigint(20) unsigned DEFAULT NULL,
  `OID_ROOT` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PORTAL_CONFIGURATION`
--

LOCK TABLES `PORTAL_CONFIGURATION` WRITE;
/*!40000 ALTER TABLE `PORTAL_CONFIGURATION` DISABLE KEYS */;
INSERT INTO `PORTAL_CONFIGURATION` VALUES (NULL,NULL,2,'{\"en-US\":\"docs\"}','default','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0,\0\0\0,\0\0\0�Z\0\0\0	pHYs\0\0\0\0\0��\0\0�iCCPPhotoshop ICC profile\0\0xڍ��oe�?��ά	8S���?��B�`�Aw�˶P�f�bۘ����ݱ�����#=q����<�x2�_.�A	AClHL8��#D.���Lwh�����~����<��U�w��z������Ĥ��A�gXC7k�v����!���<r��L\n�����������@�س�:�k�*���h臐y�R����]�(.\0]SQ<t��J?d\\���\Zd恞�D���#\0t��\'�c[�R�*���ʄ��\\��3붖�6k���C�VHk��JbW�#������\n�R�f�r�6H?5��E���\'\Z�o� ]s���8\Z>զ��4Ub�e;����͆��h�d�􀶩�\Z������Hq��D�8���;Ճe���U�r8򬝑n��k��{�=wx(���#���1:Պݡ\Z�k��s`0���ny(�&ΪVe,�\\��b)�Ko,��7Ԫ�C���s$UE�d\n���},*��c�h2��K	��Dᤞdg\\������c���\n&R�c�b�Ȋ]\"+��!�O�}X�5��/\n\"+���vm9�oQ�v��]ZH,*!�����wR���WN�y����g��\'9f�����/����q]�{���K�~�|�[��~]����:�W}A_�o��ť�d���$H8H�p��*.���L�P��Nwwn�+������\rs�������3{=�i�l�����┴����ﵯ�o����������m�Vߏ�ۓKt+�V���5��F��`>g�du���f�9`n1����%���8Lට��V����(E@���\\-6�^1����{EۥQ4\nF��f���A#��gl1\nF���(>�u�*�*��v��̠p�C� Cy,�o�ǕSo���l�+����={G�Uu]K9�FXJR����\'&��}�B\nH���Ʌo���@���M���\0ֿ��m톧?�s�햚�����OL��}�̓~si��f�|�?XZ�������@[���Y\0qx����\0\0\0 cHRM\0\0m�\0\0s�\0\0�{\0\0��\0\0n�\0\0�\Z\0\03\'\0\0�I\0\0�IDATx��Xˑ�0�vq�D8l&P[���88p$����@6�4�zF��J~岟�OO��cS��q��|\0��=ލ����*�\0^�=�}?_	�^�mW��r���zͱ�h�����s4/��V���#\0\0)0~�P��@�*bXL�}e��\Z�K�@%0���i|<$���������\0�@td��i���o\0���l�9;k5�eM���1���;�6kx��Bf��ce]!`���������{\0��DP.�99��3�\0�X�XXyB�d|��\0�H����OO/CR���R΀�h�u���Puv�_^�عv�5��p���*,��jy�@;��Ӎ����i�$�J�0����L��	\Z�IӾ��نcvG�h�p\n-U�3\n�HN4����Mk�t��Q�����0�6�tm�̘R(��.����r6 �<;QYr���2�\0�*m�r2�C·�����֐���\0��sf�1Y���V�}�vM����\Z��u����+o�X���i����*���@te��>Rp�\")�D�Z̰�_��A�vR`8�q�8U	+&P4@�O���s̐GM�#�D���Z��ة,�i��z9�4\0*��v�jm5� O�NL+Uǳ�7�H�V���,17�.r�Q��0������Z�!+��m�)^�,[jE��:���AZ�����Kr���\n�yJvTI4R�b��zy\0��|\0���\09��s��>c\0\0\0\0IEND�B`�','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0$iCCPICC Profile\0\08�U�o�T>�oR�? XG��ůUS[�\Z��I���J���*$�:7���鶪O{�7�@�H<!\rb{����IS�*�IH{��!&�U�vb\'S�\\���9�9�;�^�D=_i��U������$�����M�ҳ�Kԫ�N-���.����������N�#�z��щ\"O�n}�Q��k�K���i�����6��}�x��\'=N!?	��*���<��f/�a_ȓ�Un�\"f����ar��/�q�1�.�u��]�X����c���+�T��?׵��K�_��Ia����|xQ���}t��G__���{�p�M�ju1{���%��#8�ug����V���c葨�Si�a��J}��_�qV��˳Z��#�d�����?������:73��KWkn��Aڮ�YQ�2�;^��)m����v��J���&�fzg����ڐ����ty�?�:/��]�Rb���G�DD#N-bթJ;�P�2�ĽF6<%2Ȅ���a1\"O�l�y9��Ǆ���-�Q�;ǯp�ɱX?S��b��0g��7؛�K�:�\nrm:*�}(��OuT:NP��@}(�Q���\Z�͏����K+�#O�14[� hu7�>�kk?�<�����kkt�q�݋m�6�nƶ��د�-�mR;`z�����v�	x#=\\�%\r�o�Y��Rڱ������#&�?�>�ҹ�Ъ����n�_���;j�;�$}*}+�(}\'}/�L�tY�\"�$]���.9�｟%�{�_a݊]h�k�5\'SN�{������<��_�����	����t\n�jM�{-�4%���Tń�tY۟��R6����#�v\\�喊x:��\'H��O���3����^�&�����0::�m,L%�3�:qVE�\nt���]~��I�v�6�Wٯ��)	|ʸ2]�G��4��(6w���$��\"��A���Ev�m�[D���;�Vh[�}���\Zچ�N|�3�������H��S:����K��t��x��U�\'D;7\Z��7\Z;_\"��e�?Y\0qxl+\0\0\0	pHYs\0\0\0\0\0��\0\0$iTXtXML:com.adobe.xmp\0\0\0\0\0<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 5.4.0\">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"\n            xmlns:exif=\"http://ns.adobe.com/exif/1.0/\"\n            xmlns:dc=\"http://purl.org/dc/elements/1.1/\"\n            xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\">\n         <tiff:ResolutionUnit>1</tiff:ResolutionUnit>\n         <tiff:Compression>5</tiff:Compression>\n         <tiff:XResolution>72</tiff:XResolution>\n         <tiff:Orientation>1</tiff:Orientation>\n         <tiff:YResolution>72</tiff:YResolution>\n         <exif:PixelXDimension>48</exif:PixelXDimension>\n         <exif:ColorSpace>1</exif:ColorSpace>\n         <exif:PixelYDimension>48</exif:PixelYDimension>\n         <dc:subject>\n            <rdf:Bag/>\n         </dc:subject>\n         <xmp:ModifyDate>2014-04-22T15:04:02</xmp:ModifyDate>\n         <xmp:CreatorTool>Pixelmator 2.1.1</xmp:CreatorTool>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>\n�\"(C\0\0sIDATh�V�N�@u�/}�D*�m�@H \r�B$$!�z/����+������p��z�]vמEFU��d�z<���Ļ3I\"�( \n���( \n����@���q��)��ϒ�^=��ޑ_Y����~��xa���`/_��g�\Z�qX;�׾�\'���$G���3�@��y��s�gb�d��[<%���� l��~���E��Vf1�*M�^ߊA��z�b\0<O�zF��C��XL��$��Xt��뢳�8����\'��M���x̫�lLz��.�6٤Ĩ����M\rݣx��h�u,���cZ��+���Z�N��a~BX�����M��m�g��O!��p�+��_��)\\�b#��\0E������%B{��ȧq��1��_�u�ֺ�x\n��E��ě����0T���r����Q��1�bc�sČX�^^��ʃ��̪a��x��,�p]���8N\'Q�!�^�&_Ȣy�c�?��J���0�����61q�E��X	o�Sg|>L�h#�N!�}��O�3Fi�_0���S�Ƚ}`\\�t��D<�����o<}�1G�I���x���\Z�;�����|0� ,VЉ��b&���A�1\"ǤsP%c�DQ@DQ@D�\0�Aњ�j0\0\0\0\0IEND�B`�','{\"en-US\":\"Application Title\"}',90194313218,'image/png','{\"en-US\":\"docs\"}','{\"en-US\":\"docs\"}','image/png',NULL,12884901889,347892350977);
/*!40000 ALTER TABLE `PORTAL_CONFIGURATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCHEDULER_SYSTEM`
--

DROP TABLE IF EXISTS `SCHEDULER_SYSTEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCHEDULER_SYSTEM` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `LEASE` timestamp NULL DEFAULT NULL,
  `OID_BENNU` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID_LOGGING_STORAGE` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCHEDULER_SYSTEM`
--

LOCK TABLES `SCHEDULER_SYSTEM` WRITE;
/*!40000 ALTER TABLE `SCHEDULER_SYSTEM` DISABLE KEYS */;
INSERT INTO `SCHEDULER_SYSTEM` VALUES (2,'2014-07-11 14:40:49',347892350977,NULL,266287972356,270582939650);
/*!40000 ALTER TABLE `SCHEDULER_SYSTEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASK_SCHEDULE`
--

DROP TABLE IF EXISTS `TASK_SCHEDULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_SCHEDULE` (
  `OID_SCHEDULER_SYSTEM` bigint(20) unsigned DEFAULT NULL,
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `SCHEDULE` text,
  `TASK_CLASS_NAME` text,
  `RUN_ONCE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_SCHEDULER_SYSTEM` (`OID_SCHEDULER_SYSTEM`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK_SCHEDULE`
--

LOCK TABLES `TASK_SCHEDULE` WRITE;
/*!40000 ALTER TABLE `TASK_SCHEDULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TASK_SCHEDULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UNION_GROUP_COMPOSITION`
--

DROP TABLE IF EXISTS `UNION_GROUP_COMPOSITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UNION_GROUP_COMPOSITION` (
  `OID_PERSISTENT_UNION_GROUP` bigint(20) unsigned NOT NULL DEFAULT '0',
  `OID_PERSISTENT_GROUP` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`OID_PERSISTENT_UNION_GROUP`,`OID_PERSISTENT_GROUP`),
  KEY `OID_PERSISTENT_UNION_GROUP` (`OID_PERSISTENT_UNION_GROUP`),
  KEY `OID_PERSISTENT_GROUP` (`OID_PERSISTENT_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UNION_GROUP_COMPOSITION`
--

LOCK TABLES `UNION_GROUP_COMPOSITION` WRITE;
/*!40000 ALTER TABLE `UNION_GROUP_COMPOSITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `UNION_GROUP_COMPOSITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `PREFERRED_LOCALE` text,
  `OID_BENNU` bigint(20) unsigned DEFAULT NULL,
  `OID_METADATA` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `EMAIL` text,
  `SALT` text,
  `EXPIRATION` text,
  `CREATED` timestamp NULL DEFAULT NULL,
  `PASSWORD` text,
  `OID_WEBDAV_AUTHENTICATION` bigint(20) unsigned DEFAULT NULL,
  `OID_SHARED_FOLDER` bigint(20) unsigned DEFAULT NULL,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `USERNAME` text,
  `OID_FILE_REPOSITORY` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID_BENNU` (`OID_BENNU`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,NULL,347892350977,NULL,167503724545,'admin@admin.eu','Tj0wtTJpyLM8kH+/1mfQiS8nV5bCpgTtmuMlfvw8wGTFQPcKY1g/vr5Wn8Wut7rRcisHsIKpXXe538GLBvKxmw==',NULL,'2014-07-11 14:36:33','e560ccdf5411ef10206052c1053522f7d171093cd0a7ca5eed95b844dd45cd746e38ef067ee5cd17d9e0d686b9564d58b5257bdef559cb2772a2a7ec7fc6cbce',NULL,115964117002,NULL,'admin',115964117000);
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FAVORITE_REPOSITORIES`
--

DROP TABLE IF EXISTS `USER_FAVORITE_REPOSITORIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FAVORITE_REPOSITORIES` (
  `OID_ABSTRACT_FILE_NODE` bigint(20) unsigned NOT NULL DEFAULT '0',
  `OID_USER` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`OID_ABSTRACT_FILE_NODE`,`OID_USER`),
  KEY `OID_ABSTRACT_FILE_NODE` (`OID_ABSTRACT_FILE_NODE`),
  KEY `OID_USER` (`OID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FAVORITE_REPOSITORIES`
--

LOCK TABLES `USER_FAVORITE_REPOSITORIES` WRITE;
/*!40000 ALTER TABLE `USER_FAVORITE_REPOSITORIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FAVORITE_REPOSITORIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERS`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_GROUP_MEMBERS` (
  `OID_PERSISTENT_USER_GROUP` bigint(20) unsigned NOT NULL DEFAULT '0',
  `OID_USER` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`OID_PERSISTENT_USER_GROUP`,`OID_USER`),
  KEY `OID_PERSISTENT_USER_GROUP` (`OID_PERSISTENT_USER_GROUP`),
  KEY `OID_USER` (`OID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERS`
--

LOCK TABLES `USER_GROUP_MEMBERS` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERS` DISABLE KEYS */;
INSERT INTO `USER_GROUP_MEMBERS` VALUES (304942678019,167503724545);
/*!40000 ALTER TABLE `USER_GROUP_MEMBERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEBDAV_AUTHENTICATION`
--

DROP TABLE IF EXISTS `WEBDAV_AUTHENTICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEBDAV_AUTHENTICATION` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID_DOMAIN_META_OBJECT` bigint(20) unsigned DEFAULT NULL,
  `OID` bigint(20) unsigned DEFAULT NULL,
  `TOKEN` text,
  `OID_USER` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEBDAV_AUTHENTICATION`
--

LOCK TABLES `WEBDAV_AUTHENTICATION` WRITE;
/*!40000 ALTER TABLE `WEBDAV_AUTHENTICATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `WEBDAV_AUTHENTICATION` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-11 15:41:17
