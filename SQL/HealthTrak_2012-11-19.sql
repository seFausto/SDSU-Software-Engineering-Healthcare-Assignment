# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.25)
# Database: HealthTrak
# Generation Time: 2012-11-20 00:46:58 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table AccessDescription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AccessDescription`;

CREATE TABLE `AccessDescription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AccessType` int(11) NOT NULL,
  `Feature` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `AccessDescription` WRITE;
/*!40000 ALTER TABLE `AccessDescription` DISABLE KEYS */;

INSERT INTO `AccessDescription` (`ID`, `AccessType`, `Feature`)
VALUES
	(2,1,'administration'),
	(3,1,'billing'),
	(4,1,'pharmacy'),
	(5,1,'physician_scheduler'),
	(6,1,'patient_records'),
	(7,1,'equipment');

/*!40000 ALTER TABLE `AccessDescription` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table AppointmentType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AppointmentType`;

CREATE TABLE `AppointmentType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `AppointmentType` WRITE;
/*!40000 ALTER TABLE `AppointmentType` DISABLE KEYS */;

INSERT INTO `AppointmentType` (`ID`, `Description`)
VALUES
	(1,'Annual Check up'),
	(2,'Perscription Fill up'),
	(3,'For Body Check'),
	(4,'Review'),
	(5,'Lab Test');

/*!40000 ALTER TABLE `AppointmentType` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Billing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Billing`;

CREATE TABLE `Billing` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `InsuranceCarrierID` int(11) NOT NULL,
  `Notes` int(11) NOT NULL,
  `DateFirstInvoice` int(11) NOT NULL,
  `DateLastInvoice` varchar(1000) NOT NULL,
  `DatePaid` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `InsuranceCarrierID` (`InsuranceCarrierID`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`InsuranceCarrierID`) REFERENCES `InsuranceCarrier` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Billing` WRITE;
/*!40000 ALTER TABLE `Billing` DISABLE KEYS */;

INSERT INTO `Billing` (`ID`, `InsuranceCarrierID`, `Notes`, `DateFirstInvoice`, `DateLastInvoice`, `DatePaid`)
VALUES
	(1,1,0,0,'2012-10-27 21:16:42',2012),
	(6,1,0,0,'0.000331345261431411',2012),
	(8,4,0,0,'2012-10-27 21:21:29',2012),
	(9,6,0,0,'0.000108047367793240',2012),
	(10,8,0,0,'0.000108047367793240',2012);

/*!40000 ALTER TABLE `Billing` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CarrierStatus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CarrierStatus`;

CREATE TABLE `CarrierStatus` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `CarrierStatus` WRITE;
/*!40000 ALTER TABLE `CarrierStatus` DISABLE KEYS */;

INSERT INTO `CarrierStatus` (`ID`, `Description`)
VALUES
	(1,'Active'),
	(2,'Inactive');

/*!40000 ALTER TABLE `CarrierStatus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Employee`;

CREATE TABLE `Employee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NameFirst` varchar(200) NOT NULL,
  `NameLast` varchar(200) NOT NULL,
  `EmployeeTypeID` int(11) NOT NULL,
  `SubEmployeeTypeID` int(11) DEFAULT NULL,
  `WorkDayStart` time NOT NULL,
  `WorkDayEnd` time DEFAULT NULL,
  `WorkDays` varchar(11) NOT NULL DEFAULT '',
  `PhoneHome` varchar(200) DEFAULT NULL,
  `PhoneCell` varchar(200) NOT NULL,
  `PhonePager` varchar(200) DEFAULT NULL,
  `ChangeByID` int(11) DEFAULT NULL,
  `ChangeDate` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `EmployeeTypeID` (`EmployeeTypeID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`EmployeeTypeID`) REFERENCES `EmployeeType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;

INSERT INTO `Employee` (`ID`, `NameFirst`, `NameLast`, `EmployeeTypeID`, `SubEmployeeTypeID`, `WorkDayStart`, `WorkDayEnd`, `WorkDays`, `PhoneHome`, `PhoneCell`, `PhonePager`, `ChangeByID`, `ChangeDate`)
VALUES
	(1,'Hal','Kubes',1,NULL,'09:00:00','18:00:00','MTWThF','55555555','6666666666','7777777777',1,2012),
	(2,'Raphael','Oliff',2,NULL,'09:00:00','18:00:00','MTWThF','1111111111','2222222222','3333333333',1,2012),
	(3,'Ali','McClour',3,NULL,'07:00:00','16:00:00','TWThFS','0000000000','8889990912','1234567890',1,2012),
	(4,'Hal','Werblow',4,NULL,'09:00:00','18:00:00','WThFSSu','0987656789','3245867932','98734510976',1,2012),
	(5,'Kendrick','Stirgus',5,NULL,'09:00:00','18:00:00','WThFSSu','0984356789','3223467932','09875510976',1,2012),
	(6,'Fidel','Ferg',8,NULL,'00:00:00','18:00:00','MTThF','0984356789','3223467932','09875510976',1,2012),
	(8,'Dane','Deloria',8,1,'09:00:00','18:00:00','MTThF','0987654321','8760354367',NULL,1,2012),
	(9,'Elwood','Arra',8,1,'07:00:00','18:00:00','TWThFS','8758492301','9876543281',NULL,1,2012),
	(10,'Thaddeus','Senate',8,NULL,'09:00:00','18:00:00','MTWThF','6540983746','1823459876',NULL,1,2012),
	(11,'Jeffry','Schluneger',8,4,'07:00:00','18:00:00','MTWThF','2347651234','',NULL,1,2012),
	(12,'Cliff','Crise',8,5,'09:00:00','16:00:00','WThFSSu','8769807656','',NULL,1,2012),
	(13,'Gisel','Barret',8,2,'07:00:00','16:00:00','WThFSSu','0986784657','',NULL,1,2012),
	(14,'Sandra ','Morales',8,NULL,'07:00:00','18:00:00','TWThFS','9879349992','7485842939',NULL,1,2012),
	(16,'Ernesto','Ruiz',9,NULL,'09:00:00','16:00:00','WThFSSu','8764532321','1234565443',NULL,1,2012),
	(20,'Melissa','Saenz',10,9,'09:00:00','12:00:00','TWThFS','5439821234','',NULL,1,2012),
	(21,'Carolina','Cardoso',11,NULL,'07:00:00','12:00:00','MTWThF','9875543633','',NULL,1,2012),
	(22,'Beatriz',' Rodriguez',9,11,'07:00:00','12:00:00','WThFSSu','4567891223','1234356896',NULL,1,2012);

/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table EmployeeType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EmployeeType`;

CREATE TABLE `EmployeeType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  `ChangeByID` int(11) DEFAULT NULL,
  `ChangeDate` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `EmployeeType` WRITE;
/*!40000 ALTER TABLE `EmployeeType` DISABLE KEYS */;

INSERT INTO `EmployeeType` (`ID`, `Description`, `ChangeByID`, `ChangeDate`)
VALUES
	(1,'Physician - Primary Care',1,2012),
	(2,'Physician - Dermatology',1,2012),
	(3,'Physician - Emergency Medicine',1,2012),
	(4,'Physician - Internal Medicine',1,2012),
	(5,'Physician - Anesthesiology',1,2012),
	(6,'Physician - Obstetrics and Gynecology',1,2012),
	(7,'Physician - Pediatrics',1,2012),
	(8,'Nurse',1,2012),
	(9,'Lab Techinician',1,2012),
	(10,'Assistant',1,2012),
	(11,'Pharmacy Technician',1,2012);

/*!40000 ALTER TABLE `EmployeeType` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table InsuranceCarrier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `InsuranceCarrier`;

CREATE TABLE `InsuranceCarrier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  `Address` varchar(1000) NOT NULL,
  `Phone` int(11) NOT NULL,
  `CarrierstatusID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CarrierstatusID` (`CarrierstatusID`),
  CONSTRAINT `insurancecarrier_ibfk_1` FOREIGN KEY (`CarrierstatusID`) REFERENCES `CarrierStatus` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `InsuranceCarrier` WRITE;
/*!40000 ALTER TABLE `InsuranceCarrier` DISABLE KEYS */;

INSERT INTO `InsuranceCarrier` (`ID`, `Description`, `Address`, `Phone`, `CarrierstatusID`)
VALUES
	(1,'Insurance Company','675 San Diego,Ca,93478',2147483647,1),
	(4,'Insurance Company','675 San Diego,Ca,93478',2147483647,1),
	(6,'Insurance Company','732 El Cajon,Ca,93478',2147483647,2),
	(7,'Insurance Company','121 National City,Ca,95432',800342568,2),
	(8,'Insurance Company','675 San Diego,Ca,93478',2147483647,1);

/*!40000 ALTER TABLE `InsuranceCarrier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table LabTest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LabTest`;

CREATE TABLE `LabTest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  `TestResultDescription` varchar(1000) NOT NULL,
  `NormalTestResult` varchar(1000) NOT NULL,
  `UrgencyTestResult` varchar(1000) NOT NULL,
  `ChangedByID` int(11) NOT NULL,
  `ChangeDate` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `LabTest` WRITE;
/*!40000 ALTER TABLE `LabTest` DISABLE KEYS */;

INSERT INTO `LabTest` (`ID`, `Description`, `TestResultDescription`, `NormalTestResult`, `UrgencyTestResult`, `ChangedByID`, `ChangeDate`)
VALUES
	(1,'Blood Test','The blood is infected with Some bactiria','Ph = 7 in normal case','Whene the Ph = 5',2,2012),
	(2,'Urine test','The Test is infected with Some bactiria','Should be 75% ','Whene the test 50%',2,2012),
	(3,'Electrolytes Test','Its positive','The Normal function should have normal function','When the test pass the 188/12',2,2012),
	(4,'BMP (Basic Metabolic Panel)','Negative','releated with Ph = 7 in normal case','Whene the Ph = 5',2,2012),
	(5,'Chloride Test','Negative','releated with Ph = 7 in normal case','Whene the Ph = 5',2,2012);

/*!40000 ALTER TABLE `LabTest` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Medication
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Medication`;

CREATE TABLE `Medication` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `RecommendedDosage` varchar(200) DEFAULT NULL,
  `SideEffects` varchar(200) DEFAULT NULL,
  `RecommendedFrequency` varchar(300) DEFAULT NULL,
  `ChangedByID` int(11) DEFAULT NULL,
  `ChangeDate` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Medication` WRITE;
/*!40000 ALTER TABLE `Medication` DISABLE KEYS */;

INSERT INTO `Medication` (`ID`, `Name`, `Description`, `RecommendedDosage`, `SideEffects`, `RecommendedFrequency`, `ChangedByID`, `ChangeDate`)
VALUES
	(1,'Advil',' For cold ',NULL,'Body Alirgic','Twice a day',2,2012),
	(2,'Tylinol','Pain Relief ',NULL,'No side Effects','Three times a day',2,2012),
	(3,'Dayquil','For flue',NULL,'No side Effects','Two times a day',2,2012),
	(4,'Amoxicillin','For infection Antibiotic',NULL,'No side Effects','Three times a day',2,2012),
	(5,'Ampcillin','For infection Antibiotic',NULL,'Allirgy','Three times a day',2,2012);

/*!40000 ALTER TABLE `Medication` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table MedicationAversionList
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MedicationAversionList`;

CREATE TABLE `MedicationAversionList` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MedicationID` int(11) NOT NULL,
  `SubMedicationID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MedicationID` (`MedicationID`),
  CONSTRAINT `medicationaversionlist_ibfk_1` FOREIGN KEY (`MedicationID`) REFERENCES `Medication` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `MedicationAversionList` WRITE;
/*!40000 ALTER TABLE `MedicationAversionList` DISABLE KEYS */;

INSERT INTO `MedicationAversionList` (`ID`, `MedicationID`, `SubMedicationID`)
VALUES
	(1,2,3),
	(2,3,4),
	(3,4,5),
	(4,4,2),
	(5,3,5);

/*!40000 ALTER TABLE `MedicationAversionList` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Patient
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Patient`;

CREATE TABLE `Patient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NameFirst` varchar(200) NOT NULL,
  `NameLast` varchar(200) NOT NULL,
  `NameMiddle` varchar(200) DEFAULT '',
  `Address` varchar(1000) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `InsuranceCarrierID` int(11) DEFAULT NULL,
  `DateOfBirth` int(11) NOT NULL,
  `Gender` int(1) NOT NULL,
  `PrimaryCarePhysician` varchar(400) DEFAULT '',
  `MedicationListID` int(11) DEFAULT NULL,
  `AppointmentsID` int(11) DEFAULT NULL,
  `ChangeByID` int(11) NOT NULL,
  `ChangeDate` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;

INSERT INTO `Patient` (`ID`, `NameFirst`, `NameLast`, `NameMiddle`, `Address`, `Phone`, `InsuranceCarrierID`, `DateOfBirth`, `Gender`, `PrimaryCarePhysician`, `MedicationListID`, `AppointmentsID`, `ChangeByID`, `ChangeDate`)
VALUES
	(1,'Jamie','Hagget','Marcie','123 SDSU Way, San Diego, CA','6197508086',NULL,2361600,1,'',NULL,NULL,8,1353369302),
	(2,'Tyler','','Moskovic','123 UCSD Way, San Diego, CA','6666666666',NULL,1353260907,0,'sldjnf',NULL,NULL,1,2012),
	(3,'Lonnie','Luczynski',NULL,'123 BeneTrac Way, San Diego, CA','7777777777',NULL,1353260907,1,'',NULL,NULL,1,2012),
	(4,'Ted','McAllen','Douglas','123 Tijuana Way, San Diego, CA','8888888888',NULL,2147483647,1,'Dr. Frankenstein',NULL,NULL,1,2012),
	(5,'Tameka','Wasmund',NULL,'123 Chula Vista Way, San Diego, CA','9999999999',NULL,1353260907,1,'Dr. Bley',NULL,NULL,1,2012),
	(6,'Carola','Saka','y','345 Jamacha rd APT #6,Ca,92020','6195743323',0,1353260907,0,'Max soon',NULL,NULL,2,2012),
	(7,'Adam','Koona','r','225 Grove rd APT #6,Ca,92320','61943232',1,1353260907,1,'John moon',NULL,NULL,2,2012),
	(8,'John','noor','j','322 Jamacha rd APT #6,Ca,92020','6197764345',0,1353260907,0,'jack box',NULL,NULL,2,2012),
	(9,'Madlen','kaza','y','278 Rancho,Ca,92019','6195743323',0,1353260907,1,'Noon Soon',NULL,NULL,2,2012),
	(10,'Sona','Rahema','D','67 Jamacha rd APT #10,Ca,92020','6195743323',0,1353260907,0,'Nawal jon',NULL,NULL,2,2012),
	(11,'Aaron','Smith',NULL,'sdfkjb','6197508086',NULL,6,1,NULL,NULL,NULL,0,NULL),
	(12,'Aaron','Smith',NULL,'sdfkjb','6197508086',NULL,6,1,NULL,NULL,NULL,0,NULL),
	(13,'Tyler','Moskovic','','lerkjfgn','6197508086',NULL,6,0,'',NULL,NULL,0,NULL),
	(14,'test','test','','11741lksdnf','6197508086',NULL,6,0,'',NULL,NULL,0,NULL),
	(15,'test','km','','sdf','6197508086',0,0,0,'km',NULL,NULL,0,NULL);

/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PatientEncounter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PatientEncounter`;

CREATE TABLE `PatientEncounter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Encounterdate` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `PatientComplaints` varchar(1000) DEFAULT NULL,
  `VitalSigns` varchar(1000) NOT NULL,
  `PractitionerNotes` varchar(1000) DEFAULT NULL,
  `Diagnosis` varchar(1000) NOT NULL,
  `ReferralToSpecialist` varchar(1000) DEFAULT NULL,
  `RecommendedFollowUp` varchar(1000) DEFAULT NULL,
  `PatientID` int(11) NOT NULL,
  `LabOrderID` int(11) NOT NULL,
  `PharmacyOrderID` int(11) NOT NULL,
  `ChangedByID` int(11) NOT NULL,
  `ChangeDate` int(11) NOT NULL,
  `PatientScheduleID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`),
  KEY `PatientScheduleID` (`PatientScheduleID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `patientencounter_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  CONSTRAINT `patientencounter_ibfk_2` FOREIGN KEY (`PatientScheduleID`) REFERENCES `PatientSchedule` (`ID`),
  CONSTRAINT `patientencounter_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PatientHistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PatientHistory`;

CREATE TABLE `PatientHistory` (
  `HistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `NameFirst` varchar(200) NOT NULL,
  `NameLast` varchar(200) NOT NULL,
  `NameMiddle` varchar(200) DEFAULT NULL,
  `Address` varchar(1000) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `InsuranceCarrierID` int(11) DEFAULT NULL,
  `DateOfBirth` int(11) NOT NULL,
  `Gender` int(1) NOT NULL,
  `PrimaryCarePhysician` varchar(400) DEFAULT NULL,
  `MedicationListID` int(11) DEFAULT NULL,
  `AppointmentsID` int(11) DEFAULT NULL,
  `ChangeByID` int(11) NOT NULL,
  `ChangeDate` int(11) DEFAULT NULL,
  PRIMARY KEY (`HistoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PatientLabTest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PatientLabTest`;

CREATE TABLE `PatientLabTest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LabTestID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `PatientEncounterID` int(11) NOT NULL,
  `Testdate` int(11) NOT NULL,
  `PerformedByEmployeeID` int(11) NOT NULL,
  `TestResults` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `LabTestID` (`LabTestID`),
  CONSTRAINT `patientlabtest_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  CONSTRAINT `patientlabtest_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`),
  CONSTRAINT `patientlabtest_ibfk_3` FOREIGN KEY (`LabTestID`) REFERENCES `LabTest` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PatientMedication
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PatientMedication`;

CREATE TABLE `PatientMedication` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `MedicationId` int(11) NOT NULL,
  `DataPrescribed` int(11) NOT NULL,
  `PrescribedByID` int(11) NOT NULL,
  `ChangedByID` int(11) NOT NULL,
  `ChangeDate` int(11) NOT NULL,
  `PatientEncounterID` int(11) NOT NULL,
  `DateEnd` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `Dosage` int(200) NOT NULL,
  `Frequency` int(11) NOT NULL,
  `LastFiledDate` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`),
  KEY `MedicationId` (`MedicationId`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `patientmedication_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  CONSTRAINT `patientmedication_ibfk_2` FOREIGN KEY (`MedicationId`) REFERENCES `Medication` (`ID`),
  CONSTRAINT `patientmedication_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PatientSchedule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PatientSchedule`;

CREATE TABLE `PatientSchedule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `ScheduleDateTime` int(11) NOT NULL,
  `AppointmentTypeID` int(11) NOT NULL,
  `ChangedByID` int(11) NOT NULL,
  `ChangeDate` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`),
  KEY `AppointmentTypeID` (`AppointmentTypeID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `patientschedule_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  CONSTRAINT `patientschedule_ibfk_2` FOREIGN KEY (`AppointmentTypeID`) REFERENCES `AppointmentType` (`ID`),
  CONSTRAINT `patientschedule_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Service
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Service`;

CREATE TABLE `Service` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `PatientEncounterID` int(11) NOT NULL,
  `Description` int(11) NOT NULL,
  `PatientLabTestID` int(11) NOT NULL,
  `PatientMedicationID` int(11) NOT NULL,
  `Cost` int(11) NOT NULL,
  `Date` int(11) NOT NULL,
  `BillingID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`),
  KEY `PatientMedicationID` (`PatientMedicationID`),
  KEY `PatientEncounterID` (`PatientEncounterID`),
  KEY `PatientLabTestID` (`PatientLabTestID`),
  KEY `BillingID` (`BillingID`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  CONSTRAINT `service_ibfk_2` FOREIGN KEY (`PatientMedicationID`) REFERENCES `PatientMedication` (`ID`),
  CONSTRAINT `service_ibfk_3` FOREIGN KEY (`PatientEncounterID`) REFERENCES `PatientEncounter` (`ID`),
  CONSTRAINT `service_ibfk_4` FOREIGN KEY (`PatientLabTestID`) REFERENCES `PatientLabTest` (`ID`),
  CONSTRAINT `service_ibfk_5` FOREIGN KEY (`BillingID`) REFERENCES `Billing` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(200) NOT NULL,
  `JobTitle` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `UserTypeID` int(11) NOT NULL,
  `EmployeeNumber` varchar(10) DEFAULT NULL,
  `ChangeByID` int(11) NOT NULL,
  `ChangeDate` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserTypeID` (`UserTypeID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`UserTypeID`) REFERENCES `UserType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`ID`, `UserName`, `JobTitle`, `Password`, `UserTypeID`, `EmployeeNumber`, `ChangeByID`, `ChangeDate`)
VALUES
	(1,'fausto','Administrator','pnPqZhA3bgIqxZFR5MIF8aZfxhOCuVlABgNjKpuCWdM=',7,'1',34,0),
	(2,'julian','Administrator','123',7,'12',1,0),
	(3,'test_cheifofmedicine','Cheif Of Medicine','5f4dcc3b5aa765d61d8327deb882cf99',1,'14',1,0),
	(6,'test_physician','Doctor','5f4dcc3b5aa765d61d8327deb882cf99',2,NULL,0,0),
	(7,'test_nurse','Nurse','5f4dcc3b5aa765d61d8327deb882cf99',3,NULL,0,0),
	(8,'test_pharmacist','Pharmacist','5f4dcc3b5aa765d61d8327deb882cf99',4,NULL,0,0),
	(9,'test_pharmacistassistant','Pharmacist\'s Assistant','5f4dcc3b5aa765d61d8327deb882cf99',5,NULL,0,0),
	(11,'test_humanresources','Human Resources','5f4dcc3b5aa765d61d8327deb882cf99',6,NULL,0,0);

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table UserHistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserHistory`;

CREATE TABLE `UserHistory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(200) NOT NULL,
  `JobTitle` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `UserTypeID` int(11) NOT NULL,
  `EmployeeNumber` varchar(10) DEFAULT NULL,
  `ChangeByID` int(11) NOT NULL,
  `ChangeDate` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserTypeID` (`UserTypeID`),
  CONSTRAINT `UserHistory_ibfk_1` FOREIGN KEY (`UserTypeID`) REFERENCES `UserType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `UserHistory` WRITE;
/*!40000 ALTER TABLE `UserHistory` DISABLE KEYS */;

INSERT INTO `UserHistory` (`ID`, `UserName`, `JobTitle`, `Password`, `UserTypeID`, `EmployeeNumber`, `ChangeByID`, `ChangeDate`)
VALUES
	(1,'fausto','Administrator','12345',1,'1',2,2012),
	(2,'fausto','Administrator','alex',1,'1',2,2012);

/*!40000 ALTER TABLE `UserHistory` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table UserType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserType`;

CREATE TABLE `UserType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Access` int(11) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `UserType` WRITE;
/*!40000 ALTER TABLE `UserType` DISABLE KEYS */;

INSERT INTO `UserType` (`ID`, `Access`, `Description`)
VALUES
	(1,1,'Cheif Of Medicine'),
	(2,2,'Physician'),
	(3,3,'Nurse'),
	(4,4,'Pharmacist'),
	(5,5,'Pharmacist Assistant'),
	(6,6,'Human Resources'),
	(7,7,'General Administrator'),
	(8,8,'Physician Assistant');

/*!40000 ALTER TABLE `UserType` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
