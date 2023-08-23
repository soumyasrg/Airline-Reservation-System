-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 23, 2023 at 08:38 PM
-- Server version: 8.1.0
-- PHP Version: 7.4.3-4ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airlinedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `AdminID` varchar(5) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `UserName` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`AdminID`, `FirstName`, `LastName`, `UserName`, `Password`) VALUES
('AD001', 'Ram', 'Kumar', 'PC', '123'),
('AD002', 'Rinku', 'Singh', 'PC', '456');

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `CustomerID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Passport` varchar(45) NOT NULL,
  `NationalID` varchar(45) NOT NULL,
  `Address` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Contact` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `DOB` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Passport`, `NationalID`, `Address`, `Contact`, `Gender`, `DOB`) VALUES
('CS001', 'Soumya', 'Ranjan', '12232422', '12342342', 'Cuttack', '1322424', 'male', '2023-08-03'),
('CS002', 'Kumar', 'Sanu', '1212121', '1121212', 'Delhi', '12121211', 'male', '2023-08-02');

-- --------------------------------------------------------

--
-- Table structure for table `Flight`
--

CREATE TABLE `Flight` (
  `FlightID` varchar(5) NOT NULL,
  `FlightName` varchar(45) NOT NULL,
  `Arrival` varchar(45) NOT NULL,
  `Departure` varchar(45) NOT NULL,
  `Duration` varchar(45) NOT NULL,
  `Seats` varchar(45) NOT NULL,
  `Fare` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Flight`
--

INSERT INTO `Flight` (`FlightID`, `FlightName`, `Arrival`, `Departure`, `Duration`, `Seats`, `Fare`, `Date`) VALUES
('FL001', 'Indigo', 'Mumbai', 'Delhi', '2', '100', '12000', '03-08-2023');

-- --------------------------------------------------------

--
-- Table structure for table `Ticket`
--

CREATE TABLE `Ticket` (
  `TicketID` varchar(5) NOT NULL,
  `FlightID` varchar(45) NOT NULL,
  `CustomerID` varchar(45) NOT NULL,
  `Arrival` varchar(45) NOT NULL,
  `Departure` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Contact` varchar(45) NOT NULL,
  `TotalFare` varchar(45) NOT NULL,
  `JourneyDate` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Ticket`
--

INSERT INTO `Ticket` (`TicketID`, `FlightID`, `CustomerID`, `Arrival`, `Departure`, `FirstName`, `LastName`, `Gender`, `Contact`, `TotalFare`, `JourneyDate`) VALUES
('TK001', 'FL001', 'CS001', 'Mumbai', 'Delhi', 'Soumya', 'Ranjan', 'male', '1322424', '24000', '03-08-2023'),
('TK002', 'FL001', 'CS001', 'Mumbai', 'Delhi', 'Soumya', 'Ranjan', 'male', '1322424', '35900', '03-08-2023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `Flight`
--
ALTER TABLE `Flight`
  ADD PRIMARY KEY (`FlightID`);

--
-- Indexes for table `Ticket`
--
ALTER TABLE `Ticket`
  ADD PRIMARY KEY (`TicketID`),
  ADD KEY `FlightID` (`FlightID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Ticket`
--
ALTER TABLE `Ticket`
  ADD CONSTRAINT `Ticket_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `Flight` (`FlightID`),
  ADD CONSTRAINT `Ticket_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
