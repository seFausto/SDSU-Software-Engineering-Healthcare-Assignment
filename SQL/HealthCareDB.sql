-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 30, 2012 at 03:06 AM
-- Server version: 5.5.25
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE DATABASE HealthTrak;

USE HealthTrak;
--
-- Database: `HealthTrak`
--

-- --------------------------------------------------------

--
-- Table structure for table `AccessDescription`
--

CREATE TABLE `AccessDescription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AccessType` int(11) NOT NULL,
  `Feature` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `AppointmentType`
--

CREATE TABLE `AppointmentType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `AppointmentType`
--

INSERT INTO `AppointmentType` (`ID`, `Description`) VALUES
(1, 'Annual Check up'),
(2, 'Perscription Fill up'),
(3, 'For Body Check'),
(4, 'Review'),
(5, 'Lab Test');

-- --------------------------------------------------------

--
-- Table structure for table `Billing`
--

CREATE TABLE `Billing` (
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

INSERT INTO `Billing` (`ID`, `InsuranceCarrierID`, `Notes`, `DateFirstInvoice`, `DateLastInvoice`, `DatePaid`) VALUES
(1, 1, 0, '0000-00-00 00:00:00', '2012-10-27 21:16:42', '2012-10-27 21:16:42'),
(6, 1, 0, '0000-00-00 00:00:00', '0.000331345261431411', '2012-10-27 21:19:48'),
(8, 4, 0, '0000-00-00 00:00:00', '2012-10-27 21:21:29', '2012-10-27 21:21:29'),
(9, 6, 0, '0000-00-00 00:00:00', '0.000108047367793240', '2012-10-27 21:22:18'),
(10, 8, 0, '0000-00-00 00:00:00', '0.000108047367793240', '2012-10-27 21:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `CarrierStatus`
--

CREATE TABLE `CarrierStatus` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `carrierstatus`
--

INSERT INTO `CarrierStatus` (`ID`, `Description`) VALUES
(1, 'Active'),
(2, 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

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
  `ChangeDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `EmployeeTypeID` (`EmployeeTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`ID`, `NameFirst`, `NameLast`, `EmployeeTypeID`, `SubEmployeeTypeID`, `WorkDayStart`, `WorkDayEnd`, `WorkDays`, `PhoneHome`, `PhoneCell`, `PhonePager`, `ChangeByID`, `ChangeDate`) VALUES
(1, 'Hal', 'Kubes', 1, NULL, '09:00:00', '18:00:00', 'MTWThF', '55555555', '6666666666', '7777777777', 1, '2012-10-27'),
(2, 'Raphael', 'Oliff', 2, NULL, '09:00:00', '18:00:00', 'MTWThF', '1111111111', '2222222222', '3333333333', 1, '2012-10-27'),
(3, 'Ali', 'McClour', 3, NULL, '07:00:00', '16:00:00', 'TWThFS', '0000000000', '8889990912', '1234567890', 1, '2012-10-27'),
(4, 'Hal', 'Werblow', 4, NULL, '09:00:00', '18:00:00', 'WThFSSu', '0987656789', '3245867932', '98734510976', 1, '2012-10-27'),
(5, 'Kendrick', 'Stirgus', 5, NULL, '09:00:00', '18:00:00', 'WThFSSu', '0984356789', '3223467932', '09875510976', 1, '2012-10-27'),
(6, 'Fidel', 'Ferg', 8, NULL, '00:00:00', '18:00:00', 'MTThF', '0984356789', '3223467932', '09875510976', 1, '2012-10-27'),
(8, 'Dane', 'Deloria', 8, 1, '09:00:00', '18:00:00', 'MTThF', '0987654321', '8760354367', NULL, 1, '2012-10-27'),
(9, 'Elwood', 'Arra', 8, 1, '07:00:00', '18:00:00', 'TWThFS', '8758492301', '9876543281', NULL, 1, '2012-10-27'),
(10, 'Thaddeus', 'Senate', 8, NULL, '09:00:00', '18:00:00', 'MTWThF', '6540983746', '1823459876', NULL, 1, '2012-10-27'),
(11, 'Jeffry', 'Schluneger', 8, 4, '07:00:00', '18:00:00', 'MTWThF', '2347651234', '', NULL, 1, '2012-10-27'),
(12, 'Cliff', 'Crise', 8, 5, '09:00:00', '16:00:00', 'WThFSSu', '8769807656', '', NULL, 1, '2012-10-27'),
(13, 'Gisel', 'Barret', 8, 2, '07:00:00', '16:00:00', 'WThFSSu', '0986784657', '', NULL, 1, '2012-10-27'),
(14, 'Sandra ', 'Morales', 8, NULL, '07:00:00', '18:00:00', 'TWThFS', '9879349992', '7485842939', NULL, 1, '2012-10-27'),
(16, 'Ernesto', 'Ruiz', 9, NULL, '09:00:00', '16:00:00', 'WThFSSu', '8764532321', '1234565443', NULL, 1, '2012-10-27'),
(20, 'Melissa', 'Saenz', 10, 9, '09:00:00', '12:00:00', 'TWThFS', '5439821234', '', NULL, 1, '2012-10-27'),
(21, 'Carolina', 'Cardoso', 11, NULL, '07:00:00', '12:00:00', 'MTWThF', '9875543633', '', NULL, 1, '2012-10-27'),
(22, 'Beatriz', ' Rodriguez', 9, 11, '07:00:00', '12:00:00', 'WThFSSu', '4567891223', '1234356896', NULL, 1, '2012-10-27');

-- --------------------------------------------------------

--
-- Table structure for table `EmployeeType`
--

CREATE TABLE `EmployeeType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  `ChangeByID` int(11) DEFAULT NULL,
  `ChangeDate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `EmployeeType`
--

INSERT INTO `EmployeeType` (`ID`, `Description`, `ChangeByID`, `ChangeDate`) VALUES
(1, 'Physician - Primary Care', 1, '2012-10-27 14:07:49'),
(2, 'Physician - Dermatology', 1, '2012-10-27 14:07:49'),
(3, 'Physician - Emergency Medicine', 1, '2012-10-27 14:07:49'),
(4, 'Physician - Internal Medicine', 1, '2012-10-27 14:07:49'),
(5, 'Physician - Anesthesiology', 1, '2012-10-27 14:07:49'),
(6, 'Physician - Obstetrics and Gynecology', 1, '2012-10-27 14:07:49'),
(7, 'Physician - Pediatrics', 1, '2012-10-27 14:07:49'),
(8, 'Nurse', 1, '2012-10-27 14:07:49'),
(9, 'Lab Techinician', 1, '2012-10-27 14:07:49'),
(10, 'Assistant', 1, '2012-10-27 14:07:49'),
(11, 'Pharmacy Technician', 1, '2012-10-27 14:07:49');

-- --------------------------------------------------------

--
-- Table structure for table `InsuranceCarrier`
--

CREATE TABLE `InsuranceCarrier` (
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

INSERT INTO `InsuranceCarrier` (`ID`, `Description`, `Address`, `Phone`, `CarrierstatusID`) VALUES
(1, 'Insurance Company', '675 San Diego,Ca,93478', 2147483647, 1),
(4, 'Insurance Company', '675 San Diego,Ca,93478', 2147483647, 1),
(6, 'Insurance Company', '732 El Cajon,Ca,93478', 2147483647, 2),
(7, 'Insurance Company', '121 National City,Ca,95432', 800342568, 2),
(8, 'Insurance Company', '675 San Diego,Ca,93478', 2147483647, 1);

-- --------------------------------------------------------

--
-- Table structure for table `LabTest`
--

CREATE TABLE `LabTest` (
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

INSERT INTO `LabTest` (`ID`, `Description`, `TestResultDescription`, `NormalTestResult`, `UrgencyTestResult`, `ChangedByID`, `ChangeDate`) VALUES
(1, 'Blood Test', 'The blood is infected with Some bactiria', 'Ph = 7 in normal case', 'Whene the Ph = 5', 2, '2012-10-27 15:14:29'),
(2, 'Urine test', 'The Test is infected with Some bactiria', 'Should be 75% ', 'Whene the test 50%', 2, '2012-10-27 15:19:32'),
(3, 'Electrolytes Test', 'Its positive', 'The Normal function should have normal function', 'When the test pass the 188/12', 2, '2012-10-27 15:27:57'),
(4, 'BMP (Basic Metabolic Panel)', 'Negative', 'releated with Ph = 7 in normal case', 'Whene the Ph = 5', 2, '2012-10-27 15:29:58'),
(5, 'Chloride Test', 'Negative', 'releated with Ph = 7 in normal case', 'Whene the Ph = 5', 2, '2012-10-27 15:31:03');

-- --------------------------------------------------------

--
-- Table structure for table `Medication`
--

CREATE TABLE `Medication` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `RecommendedDosage` varchar(200) DEFAULT NULL,
  `SideEffects` varchar(200) DEFAULT NULL,
  `RecommendedFrequency` varchar(300) DEFAULT NULL,
  `ChangedByID` int(11) DEFAULT NULL,
  `ChangeDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `medication`
--

INSERT INTO `Medication` (`ID`, `Name`, `Description`, `RecommendedDosage`, `SideEffects`, `RecommendedFrequency`, `ChangedByID`, `ChangeDate`) VALUES
(1, 'Advil', ' For cold ', NULL, 'Body Alirgic', 'Twice a day', 2, '2012-10-27'),
(2, 'Tylinol', 'Pain Relief ', NULL, 'No side Effects', 'Three times a day', 2, '2012-10-27'),
(3, 'Dayquil', 'For flue', NULL, 'No side Effects', 'Two times a day', 2, '2012-10-27'),
(4, 'Amoxicillin', 'For infection Antibiotic', NULL, 'No side Effects', 'Three times a day', 2, '2012-10-27'),
(5, 'Ampcillin', 'For infection Antibiotic', NULL, 'Allirgy', 'Three times a day', 2, '2012-10-27');

-- --------------------------------------------------------

--
-- Table structure for table `MedicationAversionList`
--

CREATE TABLE `MedicationAversionList` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MedicationID` int(11) NOT NULL,
  `SubMedicationID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MedicationID` (`MedicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `medicationaversionlist`
--

INSERT INTO `MedicationAversionList` (`ID`, `MedicationID`, `SubMedicationID`) VALUES
(1, 2, 3),
(2, 3, 4),
(3, 4, 5),
(4, 4, 2),
(5, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Patient`
--

CREATE TABLE `Patient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `Patient`
--

INSERT INTO `Patient` (`ID`, `NameFirst`, `NameLast`, `NameMiddle`, `Address`, `Phone`, `InsuranceCarrierID`, `DateOfBirth`, `Gender`, `PrimaryCarePhysician`, `MedicationListID`, `AppointmentsID`, `ChangeByID`, `ChangeDate`) VALUES
(1, 'Jamie', 'Hagget', 'Marcie', '123 SDSU Way, San Diego, CA', '5555555555', NULL, '1985-05-17 00:00:00', '0', '', NULL, NULL, 1, '2012-10-27 12:24:06'),
(2, 'Jessie', 'Cagney', 'Rita', '123 UCSD Way, San Diego, CA', '6666666666', NULL, '1981-11-04 00:00:00', '0', 'Dr. Lewis', NULL, NULL, 1, '2012-10-27 12:24:06'),
(3, 'Lonnie', 'Luczynski', NULL, '123 BeneTrac Way, San Diego, CA', '7777777777', NULL, '1990-04-05 00:00:00', '0', '', NULL, NULL, 1, '2012-10-27 12:24:06'),
(4, 'Ted', 'McAllen', 'Douglas', '123 Tijuana Way, San Diego, CA', '8888888888', NULL, '1988-12-20 00:00:00', '1', 'Dr. Frankenstein', NULL, NULL, 1, '2012-10-27 12:24:06'),
(5, 'Tameka', 'Wasmund', NULL, '123 Chula Vista Way, San Diego, CA', '9999999999', NULL, '1978-07-10 00:00:00', '1', 'Dr. Bley', NULL, NULL, 1, '2012-10-27 12:24:06'),
(6, 'Carol', 'Saka', 'y', '345 Jamacha rd APT #6,Ca,92020', '6195743323', 0, '0000-00-00 00:00:00', '0', 'Max soon', NULL, NULL, 2, '2012-10-27 12:24:59'),
(7, 'Adam', 'Koona', 'r', '225 Grove rd APT #6,Ca,92320', '61943232', 1, '0000-00-00 00:00:00', '1', 'John moon', NULL, NULL, 2, '2012-10-27 12:28:54'),
(8, 'John', 'noor', 'j', '322 Jamacha rd APT #6,Ca,92020', '6197764345', 0, '0000-00-00 00:00:00', '1', 'jack box', NULL, NULL, 2, '2012-10-27 12:30:21'),
(9, 'Madlen', 'kaza', 'y', '278 Rancho,Ca,92019', '6195743323', 0, '0000-00-00 00:00:00', '0', 'Noon Soon', NULL, NULL, 2, '2012-10-27 12:31:31'),
(10, 'Sona', 'Rahema', 'D', '67 Jamacha rd APT #10,Ca,92020', '6195743323', 0, '0000-00-00 00:00:00', '0', 'Nawal jon', NULL, NULL, 2, '2012-10-27 12:32:58');

-- --------------------------------------------------------

--
-- Table structure for table `PatientEncounter`
--

CREATE TABLE `PatientEncounter` (
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

-- --------------------------------------------------------

--
-- Table structure for table `PatientLabTest`
--

CREATE TABLE `PatientLabTest` (
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

-- --------------------------------------------------------

--
-- Table structure for table `PatientMedication`
--

CREATE TABLE `PatientMedication` (
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

-- --------------------------------------------------------

--
-- Table structure for table `PatientSchedule`
--

CREATE TABLE `PatientSchedule` (
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

-- --------------------------------------------------------

--
-- Table structure for table `Service`
--

CREATE TABLE `Service` (
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

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`ID`, `UserName`, `JobTitle`, `Password`, `UserTypeID`, `EmployeeNumber`, `ChangeByID`, `ChangeDate`) VALUES
(1, 'fausto', 'Administrator', 'pnPqZhA3bgIqxZFR5MIF8aZfxhOCuVlABgNjKpuCWdM=', 1, '1', 34, '2012-10-22 18:54:05'),
(2, 'julian', 'Administrator', '123', 1, '12', 1, '2012-10-22 18:44:02');

-- --------------------------------------------------------

--
-- Table structure for table `UserHistory`
--

CREATE TABLE `UserHistory` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `UserHistory`
--

INSERT INTO `UserHistory` (`ID`, `UserName`, `JobTitle`, `Password`, `UserTypeID`, `EmployeeNumber`, `ChangeByID`, `ChangeDate`) VALUES
(1, 'fausto', 'Administrator', '12345', 1, '1', 2, '2012-10-22 18:46:22'),
(2, 'fausto', 'Administrator', 'alex', 1, '1', 2, '2012-10-22 18:53:38');

-- --------------------------------------------------------

--
-- Table structure for table `UserType`
--

CREATE TABLE `UserType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Access` int(11) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `UserType`
--

INSERT INTO `UserType` (`ID`, `Access`, `Description`) VALUES
(1, 0, 'Administrator'),
(2, 0, 'Doctor'),
(3, 0, 'Nurse'),
(4, 0, 'Financial Supervision'),
(5, 0, 'Carrier Representitive'),
(6, 0, 'Human Resources'),
(7, 0, 'Maintianance');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Billing`
--
ALTER TABLE `Billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`InsuranceCarrierID`) REFERENCES `InsuranceCarrier` (`ID`);

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`EmployeeTypeID`) REFERENCES `EmployeeType` (`ID`);

--
-- Constraints for table `InsuranceCarrier`
--
ALTER TABLE `InsuranceCarrier`
  ADD CONSTRAINT `insurancecarrier_ibfk_1` FOREIGN KEY (`CarrierstatusID`) REFERENCES `CarrierStatus` (`ID`);

--
-- Constraints for table `MedicationAversionList`
--
ALTER TABLE `MedicationAversionList`
  ADD CONSTRAINT `medicationaversionlist_ibfk_1` FOREIGN KEY (`MedicationID`) REFERENCES `Medication` (`ID`);

--
-- Constraints for table `PatientEncounter`
--
ALTER TABLE `PatientEncounter`
  ADD CONSTRAINT `patientencounter_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  ADD CONSTRAINT `patientencounter_ibfk_2` FOREIGN KEY (`PatientScheduleID`) REFERENCES `PatientSchedule` (`ID`),
  ADD CONSTRAINT `patientencounter_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`);

--
-- Constraints for table `PatientLabTest`
--
ALTER TABLE `PatientLabTest`
  ADD CONSTRAINT `patientlabtest_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  ADD CONSTRAINT `patientlabtest_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`),
  ADD CONSTRAINT `patientlabtest_ibfk_3` FOREIGN KEY (`LabTestID`) REFERENCES `LabTest` (`ID`);

--
-- Constraints for table `PatientMedication`
--
ALTER TABLE `PatientMedication`
  ADD CONSTRAINT `patientmedication_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  ADD CONSTRAINT `patientmedication_ibfk_2` FOREIGN KEY (`MedicationId`) REFERENCES `Medication` (`ID`),
  ADD CONSTRAINT `patientmedication_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`);

--
-- Constraints for table `PatientSchedule`
--
ALTER TABLE `PatientSchedule`
  ADD CONSTRAINT `patientschedule_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  ADD CONSTRAINT `patientschedule_ibfk_2` FOREIGN KEY (`AppointmentTypeID`) REFERENCES `AppointmentType` (`ID`),
  ADD CONSTRAINT `patientschedule_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`ID`);

--
-- Constraints for table `Service`
--
ALTER TABLE `Service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`),
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`PatientMedicationID`) REFERENCES `PatientMedication` (`ID`),
  ADD CONSTRAINT `service_ibfk_3` FOREIGN KEY (`PatientEncounterID`) REFERENCES `PatientEncounter` (`ID`),
  ADD CONSTRAINT `service_ibfk_4` FOREIGN KEY (`PatientLabTestID`) REFERENCES `PatientLabTest` (`ID`),
  ADD CONSTRAINT `service_ibfk_5` FOREIGN KEY (`BillingID`) REFERENCES `Billing` (`ID`);

--
-- Constraints for table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`UserTypeID`) REFERENCES `UserType` (`ID`);

--
-- Constraints for table `UserHistory`
--
ALTER TABLE `UserHistory`
  ADD CONSTRAINT `UserHistory_ibfk_1` FOREIGN KEY (`UserTypeID`) REFERENCES `UserType` (`ID`);
