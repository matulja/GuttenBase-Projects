-- Dump completed on 2012-04-10 18:37:44
CREATE DATABASE  IF NOT EXISTS `deva` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci */;
USE `deva`;
-- MySQL dump 10.13  Distrib 5.1.61, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: deva
-- ------------------------------------------------------
-- Server version	5.1.61-0ubuntu0.10.04.1

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
-- Table structure for table `DEVA_FAELLIGKEITEN`
--

DROP TABLE IF EXISTS `DEVA_FAELLIGKEITEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_FAELLIGKEITEN` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `FAELLIGKEIT_NACHHER` bigint(20) NOT NULL,
  `SINGLETON` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `FAELLIGKEIT_VORHER` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SINGLETON` (`SINGLETON`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_USER`
--

DROP TABLE IF EXISTS `JBPM_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_USER` (
  `id` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_EMAIL_HEADER`
--

DROP TABLE IF EXISTS `JBPM_EMAIL_HEADER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_EMAIL_HEADER` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8_swedish_ci,
  `fromAddress` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `replyToAddress` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ROLLE_SICHT_BERECHTIGUNGEN`
--

DROP TABLE IF EXISTS `DEVA_ROLLE_SICHT_BERECHTIGUNGEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ROLLE_SICHT_BERECHTIGUNGEN` (
  `BERECHTIGUNG_ID` bigint(20) NOT NULL,
  `SICHT_BERECHTIGUNGEN` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  KEY `FKD632FA90D1137703` (`BERECHTIGUNG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_UEBERSETZUNG_PROZESS_SCHRITT`
--

DROP TABLE IF EXISTS `DEVA_UEBERSETZUNG_PROZESS_SCHRITT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_UEBERSETZUNG_PROZESS_SCHRITT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `LOCALE` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `WORT` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `BEZEICHNUNG` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK560F3573153E746F` (`BEZEICHNUNG`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_KOMPONENTE`
--

DROP TABLE IF EXISTS `DEVA_KOMPONENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_KOMPONENTE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `BEIM_LIEFERANTEN_VORHANDEN` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `KLASSIFIKATION` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `KOMPONENTE_PROZESS_STATUS` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `ORIG_LIEFERANTENNUMMER` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `RAW_LIEFERANTENNUMMER` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `ANGELEGT_VON` bigint(20) NOT NULL,
  `ARTIKELBILD` bigint(20) DEFAULT NULL,
  `KOMPONENTE_PROZESS` bigint(20) DEFAULT NULL,
  `KOMPONENTENBEZEICHNUNG` bigint(20) NOT NULL,
  `KUNDE` bigint(20) NOT NULL,
  `LIEFERANT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `KOMPONENTE_FILTER_IDX` (`LIEFERANT`,`KUNDE`,`KOMPONENTENBEZEICHNUNG`),
  KEY `KUNDE_IDX` (`KUNDE`),
  KEY `LIEFERANT_IDX` (`LIEFERANT`),
  KEY `RAW_LIEFERANTENNUMMER_IDX` (`RAW_LIEFERANTENNUMMER`),
  KEY `FKB8970B33A8076CAC` (`KOMPONENTENBEZEICHNUNG`),
  KEY `FKB8970B334E705A2C` (`KOMPONENTE_PROZESS`),
  KEY `FKB8970B33843549E2` (`KUNDE`),
  KEY `FKB8970B3338FD1C19` (`LIEFERANT`),
  KEY `FKB8970B338C57DA6C` (`ANGELEGT_VON`),
  KEY `FKB8970B33A1CBFC4` (`ARTIKELBILD`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_REASSIGNMENT`
--

DROP TABLE IF EXISTS `JBPM_REASSIGNMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_REASSIGNMENT` (
  `id` bigint(20) NOT NULL,
  `Escalation_Reassignments_Id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF23C3C0AA5C17EE0` (`Escalation_Reassignments_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BEZEICHUNG_PROZESS_SCHRITT`
--

DROP TABLE IF EXISTS `DEVA_BEZEICHUNG_PROZESS_SCHRITT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BEZEICHUNG_PROZESS_SCHRITT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `ARTIKEL_SCHRITT` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `IDENTIFIER` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `KOMPONENTEN_SCHRITT` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `MEILENSTEIN` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `SCHRITT_AKTION` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `SCHRITT_TYP` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `STAND_TYP` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDENTIFIER` (`IDENTIFIER`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BONUSZEIT`
--

DROP TABLE IF EXISTS `DEVA_BONUSZEIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BONUSZEIT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `BONUS_TAGE` int(11) NOT NULL,
  `GEWAEHRT_AM` date DEFAULT NULL,
  `KOMMENTAR` varchar(1024) COLLATE utf8_swedish_ci NOT NULL,
  `GEWAEHRT_VON` bigint(20) NOT NULL,
  `PROZESS_SCHRITT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK4F4940821123A3E4` (`PROZESS_SCHRITT`),
  KEY `FK4F4940824C4C8E48` (`GEWAEHRT_VON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BPMN_DEFINITION_TASK_HANDLER_NAMES`
--

DROP TABLE IF EXISTS `DEVA_BPMN_DEFINITION_TASK_HANDLER_NAMES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BPMN_DEFINITION_TASK_HANDLER_NAMES` (
  `BPMN_DEFINITION_ID` bigint(20) NOT NULL,
  `taskHandlerNames` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  KEY `FK70D1BB683EBDB8FE` (`BPMN_DEFINITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_PROZESS_SCHRITT`
--

DROP TABLE IF EXISTS `DEVA_PROZESS_SCHRITT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_PROZESS_SCHRITT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `IST_DATUM` date DEFAULT NULL,
  `SOLL_DATUM` date DEFAULT NULL,
  `PROCESSNODE_ID` bigint(20) DEFAULT NULL,
  `TYP` varchar(100) COLLATE utf8_swedish_ci DEFAULT NULL,
  `ZAEHLER` int(11) DEFAULT NULL,
  `ZULETZT_BESTAETIGT` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `WEITERGESCHALTET_DATUM` date DEFAULT NULL,
  `PROZESS_SCHRITT_DEFINITION` bigint(20) NOT NULL,
  `AKTUELLER_SCHRITT` bigint(20) DEFAULT NULL,
  `INDEX_AKTUELLER_SCHRITT` int(11) DEFAULT NULL,
  `ABGESCHLOSSENER_SCHRITT` bigint(20) DEFAULT NULL,
  `INDEX_ABGESCHLOSSENER_SCHRITT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK7CF74935199FC6F5` (`ABGESCHLOSSENER_SCHRITT`),
  KEY `FK7CF7493575B486B9` (`PROZESS_SCHRITT_DEFINITION`),
  KEY `FK7CF7493511000A0A` (`AKTUELLER_SCHRITT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ARTIKEL_ZUSATZINFORMATIONEN`
--

DROP TABLE IF EXISTS `DEVA_ARTIKEL_ZUSATZINFORMATIONEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ARTIKEL_ZUSATZINFORMATIONEN` (
  `ARTIKEL_ID` bigint(20) NOT NULL,
  `ZUSATZINFO_ID` bigint(20) NOT NULL,
  KEY `FKDA95E807FFED7F4` (`ARTIKEL_ID`),
  KEY `FKDA95E8046B7FC54` (`ZUSATZINFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_DEADLINE`
--

DROP TABLE IF EXISTS `JBPM_DEADLINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_DEADLINE` (
  `id` bigint(20) NOT NULL,
  `deadline_date` date DEFAULT NULL,
  `escalated` int(11) NOT NULL,
  `Deadlines_StartDeadLine_Id` bigint(20) DEFAULT NULL,
  `Deadlines_EndDeadLine_Id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK414B6222684BACA3` (`Deadlines_StartDeadLine_Id`),
  KEY `FK414B622227ABEB8A` (`Deadlines_EndDeadLine_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BENUTZER_PRODUKTGRUPPE`
--

DROP TABLE IF EXISTS `DEVA_BENUTZER_PRODUKTGRUPPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BENUTZER_PRODUKTGRUPPE` (
  `BENUTZER` bigint(20) NOT NULL,
  `PRODUKTGRUPPE` bigint(20) NOT NULL,
  PRIMARY KEY (`BENUTZER`,`PRODUKTGRUPPE`),
  KEY `FK3133F1B3DC74F062` (`BENUTZER`),
  KEY `FK3133F1B32525EA1E` (`PRODUKTGRUPPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ARTIKEL`
--

DROP TABLE IF EXISTS `DEVA_ARTIKEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ARTIKEL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `AMPEL_STATUS` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `ARTIKELPROZESS_STATUS` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `BEIM_LIEFERANTEN_VORHANDEN` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `EINBAUSEITE_AUSSEN` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `EINBAUSEITE_HINTEN` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `EINBAUSEITE_HINTERACHSE` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `EINBAUSEITE_INNEN` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `EINBAUSEITE_LINKS` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `EINBAUSEITE_OBEN` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `EINBAUSEITE_RECHTS` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `EINBAUSEITE_UNTEN` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `EINBAUSEITE_VORDERACHSE` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `EINBAUSEITE_VORNE` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `KLASSIFIKATION` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `ORIG_LIEFERANTENNUMMER` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `RAW_LIEFERANTENNUMMER` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `ORIG_MEYLENUMMER` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `RAW_MEYLENUMMER` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `ORIG_OENUMMER` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `RAW_OENUMMER` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `ANGELEGT_VON` bigint(20) NOT NULL,
  `ARTIKELBILD` bigint(20) DEFAULT NULL,
  `ARTIKELPROZESS` bigint(20) DEFAULT NULL,
  `ARTIKELBEZEICHNUNG` bigint(20) NOT NULL,
  `KUNDE` bigint(20) DEFAULT NULL,
  `LIEFERANT` bigint(20) DEFAULT NULL,
  `PAARBEZIEHUNG` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AMPEL_STATUS_IDX` (`AMPEL_STATUS`),
  KEY `ARTIKEL_FILTER_IDX` (`LIEFERANT`,`KUNDE`,`AMPEL_STATUS`,`ARTIKELBEZEICHNUNG`),
  KEY `KUNDE_IDX` (`KUNDE`),
  KEY `ARTIKELPROZESS_STATUS_IDX` (`ARTIKELPROZESS_STATUS`),
  KEY `LIEFERANT_IDX` (`LIEFERANT`),
  KEY `RAW_MEYLENUMMER_IDX` (`RAW_MEYLENUMMER`),
  KEY `RAW_OENUMMER_IDX` (`RAW_OENUMMER`),
  KEY `RAW_LIEFERANTENNUMMER_IDX` (`RAW_LIEFERANTENNUMMER`),
  KEY `FK6E9467B96B6C33BF` (`ARTIKELPROZESS`),
  KEY `FK6E9467B9843549E2` (`KUNDE`),
  KEY `FK6E9467B98C8FC63D` (`PAARBEZIEHUNG`),
  KEY `FK6E9467B938FD1C19` (`LIEFERANT`),
  KEY `FK6E9467B98C57DA6C` (`ANGELEGT_VON`),
  KEY `FK6E9467B9A1CBFC4` (`ARTIKELBILD`),
  KEY `FK6E9467B92325AC4E` (`ARTIKELBEZEICHNUNG`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ARTIKEL_ZUBEHOER`
--

DROP TABLE IF EXISTS `DEVA_ARTIKEL_ZUBEHOER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ARTIKEL_ZUBEHOER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `ANZAHL` bigint(20) NOT NULL,
  `HINWEIS` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `ARTIKEL` bigint(20) NOT NULL,
  `ZUBEHOER` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK5D10F778B3B24CEA` (`ZUBEHOER`),
  KEY `FK5D10F7783D3B7A12` (`ARTIKEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ARTIKEL_KOMPONENTE`
--

DROP TABLE IF EXISTS `DEVA_ARTIKEL_KOMPONENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ARTIKEL_KOMPONENTE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `ANZAHL` bigint(20) NOT NULL,
  `HINWEIS` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `ARTIKEL` bigint(20) NOT NULL,
  `KOMPONENTE` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK5B3E08468D6CE006` (`KOMPONENTE`),
  KEY `FK5B3E08463D3B7A12` (`ARTIKEL`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_SOLLZEIT_WDH_KLASSIFIKATION`
--

DROP TABLE IF EXISTS `DEVA_SOLLZEIT_WDH_KLASSIFIKATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_SOLLZEIT_WDH_KLASSIFIKATION` (
  `SOLLZEITEN_ID` bigint(20) NOT NULL,
  `SOLLZEIT` bigint(20) DEFAULT NULL,
  `KLASSIFIKATION` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`SOLLZEITEN_ID`,`KLASSIFIKATION`),
  KEY `FK12895194C589307F` (`SOLLZEITEN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_TASK_COMMENT`
--

DROP TABLE IF EXISTS `JBPM_TASK_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_TASK_COMMENT` (
  `id` bigint(20) NOT NULL,
  `addedAt` datetime DEFAULT NULL,
  `text` longtext COLLATE utf8_swedish_ci,
  `addedBy_id` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `TaskData_Comments_Id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE7D49C4FB35E68F5` (`TaskData_Comments_Id`),
  KEY `FKE7D49C4F2FF04688` (`addedBy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WORKITEMINFO_ID_SEQ`
--

DROP TABLE IF EXISTS `WORKITEMINFO_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORKITEMINFO_ID_SEQ` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ARTIKEL_LOGBUCH`
--

DROP TABLE IF EXISTS `DEVA_ARTIKEL_LOGBUCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ARTIKEL_LOGBUCH` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `AKTION` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `BEZUGSOBJEKT_TEXT` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `DATUM` datetime NOT NULL,
  `BENUTZER` bigint(20) NOT NULL,
  `ARTIKEL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK14718296DC74F062` (`BENUTZER`),
  KEY `FK147182967FFED7F4` (`ARTIKEL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_BOOLEAN_EXPRESSION`
--

DROP TABLE IF EXISTS `JBPM_BOOLEAN_EXPRESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_BOOLEAN_EXPRESSION` (
  `id` bigint(20) NOT NULL,
  `expression` longtext COLLATE utf8_swedish_ci,
  `type` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `Escalation_Constraints_Id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA4A3EA79AFB75F7D` (`Escalation_Constraints_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_PROZESS`
--

DROP TABLE IF EXISTS `DEVA_PROZESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_PROZESS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `SOLL_DATUM` date NOT NULL,
  `AMPEL_STATUS` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `KSESSION_ID` bigint(20) DEFAULT NULL,
  `PROCESS_ID` bigint(20) NOT NULL,
  `WORKITEM_ID` bigint(20) DEFAULT NULL,
  `BPMN_DEFINITION` bigint(20) NOT NULL,
  `NAECHSTER_MEILENSTEIN` bigint(20) NOT NULL,
  `PROZESS_DEFINITION` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PROCESS_ID` (`PROCESS_ID`),
  KEY `AMPEL_STATUS_IDX` (`AMPEL_STATUS`),
  KEY `FK87D31085975A806A` (`BPMN_DEFINITION`),
  KEY `FK87D3108562008C47` (`NAECHSTER_MEILENSTEIN`),
  KEY `FK87D31085EB1C5F20` (`PROZESS_DEFINITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_REASSIGNMENT_POTENTIALOWNERS`
--

DROP TABLE IF EXISTS `JBPM_REASSIGNMENT_POTENTIALOWNERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_REASSIGNMENT_POTENTIALOWNERS` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  KEY `FK3178EF69E17E130F` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_FIRMA_SOLLZEITEN_KOMPONENTE`
--

DROP TABLE IF EXISTS `DEVA_FIRMA_SOLLZEITEN_KOMPONENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_FIRMA_SOLLZEITEN_KOMPONENTE` (
  `FIRMA_ID` bigint(20) NOT NULL,
  `SOLLZEITEN_KOMPONENTE_ID` bigint(20) NOT NULL,
  UNIQUE KEY `SOLLZEITEN_KOMPONENTE_ID` (`SOLLZEITEN_KOMPONENTE_ID`),
  KEY `FK635E15D5B3DE8E56` (`SOLLZEITEN_KOMPONENTE_ID`),
  KEY `FK635E15D55CF6CF14` (`FIRMA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_UEBERSETZUNG_ARTIKEL`
--

DROP TABLE IF EXISTS `DEVA_UEBERSETZUNG_ARTIKEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_UEBERSETZUNG_ARTIKEL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `LOCALE` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `WORT` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `BEZEICHNUNG` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK51C371F7EACC69FA` (`BEZEICHNUNG`)
) ENGINE=InnoDB AUTO_INCREMENT=3415 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_PEOPLEASSIGNMENTS_RECIPIENTS`
--

DROP TABLE IF EXISTS `JBPM_PEOPLEASSIGNMENTS_RECIPIENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_PEOPLEASSIGNMENTS_RECIPIENTS` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  KEY `FKF55E684C36B2F154` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_NOTIFICATION`
--

DROP TABLE IF EXISTS `JBPM_NOTIFICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_NOTIFICATION` (
  `id` bigint(20) NOT NULL,
  `priority` int(11) NOT NULL,
  `Escalation_Notifications_Id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAD3513B53E0890B` (`Escalation_Notifications_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_NOTIFICATION_RECIPIENTS`
--

DROP TABLE IF EXISTS `JBPM_NOTIFICATION_RECIPIENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_NOTIFICATION_RECIPIENTS` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_PEOPLEASSIGNMENTS_POTOWNERS`
--

DROP TABLE IF EXISTS `JBPM_PEOPLEASSIGNMENTS_POTOWNERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_PEOPLEASSIGNMENTS_POTOWNERS` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  KEY `FK73D7058336B2F154` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ANGEMELDETER_BENUTZER`
--

DROP TABLE IF EXISTS `DEVA_ANGEMELDETER_BENUTZER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ANGEMELDETER_BENUTZER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `DATUM` datetime NOT NULL,
  `REMOTEHOST` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `SESSION_ID` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `BENUTZER` bigint(20) NOT NULL,
  `BENUTZER_LISTE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKDAE0E2B2DC74F062` (`BENUTZER`),
  KEY `FKDAE0E2B231ED32E7` (`BENUTZER_LISTE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_KOMPONENTE_ZUSATZINFORMATIONEN`
--

DROP TABLE IF EXISTS `DEVA_KOMPONENTE_ZUSATZINFORMATIONEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_KOMPONENTE_ZUSATZINFORMATIONEN` (
  `KOMPONENTE_ID` bigint(20) NOT NULL,
  `ZUSATZINFO_ID` bigint(20) NOT NULL,
  UNIQUE KEY `ZUSATZINFO_ID` (`ZUSATZINFO_ID`),
  KEY `FKA7E180FADFA2B9C0` (`KOMPONENTE_ID`),
  KEY `FKA7E180FA46B7FC54` (`ZUSATZINFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SESSIONINFO_ID_SEQ`
--

DROP TABLE IF EXISTS `SESSIONINFO_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SESSIONINFO_ID_SEQ` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DROOLS_SESSIONINFO`
--

DROP TABLE IF EXISTS `DROOLS_SESSIONINFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DROOLS_SESSIONINFO` (
  `id` int(11) NOT NULL,
  `lastModificationDate` datetime DEFAULT NULL,
  `rulesByteArray` longblob,
  `startDate` datetime DEFAULT NULL,
  `OPTLOCK` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ZUBEHOER`
--

DROP TABLE IF EXISTS `DEVA_ZUBEHOER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ZUBEHOER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `KLASSIFIKATION` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `ORIG_OENUMMER` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `RAW_OENUMMER` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `ZUBEHOERBEZEICHNUNG` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK8B7D1A55E7B2276` (`ZUBEHOERBEZEICHNUNG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ZUSATZINFORMATION`
--

DROP TABLE IF EXISTS `DEVA_ZUSATZINFORMATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ZUSATZINFORMATION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `WERT` varchar(1024) COLLATE utf8_swedish_ci NOT NULL,
  `ZUSATZINFORMATIONBEZEICHNUNG` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKC53A280ABB69726C` (`ZUSATZINFORMATIONBEZEICHNUNG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_FIRMA_ANSPRECHPARTNER`
--

DROP TABLE IF EXISTS `DEVA_FIRMA_ANSPRECHPARTNER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_FIRMA_ANSPRECHPARTNER` (
  `FIRMA_ID` bigint(20) NOT NULL,
  `BENUTZER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `BENUTZER_ID` (`BENUTZER_ID`),
  KEY `FK21484EB7D52DE102` (`BENUTZER_ID`),
  KEY `FK21484EB75CF6CF14` (`FIRMA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_FIRMA_LIEFERANTEN`
--

DROP TABLE IF EXISTS `DEVA_FIRMA_LIEFERANTEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_FIRMA_LIEFERANTEN` (
  `LIEFERANT_ID` bigint(20) NOT NULL,
  `LIEFERANT_FUER_FIRMA_ID` bigint(20) NOT NULL,
  KEY `FKAB4BB876E53E3934` (`LIEFERANT_FUER_FIRMA_ID`),
  KEY `FKAB4BB876793F005B` (`LIEFERANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_DOKUMENT`
--

DROP TABLE IF EXISTS `DEVA_DOKUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_DOKUMENT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `IMAGE_HEIGHT` bigint(20) NOT NULL,
  `IMAGE_WIDTH` bigint(20) NOT NULL,
  `MIME_TYPE` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `DATA_ID` bigint(20) NOT NULL,
  `THUMBNAIL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKEE37CA06862116E3` (`DATA_ID`),
  KEY `FKEE37CA061AD81661` (`THUMBNAIL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_SOLLZEITEN`
--

DROP TABLE IF EXISTS `DEVA_SOLLZEITEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_SOLLZEITEN` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `SOLLZEIT_BEREITS_VORHANDEN` bigint(20) DEFAULT NULL,
  `SOLLZEIT_BEREITS_VORHANDEN_WDH` bigint(20) DEFAULT NULL,
  `MEILENSTEIN_DEFINITION` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK31B0DBCE38FE1D3C` (`MEILENSTEIN_DEFINITION`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_DELEGATION_DELEGATES`
--

DROP TABLE IF EXISTS `JBPM_DELEGATION_DELEGATES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_DELEGATION_DELEGATES` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  KEY `FK4E75DE136B2F154` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ARTIKEL_BESTANDTEIL`
--

DROP TABLE IF EXISTS `DEVA_ARTIKEL_BESTANDTEIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ARTIKEL_BESTANDTEIL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `ANZAHL` bigint(20) NOT NULL,
  `HINWEIS` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `ARTIKEL` bigint(20) NOT NULL,
  `ARTIKEL_BESTANDTEIL` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK7A16C7A1F093319A` (`ARTIKEL_BESTANDTEIL`),
  KEY `FK7A16C7A13D3B7A12` (`ARTIKEL`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_UEBERSETZUNG_ZUBEHOER`
--

DROP TABLE IF EXISTS `DEVA_UEBERSETZUNG_ZUBEHOER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_UEBERSETZUNG_ZUBEHOER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `LOCALE` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `WORT` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `BEZEICHNUNG` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK8B6A0F27ADEDE368` (`BEZEICHNUNG`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_NOTIFICATION_BAS`
--

DROP TABLE IF EXISTS `JBPM_NOTIFICATION_BAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_NOTIFICATION_BAS` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BEZEICHNUNG_ZUBEHOER`
--

DROP TABLE IF EXISTS `DEVA_BEZEICHNUNG_ZUBEHOER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BEZEICHNUNG_ZUBEHOER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `KLASSIFIKATION` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_ATTACHMENT`
--

DROP TABLE IF EXISTS `JBPM_ATTACHMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_ATTACHMENT` (
  `id` bigint(20) NOT NULL,
  `accessType` int(11) DEFAULT NULL,
  `attachedAt` datetime DEFAULT NULL,
  `attachmentContentId` bigint(20) NOT NULL,
  `contentType` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `attachment_size` int(11) DEFAULT NULL,
  `attachedBy_id` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `TaskData_Attachments_Id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF6BB126D8EF5F064` (`attachedBy_id`),
  KEY `FKF6BB126DF21826D9` (`TaskData_Attachments_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ARTIKEL_FAHRZEUGE`
--

DROP TABLE IF EXISTS `DEVA_ARTIKEL_FAHRZEUGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ARTIKEL_FAHRZEUGE` (
  `ARTIKEL_ID` bigint(20) NOT NULL,
  `FAHRZEUG_ID` bigint(20) NOT NULL,
  `SORT_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`ARTIKEL_ID`,`SORT_ORDER`),
  KEY `FKE6AB83FD7FFED7F4` (`ARTIKEL_ID`),
  KEY `FKE6AB83FD2BF81BD0` (`FAHRZEUG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ARTIKEL_DOKUMENTE`
--

DROP TABLE IF EXISTS `DEVA_ARTIKEL_DOKUMENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ARTIKEL_DOKUMENTE` (
  `ARTIKEL_ID` bigint(20) NOT NULL,
  `DOKUMENT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `DOKUMENT_ID` (`DOKUMENT_ID`),
  KEY `FKF8D0B8C7FFED7F4` (`ARTIKEL_ID`),
  KEY `FKF8D0B8CFE056660` (`DOKUMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_ESCALATION`
--

DROP TABLE IF EXISTS `JBPM_ESCALATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_ESCALATION` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `Deadline_Escalation_Id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5CA4A3DFC7A04C70` (`Deadline_Escalation_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_SUBTASKSSTRATEGY`
--

DROP TABLE IF EXISTS `JBPM_SUBTASKSSTRATEGY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_SUBTASKSSTRATEGY` (
  `DTYPE` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `Task_Id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9D95288B36B2F154` (`Task_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BENUTZER`
--

DROP TABLE IF EXISTS `DEVA_BENUTZER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BENUTZER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `USERNAME` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `FIRMA` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  UNIQUE KEY `NAME` (`NAME`),
  KEY `FIRMA_IDX` (`FIRMA`),
  KEY `FK129925F083E97000` (`FIRMA`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BEZEICHNUNG_ARTIKEL`
--

DROP TABLE IF EXISTS `DEVA_BEZEICHNUNG_ARTIKEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BEZEICHNUNG_ARTIKEL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `KLASSIFIKATION` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `PRODUKTGRUPPE` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUKTGRUPPE_IDX` (`PRODUKTGRUPPE`),
  KEY `FK2477D5BA2525EA1E` (`PRODUKTGRUPPE`)
) ENGINE=InnoDB AUTO_INCREMENT=1139 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_PROZESSDEFINITION`
--

DROP TABLE IF EXISTS `DEVA_PROZESSDEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_PROZESSDEFINITION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `PROZESSART` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `KUNDE` bigint(20) NOT NULL,
  `LIEFERANT` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKA2830F98843549E2` (`KUNDE`),
  KEY `FKA2830F9838FD1C19` (`LIEFERANT`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_UEBERSETZUNG_ZUSATZINFORMATION`
--

DROP TABLE IF EXISTS `DEVA_UEBERSETZUNG_ZUSATZINFORMATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_UEBERSETZUNG_ZUSATZINFORMATION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `LOCALE` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `WORT` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `BEZEICHNUNG` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKB807FCC8D2732549` (`BEZEICHNUNG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_FAHRZEUG_BEZEICHNUNG`
--

DROP TABLE IF EXISTS `DEVA_FAHRZEUG_BEZEICHNUNG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_FAHRZEUG_BEZEICHNUNG` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `BEZEICHNUNG` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `FAHRZEUG_TYP` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `HERSTELLER` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `BEZEICHNUNG` (`BEZEICHNUNG`),
  UNIQUE KEY `FAHRZEUG_TYP` (`FAHRZEUG_TYP`,`HERSTELLER`),
  KEY `BEZEICHNUNG_IDX` (`BEZEICHNUNG`)
) ENGINE=InnoDB AUTO_INCREMENT=3620 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_FIRMA`
--

DROP TABLE IF EXISTS `DEVA_FIRMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_FIRMA` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `ARBEITET_MIT_DEVA` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `LIEFERANT` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ROLLE_AMPELSTATUS`
--

DROP TABLE IF EXISTS `DEVA_ROLLE_AMPELSTATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ROLLE_AMPELSTATUS` (
  `AMPELSTATUS_ID` bigint(20) NOT NULL,
  `AMPELSTATUS` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  KEY `FK511F24132E56239D` (`AMPELSTATUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_GROUP`
--

DROP TABLE IF EXISTS `JBPM_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_GROUP` (
  `id` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BPMNDEFINITION`
--

DROP TABLE IF EXISTS `DEVA_BPMNDEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BPMNDEFINITION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `BPMN` longblob NOT NULL,
  `BPMN_PROCESS_ID` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `BPMN_VERSION` int(11) NOT NULL,
  `DATUM` datetime NOT NULL,
  `NAME` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `PROZESSDEFINITION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKA6CA9AB5CBFA49B5` (`PROZESSDEFINITION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ROLLE`
--

DROP TABLE IF EXISTS `DEVA_ROLLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ROLLE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `FESTE_ROLLE` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `ROLLE` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ROLLE` (`ROLLE`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_I18NTEXT`
--

DROP TABLE IF EXISTS `JBPM_I18NTEXT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_I18NTEXT` (
  `id` bigint(20) NOT NULL,
  `language` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `text` longtext COLLATE utf8_swedish_ci,
  `Task_Subjects_Id` bigint(20) DEFAULT NULL,
  `Task_Names_Id` bigint(20) DEFAULT NULL,
  `Task_Descriptions_Id` bigint(20) DEFAULT NULL,
  `Reassignment_Documentation_Id` bigint(20) DEFAULT NULL,
  `Notification_Subjects_Id` bigint(20) DEFAULT NULL,
  `Notification_Names_Id` bigint(20) DEFAULT NULL,
  `Notification_Documentation_Id` bigint(20) DEFAULT NULL,
  `Notification_Descriptions_Id` bigint(20) DEFAULT NULL,
  `Deadline_Documentation_Id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK17E984155EEBB6D9` (`Reassignment_Documentation_Id`),
  KEY `FK17E984153330F6D9` (`Deadline_Documentation_Id`),
  KEY `FK17E9841569B21EE8` (`Task_Descriptions_Id`),
  KEY `FK17E98415B2FA6B18` (`Task_Subjects_Id`),
  KEY `FK17E9841598B62B` (`Task_Names_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BENUTZER_FIRMA`
--

DROP TABLE IF EXISTS `DEVA_BENUTZER_FIRMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BENUTZER_FIRMA` (
  `BENUTZER` bigint(20) NOT NULL,
  `ZUGEORDNETE_FIRMA` bigint(20) NOT NULL,
  PRIMARY KEY (`BENUTZER`,`ZUGEORDNETE_FIRMA`),
  KEY `FK805A2EB4DC74F062` (`BENUTZER`),
  KEY `FK805A2EB45B19B851` (`ZUGEORDNETE_FIRMA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_PEOPLEASSIGNMENTS_BAS`
--

DROP TABLE IF EXISTS `JBPM_PEOPLEASSIGNMENTS_BAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_PEOPLEASSIGNMENTS_BAS` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  KEY `FK32B3FD6236B2F154` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BEZEICHNUNG_KOMPONENTE`
--

DROP TABLE IF EXISTS `DEVA_BEZEICHNUNG_KOMPONENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BEZEICHNUNG_KOMPONENTE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `KLASSIFIKATION` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_PROCESSINSTANCE_INFO`
--

DROP TABLE IF EXISTS `JBPM_PROCESSINSTANCE_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_PROCESSINSTANCE_INFO` (
  `InstanceId` bigint(20) NOT NULL,
  `lastModificationDate` datetime DEFAULT NULL,
  `lastReadDate` datetime DEFAULT NULL,
  `processId` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `processInstanceByteArray` longblob,
  `startDate` datetime DEFAULT NULL,
  `state` int(11) NOT NULL,
  `OPTLOCK` int(11) DEFAULT NULL,
  PRIMARY KEY (`InstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ROLLE_AKTIONS_BERECHTIGUNGEN`
--

DROP TABLE IF EXISTS `DEVA_ROLLE_AKTIONS_BERECHTIGUNGEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ROLLE_AKTIONS_BERECHTIGUNGEN` (
  `BERECHTIGUNG_ID` bigint(20) NOT NULL,
  `AKTION_BERECHTIGUNGEN` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  KEY `FK5B9F4D34D1137703` (`BERECHTIGUNG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BEZEICHNUNG_PRODUKTGRUPPE`
--

DROP TABLE IF EXISTS `DEVA_BEZEICHNUNG_PRODUKTGRUPPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BEZEICHNUNG_PRODUKTGRUPPE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_KOMPONENTE_DOKUMENTE`
--

DROP TABLE IF EXISTS `DEVA_KOMPONENTE_DOKUMENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_KOMPONENTE_DOKUMENTE` (
  `KOMPONENTE_ID` bigint(20) NOT NULL,
  `DOKUMENT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `DOKUMENT_ID` (`DOKUMENT_ID`),
  KEY `FKD1DD1E86DFA2B9C0` (`KOMPONENTE_ID`),
  KEY `FKD1DD1E86FE056660` (`DOKUMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_EMAIL_NOTIFICATION`
--

DROP TABLE IF EXISTS `JBPM_EMAIL_NOTIFICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_EMAIL_NOTIFICATION` (
  `id` bigint(20) NOT NULL,
  `priority` int(11) NOT NULL,
  `Escalation_Notifications_Id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAD3513B53E0890B7099f418` (`Escalation_Notifications_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_CONTENT`
--

DROP TABLE IF EXISTS `JBPM_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_CONTENT` (
  `id` bigint(20) NOT NULL,
  `content` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_PEOPLEASSIGNMENTS_STAKEHOLDERS`
--

DROP TABLE IF EXISTS `JBPM_PEOPLEASSIGNMENTS_STAKEHOLDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_PEOPLEASSIGNMENTS_STAKEHOLDERS` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  KEY `FK7DCD4DDF36B2F154` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_FIRMA_SOLLZEITEN_ARTIKEL`
--

DROP TABLE IF EXISTS `DEVA_FIRMA_SOLLZEITEN_ARTIKEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_FIRMA_SOLLZEITEN_ARTIKEL` (
  `FIRMA_ID` bigint(20) NOT NULL,
  `SOLLZEITEN_ARTIKEL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `SOLLZEITEN_ARTIKEL_ID` (`SOLLZEITEN_ARTIKEL_ID`),
  KEY `FK4F2030575CF6CF14` (`FIRMA_ID`),
  KEY `FK4F20305774E70772` (`SOLLZEITEN_ARTIKEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_EMAIL_NOTIFICATION_JBPM_EMAIL_HEADER`
--

DROP TABLE IF EXISTS `JBPM_EMAIL_NOTIFICATION_JBPM_EMAIL_HEADER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_EMAIL_NOTIFICATION_JBPM_EMAIL_HEADER` (
  `JBPM_EMAIL_NOTIFICATION_id` bigint(20) NOT NULL,
  `emailHeaders_id` bigint(20) NOT NULL,
  `emailHeaders_KEY` varchar(255) COLLATE utf8_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`JBPM_EMAIL_NOTIFICATION_id`,`emailHeaders_KEY`),
  UNIQUE KEY `emailHeaders_id` (`emailHeaders_id`),
  KEY `FK9C228713351621EF` (`JBPM_EMAIL_NOTIFICATION_id`),
  KEY `FK9C2287131F7B912A` (`emailHeaders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_DOKUMENT_BINAERDATEN`
--

DROP TABLE IF EXISTS `DEVA_DOKUMENT_BINAERDATEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_DOKUMENT_BINAERDATEN` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `DATA` longblob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BENUTZER_LISTE`
--

DROP TABLE IF EXISTS `DEVA_BENUTZER_LISTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BENUTZER_LISTE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `SINGLETON` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SINGLETON` (`SINGLETON`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BEZEICHNUNG_ZUSATZINFORMATION`
--

DROP TABLE IF EXISTS `DEVA_BEZEICHNUNG_ZUSATZINFORMATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BEZEICHNUNG_ZUSATZINFORMATION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `TYP` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_KOMPONENTE_LOGBUCH`
--

DROP TABLE IF EXISTS `DEVA_KOMPONENTE_LOGBUCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_KOMPONENTE_LOGBUCH` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `AKTION` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `BEZUGSOBJEKT_TEXT` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `DATUM` datetime NOT NULL,
  `BENUTZER` bigint(20) NOT NULL,
  `KOMPONENTE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK77BE0C10DC74F062` (`BENUTZER`),
  KEY `FK77BE0C10DFA2B9C0` (`KOMPONENTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_KOMPONENTE_KOMMENTAR`
--

DROP TABLE IF EXISTS `DEVA_KOMPONENTE_KOMMENTAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_KOMPONENTE_KOMMENTAR` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `DATUM` datetime NOT NULL,
  `TEXT` varchar(1024) COLLATE utf8_swedish_ci NOT NULL,
  `BENUTZER` bigint(20) NOT NULL,
  `KOMPONENTE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK3B7548ACDC74F062` (`BENUTZER`),
  KEY `FK3B7548ACDFA2B9C0` (`KOMPONENTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_BENUTZER_ROLLEN`
--

DROP TABLE IF EXISTS `DEVA_BENUTZER_ROLLEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_BENUTZER_ROLLEN` (
  `BENUTZER` bigint(20) NOT NULL,
  `ROLLE` bigint(20) NOT NULL,
  PRIMARY KEY (`BENUTZER`,`ROLLE`),
  KEY `FK9FB79F15DC74F062` (`BENUTZER`),
  KEY `FK9FB79F156273ABA8` (`ROLLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_PEOPLEASSIGNMENTS_EXCLOWNERS`
--

DROP TABLE IF EXISTS `JBPM_PEOPLEASSIGNMENTS_EXCLOWNERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_PEOPLEASSIGNMENTS_EXCLOWNERS` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  KEY `FK2C7EFE4E36B2F154` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ROLLE_PROZESS_SCHRITT`
--

DROP TABLE IF EXISTS `DEVA_ROLLE_PROZESS_SCHRITT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ROLLE_PROZESS_SCHRITT` (
  `ROLLE` bigint(20) NOT NULL,
  `PROZESS_SCHRITT_DEFINITION` bigint(20) NOT NULL,
  PRIMARY KEY (`ROLLE`,`PROZESS_SCHRITT_DEFINITION`),
  KEY `FK3804709E6273ABA8` (`ROLLE`),
  KEY `FK3804709E75B486B9` (`PROZESS_SCHRITT_DEFINITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_PROCESSINSTANCE_EVENTINFO`
--

DROP TABLE IF EXISTS `JBPM_PROCESSINSTANCE_EVENTINFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_PROCESSINSTANCE_EVENTINFO` (
  `id` bigint(20) NOT NULL,
  `eventType` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `processInstanceId` bigint(20) NOT NULL,
  `OPTLOCK` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_PROCESSINSTANCE_INFO_EVENTTYPES`
--

DROP TABLE IF EXISTS `JBPM_PROCESSINSTANCE_INFO_EVENTTYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_PROCESSINSTANCE_INFO_EVENTTYPES` (
  `JBPM_PROCESSINSTANCE_INFO_ID` bigint(20) NOT NULL,
  `eventTypes` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  KEY `FK42E004EB2143F831` (`JBPM_PROCESSINSTANCE_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_UEBERSETZUNG_PRODUKTGRUPPE`
--

DROP TABLE IF EXISTS `DEVA_UEBERSETZUNG_PRODUKTGRUPPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_UEBERSETZUNG_PRODUKTGRUPPE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `LOCALE` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `WORT` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `BEZEICHNUNG` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK88D3D6D9315E404` (`BEZEICHNUNG`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_PRODUKTGRUPPE`
--

DROP TABLE IF EXISTS `DEVA_PRODUKTGRUPPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_PRODUKTGRUPPE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `BEZEICHNUNG` bigint(20) NOT NULL,
  `OBERGRUPPE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKB68B59AF748E0737` (`OBERGRUPPE`),
  KEY `FKB68B59AF9315E404` (`BEZEICHNUNG`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JBPM_TASK`
--

DROP TABLE IF EXISTS `JBPM_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBPM_TASK` (
  `id` bigint(20) NOT NULL,
  `allowedToDelegate` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `activationTime` datetime DEFAULT NULL,
  `createdOn` date DEFAULT NULL,
  `documentAccessType` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `documentContentId` bigint(20) NOT NULL,
  `documentType` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `expirationTime` datetime DEFAULT NULL,
  `faultAccessType` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `faultContentId` bigint(20) NOT NULL,
  `faultName` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `faultType` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `outputAccessType` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `outputContentId` bigint(20) NOT NULL,
  `outputType` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `parentId` bigint(20) NOT NULL,
  `previousStatus` int(11) DEFAULT NULL,
  `processInstanceId` bigint(20) NOT NULL,
  `skipable` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `workItemId` bigint(20) NOT NULL,
  `taskInitiator_id` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `actualOwner_id` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `createdBy_id` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB48F3A4F9E619A0` (`createdBy_id`),
  KEY `FKB48F3A4F6CE1EF3A` (`actualOwner_id`),
  KEY `FKB48F3A4FF213F8B5` (`taskInitiator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_SOLLZEITEN_KLASSIFIKATION`
--

DROP TABLE IF EXISTS `DEVA_SOLLZEITEN_KLASSIFIKATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_SOLLZEITEN_KLASSIFIKATION` (
  `SOLLZEITEN_ID` bigint(20) NOT NULL,
  `SOLLZEIT` bigint(20) DEFAULT NULL,
  `KLASSIFIKATION` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`SOLLZEITEN_ID`,`KLASSIFIKATION`),
  KEY `FK8E4EE667C589307F` (`SOLLZEITEN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_ARTIKEL_KOMMENTAR`
--

DROP TABLE IF EXISTS `DEVA_ARTIKEL_KOMMENTAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_ARTIKEL_KOMMENTAR` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `DATUM` datetime NOT NULL,
  `TEXT` varchar(1024) COLLATE utf8_swedish_ci NOT NULL,
  `BENUTZER` bigint(20) NOT NULL,
  `ARTIKEL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK792535B2DC74F062` (`BENUTZER`),
  KEY `FK792535B27FFED7F4` (`ARTIKEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DROOLS_WORKITEMINFO`
--

DROP TABLE IF EXISTS `DROOLS_WORKITEMINFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DROOLS_WORKITEMINFO` (
  `workItemId` bigint(20) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `processInstanceId` bigint(20) NOT NULL,
  `state` bigint(20) NOT NULL,
  `OPTLOCK` int(11) DEFAULT NULL,
  `workItemByteArray` longblob,
  PRIMARY KEY (`workItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVA_UEBERSETZUNG_KOMPONENTE`
--

DROP TABLE IF EXISTS `DEVA_UEBERSETZUNG_KOMPONENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEVA_UEBERSETZUNG_KOMPONENTE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) DEFAULT NULL,
  `LOCALE` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `WORT` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `BEZEICHNUNG` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK57AFF0351DC451DA` (`BEZEICHNUNG`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-04-10 18:37:44