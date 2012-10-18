

-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 17, 2012 at 11:37 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

CREATE Database HealthTrak;

Use HealthTrak;


SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `HealthTrak`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessdescription`
--

CREATE TABLE IF NOT EXISTS `AccessDescription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AccessType` int(11) NOT NULL,
  `Feature` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `accessdescription`
--


-- --------------------------------------------------------

--
-- Table structure for table `appointmenttype`
--

CREATE TABLE IF NOT EXISTS `AppointmentType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `appointmenttype`
--


-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE IF NOT EXISTS `Billing` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `InsuranceCarrierID` int(11) NOT NULL,
  `Notes` int(11) NOT NULL,
  `DateFirstInvoice` datetime NOT NULL,
  `DateLastInvoice` varchar(1000) NOT NULL,
  `DatePaid` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `InsuranceCarrierID` (`InsuranceCarrierID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `billing`
--


-- --------------------------------------------------------

--
-- Table structure for table `carrierstatus`
--

CREATE TABLE IF NOT EXISTS `CarrierStatus` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `carrierstatus`
--


-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `Employee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NameFirst` varchar(200) NOT NULL,
  `NameLast` varchar(200) NOT NULL,
  `EmployeeTypeID` int(11) NOT NULL,
  `WorkDayStart` datetime NOT NULL,
  `WorkDayEnd` datetime DEFAULT NULL,
  `ChangeByID` int(11) NOT NULL,
  `ChangeDate` datetime NOT NULL,
  `WorkDays` int(11) NOT NULL,
  `PhoneHome` varchar(200) DEFAULT NULL,
  `PhoneCell` varchar(200) NOT NULL,
  `PhonePager` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `EmployeeTypeID` (`EmployeeTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `employee`
--


-- --------------------------------------------------------

--
-- Table structure for table `employeetype`
--

CREATE TABLE IF NOT EXISTS `EmployeeType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  `SubMedicationID` int(11) NOT NULL,
  `ChangeDate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `employeetype`
--


-- --------------------------------------------------------

--
-- Table structure for table `insurancecarrier`
--

CREATE TABLE IF NOT EXISTS `InsuranceCarrier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  `Address` varchar(1000) NOT NULL,
  `Phone` int(11) NOT NULL,
  `CarrierstatusID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CarrierstatusID` (`CarrierstatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `insurancecarrier`
--


-- --------------------------------------------------------

--
-- Table structure for table `labtest`
--

CREATE TABLE IF NOT EXISTS `LabTest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  `TestResultDescription` varchar(1000) NOT NULL,
  `NormalTestResult` varchar(1000) NOT NULL,
  `UrgencyTestResult` varchar(1000) NOT NULL,
  `ChangedByID` int(11) NOT NULL,
  `ChangeDate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `labtest`
--


-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE IF NOT EXISTS `Medication` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` int(11) NOT NULL,
  `ChangedByID` int(11) NOT NULL,
  `ChangeDate` datetime NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `RecommendedDosage` varchar(200) DEFAULT NULL,
  `SideEffects` varchar(200) DEFAULT NULL,
  `RecommendedFrequency` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `medication`
--


-- --------------------------------------------------------

--
-- Table structure for table `medicationaversionlist`
--

CREATE TABLE IF NOT EXISTS `MedicationAversionList` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MedicationID` int(11) NOT NULL,
  `SubMedicationID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MedicationID` (`MedicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `medicationaversionlist`
--


-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `Patient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Layer` int(11) DEFAULT NULL,
  `NameFirst` varchar(200) NOT NULL,
  `NameLast` varchar(200) NOT NULL,
  `NameMiddle` varchar(200) DEFAULT NULL,
  `Address` varchar(1000) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `InsuranceCarrierID` int(11) DEFAULT NULL,
  `DateOfBirth` datetime NOT NULL,
  `Gender` bit(1) NOT NULL,
  `PrimaryCarePhysician` varchar(400) DEFAULT NULL,
  `MedicationListID` int(11) DEFAULT NULL,
  `AppointmentsID` int(11) DEFAULT NULL,
  `ChangeByID` int(11) NOT NULL,
  `ChangeDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `patient`
--


-- --------------------------------------------------------

--
-- Table structure for table `patientencounter`
--

CREATE TABLE IF NOT EXISTS `PatientEncounter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Encounterdate` datetime NOT NULL,
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
  `ChangeDate` datetime NOT NULL,
  `PatientScheduleID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`),
  KEY `PatientScheduleID` (`PatientScheduleID`),
  KEY `EmployeeID` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `patientencounter`
--


-- --------------------------------------------------------

--
-- Table structure for table `patientlabtest`
--

CREATE TABLE IF NOT EXISTS `PatientLabTest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LabTestID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `PatientEncounterID` int(11) NOT NULL,
  `Testdate` datetime NOT NULL,
  `PerformedByEmployeeID` int(11) NOT NULL,
  `TestResults` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `LabTestID` (`LabTestID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `patientlabtest`
--


-- --------------------------------------------------------

--
-- Table structure for table `patientmedication`
--

CREATE TABLE IF NOT EXISTS `PatientMedication` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `MedicationId` int(11) NOT NULL,
  `DataPrescribed` datetime NOT NULL,
  `PrescribedByID` int(11) NOT NULL,
  `ChangedByID` int(11) NOT NULL,
  `ChangeDate` datetime NOT NULL,
  `PatientEncounterID` int(11) NOT NULL,
  `DateEnd` datetime NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `Dosage` varchar(200) NOT NULL,
  `Frequency` int(11) NOT NULL,
  `LastFiledDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`),
  KEY `MedicationId` (`MedicationId`),
  KEY `EmployeeID` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `patientmedication`
--


-- --------------------------------------------------------

--
-- Table structure for table `patientschedule`
--

CREATE TABLE IF NOT EXISTS `PatientSchedule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `ScheduleDateTime` datetime NOT NULL,
  `AppointmentTypeID` int(11) NOT NULL,
  `ChangedByID` int(11) NOT NULL,
  `ChangeDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`),
  KEY `AppointmentTypeID` (`AppointmentTypeID`),
  KEY `EmployeeID` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `patientschedule`
--


-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `Service` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `PatientEncounterID` int(11) NOT NULL,
  `Description` int(11) NOT NULL,
  `PatientLabTestID` int(11) NOT NULL,
  `PatientMedicationID` int(11) NOT NULL,
  `Cost` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `BillingID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`),
  KEY `PatientMedicationID` (`PatientMedicationID`),
  KEY `PatientEncounterID` (`PatientEncounterID`),
  KEY `PatientLabTestID` (`PatientLabTestID`),
  KEY `BillingID` (`BillingID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `service`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `User` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(200) NOT NULL,
  `JobTitle` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `UserTypeID` int(11) NOT NULL,
  `EmployeeNumber` varchar(10) DEFAULT NULL,
  `ChangeByID` int(11) NOT NULL,
  `ChangeDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserTypeID` (`UserTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user`
--


-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE IF NOT EXISTS `UserType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Access` int(11) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `usertype`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing`
--
ALTER TABLE `Billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`InsuranceCarrierID`) REFERENCES `InsuranceCarrier` (`ID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`EmployeeTypeID`) REFERENCES `EmployeeType` (`ID`);

--
-- Constraints for table `insurancecarrier`
--
ALTER TABLE `InsuranceCarrier`
  ADD CONSTRAINT `insurancecarrier_ibfk_1` FOREIGN KEY (`CarrierstatusID`) REFERENCES `CarrierStatus` (`ID`);

--
-- Constraints for table `medicationaversionlist`
--
ALTER TABLE `MedicationAversionList`
  ADD CONSTRAINT `medicationaversionlist_ibfk_1` FOREIGN KEY (`MedicationID`) REFERENCES `Medication` (`ID`);

--
-- Constraints for table `patientencounter`
--
ALTER TABLE `PatientEncounter`
  ADD CONSTRAINT `patientencounter_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`),
  ADD CONSTRAINT `patientencounter_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  ADD CONSTRAINT `patientencounter_ibfk_2` FOREIGN KEY (`PatientScheduleID`) REFERENCES `PatientSchedule` (`ID`);

--
-- Constraints for table `patientlabtest`
--
ALTER TABLE `PatientLabTest`
  ADD CONSTRAINT `patientlabtest_ibfk_3` FOREIGN KEY (`LabTestID`) REFERENCES `LabTest` (`ID`),
  ADD CONSTRAINT `patientlabtest_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  ADD CONSTRAINT `patientlabtest_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`);

--
-- Constraints for table `patientmedication`
--
ALTER TABLE `PatientMedication`
  ADD CONSTRAINT `patientmedication_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`),
  ADD CONSTRAINT `patientmedication_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  ADD CONSTRAINT `patientmedication_ibfk_2` FOREIGN KEY (`MedicationId`) REFERENCES `Medication` (`ID`);

--
-- Constraints for table `patientschedule`
--
ALTER TABLE `PatientSchedule`
  ADD CONSTRAINT `patientschedule_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`),
  ADD CONSTRAINT `patientschedule_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  ADD CONSTRAINT `patientschedule_ibfk_2` FOREIGN KEY (`AppointmentTypeID`) REFERENCES `AppointmentType` (`ID`);

--
-- Constraints for table `service`
--
ALTER TABLE `Service`
  ADD CONSTRAINT `service_ibfk_5` FOREIGN KEY (`BillingID`) REFERENCES `Billing` (`ID`),
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`PatientMedicationID`) REFERENCES `PatientMedication` (`ID`),
  ADD CONSTRAINT `service_ibfk_3` FOREIGN KEY (`PatientEncounterID`) REFERENCES `PatientEncounter` (`ID`),
  ADD CONSTRAINT `service_ibfk_4` FOREIGN KEY (`PatientLabTestID`) REFERENCES `PatientLabTest` (`ID`);

--
-- Constraints for table `user`
--
ALTER TABLE `User`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`UserTypeID`) REFERENCES `UserType` (`ID`);
