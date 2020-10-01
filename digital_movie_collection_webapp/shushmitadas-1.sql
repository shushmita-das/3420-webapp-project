-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 17, 2019 at 03:14 AM
-- Server version: 5.7.25
-- PHP Version: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shushmitadas`
--

-- --------------------------------------------------------

--
-- Table structure for table `Alien`
--

CREATE TABLE `Alien` (
  `alnum` int(4) NOT NULL,
  `alname` varchar(20) NOT NULL,
  `alheads` int(2) DEFAULT NULL,
  `alcolor` varchar(20) NOT NULL,
  `alsmell` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Alien`
--

INSERT INTO `Alien` (`alnum`, `alname`, `alheads`, `alcolor`, `alsmell`) VALUES
(101, 'Laura', 6, 'Yellow', 'Mango'),
(102, 'Bob', 5, 'Purple', 'Blueberry'),
(123, 'Jack', 10, 'Orange', 'Lemon'),
(345, 'Mac', 9, 'Red', 'Chocolate'),
(567, 'Lisa', 8, 'Blue', 'Ocean'),
(891, 'Rosoe', 7, 'Green', 'Citric');

-- --------------------------------------------------------

--
-- Table structure for table `Branch`
--

CREATE TABLE `Branch` (
  `branch_name` varchar(60) NOT NULL,
  `branch_city` varchar(100) NOT NULL,
  `assets` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Catalog`
--

CREATE TABLE `Catalog` (
  `sid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Catalog`
--

INSERT INTO `Catalog` (`sid`, `pid`, `price`) VALUES
(1, 3, 0.5),
(1, 4, 0.5),
(1, 8, 11.7),
(2, 3, 0.55),
(2, 8, 7.95),
(2, 1, 16.5),
(3, 8, 12.5),
(3, 9, 1),
(4, 5, 2.2),
(4, 6, 1247548.23),
(4, 7, 1247548.23);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `CustomerID` int(11) NOT NULL,
  `Customername` char(30) DEFAULT NULL,
  `Phone` char(30) DEFAULT NULL,
  `City` char(50) DEFAULT NULL,
  `AccountBalance` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`CustomerID`, `Customername`, `Phone`, `City`, `AccountBalance`) VALUES
(1, 'Terry', '111-111-2222', 'Madison', 200),
(2, 'Leanne', '222-333-4444', 'Madison', 21),
(3, 'Jim', '333-444-2222', 'Chicago', 1280),
(4, 'Katy', '444-555-1111', 'San Francisco', 0),
(5, 'David', '555-222-1111', 'New York', 550),
(6, 'Willie', '333-111-3333', 'Atlanta', 230),
(7, 'Suga', '123-456-7890', 'New York', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `Customer_2`
--

CREATE TABLE `Customer_2` (
  `customer_name` varchar(30) NOT NULL,
  `customer_street` varchar(100) NOT NULL,
  `customer_city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Games`
--

CREATE TABLE `Games` (
  `Game_ID` int(11) NOT NULL,
  `Game_DT` date DEFAULT NULL,
  `HomeTeam_ID` int(11) DEFAULT NULL,
  `GuestTeam_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Games`
--

INSERT INTO `Games` (`Game_ID`, `Game_DT`, `HomeTeam_ID`, `GuestTeam_ID`) VALUES
(1, '2002-05-01', 1, 2),
(2, '2002-05-02', 3, 4),
(3, '2002-05-03', 1, 3),
(4, '2002-05-05', 2, 4),
(5, '2002-05-05', 1, 2),
(6, '2002-05-09', 3, 4),
(7, '2002-05-10', 2, 3),
(8, '2002-05-11', 1, 4),
(9, '2002-05-12', 2, 3),
(10, '2002-05-15', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Inventory`
--

CREATE TABLE `Inventory` (
  `ItemID` int(11) NOT NULL,
  `Description` char(100) DEFAULT NULL,
  `ListPrice` double DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Inventory`
--

INSERT INTO `Inventory` (`ItemID`, `Description`, `ListPrice`, `Quantity`) VALUES
(1, 'Garden rake', 8.99, 28),
(2, 'Leaf rake', 7.99, 43),
(3, 'Garden shovel', 15.99, 21),
(4, 'Trowel', 7.99, 36),
(5, 'Hoe', 5.99, 20),
(6, 'Pruning shears', 15.99, 35),
(7, 'Machete', 9.99, 42),
(8, 'Cultivator', 5.99, 42),
(9, 'Bulb planter', 3.89, 35),
(10, 'Pitchfork', 21.99, 34);

-- --------------------------------------------------------

--
-- Table structure for table `Loan`
--

CREATE TABLE `Loan` (
  `loan_number` int(11) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movie_info`
--

CREATE TABLE `movie_info` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(33) CHARACTER SET utf8mb4 NOT NULL,
  `rating` varchar(33) CHARACTER SET utf8mb4 NOT NULL,
  `genre` varchar(33) CHARACTER SET utf8mb4 NOT NULL,
  `mpa_rating` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `year` int(4) NOT NULL,
  `runtime` int(9) NOT NULL,
  `theatre_release` date NOT NULL,
  `dvd_release` date NOT NULL,
  `actor` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `cover` varchar(300) CHARACTER SET utf8mb4 DEFAULT NULL,
  `studio` varchar(33) CHARACTER SET utf8mb4 NOT NULL,
  `plot_summary` varchar(300) CHARACTER SET utf8mb4 NOT NULL,
  `video_type` varchar(33) CHARACTER SET utf8mb4 NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_info`
--

INSERT INTO `movie_info` (`movie_id`, `title`, `rating`, `genre`, `mpa_rating`, `year`, `runtime`, `theatre_release`, `dvd_release`, `actor`, `cover`, `studio`, `plot_summary`, `video_type`, `user_id`) VALUES
(15, 'The Italian Job', '4', '', 'R', 2100, 101, '2019-04-18', '2019-04-25', 'Agent B', 'www_data/covers/cover15.jpg', 'wew', 'Mafia vs. FBI', '', 6),
(16, 'Incredibles 2', '5', '', 'PG-13', 1234, 321, '2019-04-03', '2019-04-10', 'Asguardians', 'www_data/covers/cover16.jpg', 'Pixar', 'Another Pixar Hit!', '', 6),
(18, 'Hotel Transylvania 3', '4', '0', 'PG-13', 3333, 333, '2019-04-10', '2019-04-23', 'Woah!', 'www_data/covers/cover18.jpg', 'Pixar', 'HellllOOOOOOOOOOOO pplllllslsssssssss WWWWOOOORRRRRKKKKK PPPLLSSSSSS!!!!!!!!!!!!!!!! ', 'Blueray', 6),
(19, 'Mission Impossible', '5', 'Drama', 'NC-17', 4321, 123, '2019-04-10', '2019-04-16', 'Elsa', 'www_data/covers/cover19.jpg', 'Disney', 'OLAF!!!!!!!!!!!', 'DVD,Blueray,DigitalHD,HD 4K', 6),
(22, 'Ironman 3', '3', 'Comedy', 'PG-13', 1234, 213, '2019-04-10', '2019-04-17', 'TTTTTOOOONYYYYYYY', 'www_data/covers/cover22.jpg', 'Marvel', 'IRONMAN THREEEEEEEEEEE', 'DVD,Blueray,DigitalHD,HD 4K', 6),
(23, 'Percy Jackson', '3', 'Drama', 'PG-13', 2000, 296, '2019-04-03', '2019-04-11', 'Percy Jackson, Annabeth Chase', 'www_data/covers/cover23.jpg', 'WB', 'DEMIGODS VS. MONSTERS', 'DVD,Blueray,DigitalHD,HD 4K', 6),
(24, 'Mission', '4', 'Drama', 'PG', 1234, 234, '2019-04-01', '2019-04-17', 'kalskascn;kldsnles', 'www_data/covers/cover24.jpg', 'mdsc dm', 'lskamlcksa', 'Blueray', 6),
(25, 'Harry Potter 3', '3', '0', 'PG', 2142, 234, '2019-04-01', '2019-04-17', 'Danielle Radcliffe', 'www_data/covers/cover25.jpg', 'WB', 'hjsbdbfjbfjvf  nfvjfjv jovdf fjdvnldkjfnvjkdfnv', 'DVD,Blueray,DigitalHD,HD 4K', 11),
(27, 'Ironman THREE', '2', '2', 'PG', 1234, 9, '2019-05-01', '2019-04-23', 'ewe', 'www_data/covers/cover27.jpg', 'Marvel', 'ewewew', 'DVD,Blueray,DigitalHD,HD 4K', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oscar_AdminUsers`
--

CREATE TABLE `oscar_AdminUsers` (
  `userid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `userpass` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oscar_AdminUsers`
--

INSERT INTO `oscar_AdminUsers` (`userid`, `username`, `userpass`) VALUES
(9, 'admin', '$2y$10$WZ3/x7PK5bPBjLpv8TtxEeHjJX8RqWSYmQG4LGy2Ju58V3W0vJFVS');

-- --------------------------------------------------------

--
-- Table structure for table `oscar_CompleteResults`
--

CREATE TABLE `oscar_CompleteResults` (
  `entryId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `country` enum('Canada','US','NA') DEFAULT NULL,
  `agree` char(1) NOT NULL,
  `fk_movieId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oscar_CompleteResults`
--

INSERT INTO `oscar_CompleteResults` (`entryId`, `name`, `email`, `country`, `agree`, `fk_movieId`) VALUES
(12, 'Shushmita Das', 'shushmitadas@trentu.ca', 'Canada', 'Y', 12),
(13, 'Fiona Ibhazoboa', 'fionasomething@trentu.ca', 'US', 'Y', 13),
(14, 'Fiona Ibhazoboa', 'fionasomething@trentu.ca', 'US', 'Y', 13),
(15, 'Fiona Ibhazoboa', 'fionasomething@trentu.ca', 'US', 'Y', 14),
(16, 'Fiona Ibhazoboa', 'fionasomething@trentu.ca', 'US', 'Y', 12),
(17, 'Jamie Mitchell', 'jmitchell@trentu.ca', 'Canada', 'Y', 15),
(18, 'Jamie Mitchell', 'jmitchell@trentu.ca', 'Canada', 'Y', 15),
(19, 'Shushmita Das', 'shushmita.das@outlook.com', 'Canada', 'Y', 15),
(20, 'Shushmita Das', 'shushmita.das@outlook.com', 'Canada', 'Y', 14),
(21, 'Shushmita Das', 'shushmita.18@gmail.com', 'Canada', 'Y', 17),
(22, 'Shush Das', 'text@outlook.com', 'Canada', 'Y', 15),
(23, 'Shay My', 'tet@jam.ca', 'Canada', 'Y', 16),
(24, 'Te Ami', 'shmita.das@outlook.com', 'Canada', 'Y', 19),
(25, 'Te Ami', 'shushmita.das@outlok.com', 'Canada', 'Y', 19),
(26, 'Te Ami', 'mita.das@outlook.com', 'Canada', 'Y', 15),
(27, 'Shushmita Das', 'bhag@bla3h.com', 'Canada', 'Y', 13),
(28, 'Sjh Dgfdg', 'were@house.ca', 'Canada', 'Y', 14);

-- --------------------------------------------------------

--
-- Table structure for table `oscar_ReportingResults`
--

CREATE TABLE `oscar_ReportingResults` (
  `movieId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nomCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oscar_ReportingResults`
--

INSERT INTO `oscar_ReportingResults` (`movieId`, `name`, `nomCount`) VALUES
(12, 'Black Panther', 1044),
(13, 'BlacKkKlansman', 545),
(14, 'Bohemian Rhapsody', 1002),
(15, 'The Favourite', 240),
(16, 'Green Book', 900),
(17, 'Roma', 755),
(18, 'A Star Is Born', 1089),
(19, 'Vice', 455);

-- --------------------------------------------------------

--
-- Table structure for table `Parts`
--

CREATE TABLE `Parts` (
  `pid` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `color` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Parts`
--

INSERT INTO `Parts` (`pid`, `pname`, `color`) VALUES
(1, 'Left Handed Bacon Stretcher Cover', 'Red'),
(2, 'Smoke Shifter End', 'Black'),
(3, 'Acme Widget Washer', 'Red'),
(4, 'Acme Widget Washer', 'Silver'),
(5, 'I Brake for Crop Circles Sticker', 'Translucent'),
(6, 'Anti-Gravity Turbine Generator', 'Cyan'),
(7, 'Anti-Gravity Turbine Generator', 'Magenta'),
(8, 'Fire Hydrant Cap', 'Red'),
(9, '7 Segment Display', 'Green');

-- --------------------------------------------------------

--
-- Table structure for table `Players`
--

CREATE TABLE `Players` (
  `Player_ID` int(11) NOT NULL,
  `Last` varchar(50) NOT NULL,
  `First` varchar(30) NOT NULL,
  `Team_ID` int(11) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Players`
--

INSERT INTO `Players` (`Player_ID`, `Last`, `First`, `Team_ID`, `Number`) VALUES
(1, 'Smith', 'John', 1, 12),
(2, 'Bobbit', 'Billy', 1, 2),
(3, 'Hurta', 'Wil', 2, 32),
(4, 'Ouchy', 'Tim', 2, 22),
(5, 'Byrd', 'Eric', 3, 6),
(6, 'Jordan', 'Ryan', 3, 23),
(7, 'Hammer', 'Wally', 4, 21),
(8, 'Hammer', 'Ron', 4, 44),
(11, 'Knotgood', 'Al', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Player_Data`
--

CREATE TABLE `Player_Data` (
  `Player_ID` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Player_Data`
--

INSERT INTO `Player_Data` (`Player_ID`, `Height`, `Weight`) VALUES
(1, 71, 180),
(2, 58, 195),
(3, 72, 200),
(4, 74, 170),
(5, 71, 182),
(6, 72, 289),
(7, 79, 250),
(8, 73, 193),
(11, 85, 310);

-- --------------------------------------------------------

--
-- Table structure for table `Restaurant`
--

CREATE TABLE `Restaurant` (
  `rest_add` varchar(50) NOT NULL,
  `rest_stcap` int(4) DEFAULT NULL,
  `rest_phnum` varchar(10) NOT NULL,
  `rest_fdstl` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Sailors`
--

CREATE TABLE `Sailors` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `age` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sailors`
--

INSERT INTO `Sailors` (`sid`, `sname`, `rating`, `age`) VALUES
(22, 'Dustin', 7, 45),
(29, 'Brutus', 1, 33),
(31, 'Lebber', 8, 55.5),
(32, 'Andy', 8, 25.5),
(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),
(71, 'Zorba', 10, 16),
(74, 'Horatio', 9, 35),
(85, 'Art', 3, 25.5),
(95, 'Bob', 3, 63.5);

-- --------------------------------------------------------

--
-- Table structure for table `Sale`
--

CREATE TABLE `Sale` (
  `SaleID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `SaleDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sale`
--

INSERT INTO `Sale` (`SaleID`, `CustomerID`, `SaleDate`) VALUES
(101, 1, '2015-02-05'),
(102, 4, '2015-02-07'),
(103, 2, '2015-01-07'),
(104, 5, '2015-03-08'),
(105, 6, '2013-03-09'),
(106, 1, '2014-03-10'),
(107, 3, '2015-03-11'),
(108, 5, '2015-04-12'),
(109, 2, '2015-04-13'),
(110, 4, '2015-04-14'),
(111, 7, '2017-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `SaleItem`
--

CREATE TABLE `SaleItem` (
  `SaleID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `SalePrice` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SaleItem`
--

INSERT INTO `SaleItem` (`SaleID`, `ItemID`, `Quantity`, `SalePrice`) VALUES
(101, 3, 5, 14.99),
(101, 4, 10, 7.9),
(102, 5, 50, 4.99),
(102, 6, 20, 14.99),
(102, 9, 10, 3.8),
(103, 7, 5, 9.09),
(103, 8, 10, 5.69),
(104, 2, 10, 7.99),
(104, 3, 20, 15.99),
(105, 1, 5, 8.99),
(105, 8, 10, 5.99),
(106, 1, 20, 8.99),
(106, 8, 30, 5.99),
(107, 5, 50, 5.99),
(108, 3, 40, 15.99),
(109, 2, 40, 7.99),
(109, 4, 50, 7.99),
(110, 3, 3, 15.99),
(110, 6, 40, 15.99),
(111, 6, 5, 14.391);

-- --------------------------------------------------------

--
-- Table structure for table `Scores`
--

CREATE TABLE `Scores` (
  `Game_ID` int(11) DEFAULT NULL,
  `Team_ID` int(11) DEFAULT NULL,
  `Score` int(11) DEFAULT NULL,
  `Win_Lose` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Scores`
--

INSERT INTO `Scores` (`Game_ID`, `Team_ID`, `Score`, `Win_Lose`) VALUES
(1, 1, 66, 'Lose'),
(2, 3, 78, 'Win'),
(3, 1, 45, 'Lose'),
(4, 2, 56, 'Lose'),
(5, 1, 100, 'Win'),
(6, 3, 67, 'Lose'),
(7, 2, 57, 'Lose'),
(8, 1, 98, 'Win'),
(9, 2, 56, 'Lose'),
(10, 1, 46, 'Lose'),
(1, 2, 75, 'Win'),
(2, 4, 46, 'Lose'),
(3, 3, 87, 'Win'),
(4, 4, 99, 'Win'),
(5, 2, 88, 'Lose'),
(6, 4, 77, 'Win'),
(7, 3, 87, 'Win'),
(8, 4, 56, 'Lose'),
(9, 3, 87, 'Win'),
(10, 4, 78, 'Win');

-- --------------------------------------------------------

--
-- Table structure for table `share`
--

CREATE TABLE `share` (
  `shrcode` char(3) NOT NULL,
  `shrfirm` varchar(20) NOT NULL,
  `shrtime` time DEFAULT NULL,
  `shrqty` decimal(8,0) DEFAULT NULL,
  `shrdiv` decimal(5,2) DEFAULT NULL,
  `shrpe` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `share_v2`
--

CREATE TABLE `share_v2` (
  `shrcode` char(3) NOT NULL,
  `shrfirm` varchar(20) NOT NULL,
  `shrprice` decimal(6,2) NOT NULL,
  `shrqty` decimal(8,0) NOT NULL,
  `shrdiv` decimal(5,2) NOT NULL,
  `shrpe` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `share_v2`
--

INSERT INTO `share_v2` (`shrcode`, `shrfirm`, `shrprice`, `shrqty`, `shrdiv`, `shrpe`) VALUES
('AR', 'Abyssinian Ruby', '31.82', '22010', '1.32', '13'),
('BE', 'Burmese Elephant', '0.07', '154713', '0.01', '3'),
('BS', 'Bolivian Sheep', '12.75', '231678', '1.78', '11'),
('CS', 'Canadian Sugar', '52.78', '4716', '2.50', '15'),
('FC', 'Freedonia Copper', '27.50', '10529', '1.84', '16'),
('ILZ', 'Indian Lead & Zinc', '37.75', '6390', '3.00', '12'),
('NG', 'Nigerian Geese', '35.00', '12323', '1.68', '10'),
('PT', 'Patagonian Tea', '55.25', '12635', '2.50', '10'),
('ROF', 'Roayl Ostrich Farms', '33.75', '1234923', '3.00', '6'),
('SLG', 'Sri lankan Gold', '50.37', '32868', '2.68', '16');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stunum` int(9) NOT NULL,
  `stuname` varchar(18) DEFAULT NULL,
  `stumajor` varchar(22) DEFAULT NULL,
  `stuyr` varchar(2) DEFAULT NULL,
  `stuage` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Student_A1`
--

CREATE TABLE `Student_A1` (
  `snum` int(15) NOT NULL,
  `sname` varchar(30) DEFAULT NULL,
  `major` varchar(25) DEFAULT NULL,
  `level` char(2) DEFAULT NULL,
  `age` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student_A1`
--

INSERT INTO `Student_A1` (`snum`, `sname`, `major`, `level`, `age`) VALUES
(51135593, 'Maria White', 'English', 'SR', 21),
(60839453, 'Charles Harris', 'Architecture', 'SR', 22),
(99354543, 'Susan Martin', 'Law', 'JR', 20),
(112348546, 'Joseph Thompson', 'Computer Science', 'SO', 19),
(115987938, 'Christopher Garcia', 'Computer Science', 'JR', 20),
(132977562, 'Angela Martinez', 'History', 'SR', 20),
(269734834, 'Thomas Robinson', 'Psychology', 'SO', 18),
(280158572, 'Margaret Clark', 'Animal Science', 'FR', 18),
(301221823, 'Juan Rodriguez', 'Psychology', 'JR', 20),
(318548912, 'Dorthy Lewis', 'Finance', 'FR', 18),
(320874981, 'Daniel Lee', 'Electrical Engineering', 'FR', 17),
(322654189, 'Lisa Walker', 'Computer Science', 'SO', 17),
(348121549, 'Paul Hall', 'Computer Science', 'JR', 18),
(351565322, 'Nancy Allen', 'Accounting', 'JR', 19),
(451519864, 'Mark Young', 'Finance', 'FR', 18),
(455798411, 'Luis Hernandez', 'Electrical Engineering', 'FR', 17),
(462156489, 'Donald King', 'Mechanical Engineering', 'SO', 19),
(550156548, 'George Wright', 'Education', 'SR', 21),
(552455318, 'Ana Lopez', 'Computer Engineering', 'SR', 19),
(556784565, 'Kenneth Hill', 'Civil Engineering', 'SR', 21),
(567354612, 'Karen Scott', 'Computer Engineering', 'FR', 18),
(573284895, 'Steven Green', 'Kinesiology', 'SO', 19),
(574489456, 'Betty Adams', 'Economics', 'JR', 20),
(578875478, 'Edward Baker', 'Veterinary Medicine', 'SR', 21);

-- --------------------------------------------------------

--
-- Table structure for table `Suppliers`
--

CREATE TABLE `Suppliers` (
  `sid` int(11) NOT NULL,
  `sname` varchar(30) NOT NULL,
  `saddress` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Suppliers`
--

INSERT INTO `Suppliers` (`sid`, `sname`, `saddress`) VALUES
(1, 'Acme Widget Suppliers', '1 Grub St., Potemkin Village, IL 61801'),
(2, 'Big Red Tool and Die', '4 My Way, Bermuda Shorts, OR 90305'),
(3, 'Perfunctory Parts', '99999 Short Pier, Terra Del Fuego, TX 41299'),
(4, 'Alien Aircraft Inc.', '2 Groom Lake, Rachel, NV 51902');

-- --------------------------------------------------------

--
-- Table structure for table `Teams`
--

CREATE TABLE `Teams` (
  `Team_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Teams`
--

INSERT INTO `Teams` (`Team_ID`, `Name`) VALUES
(1, 'String Music'),
(2, 'Hackers'),
(3, 'Sharp Shooters'),
(4, 'Hammer Time');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL,
  `name` varchar(33) CHARACTER SET utf8 NOT NULL,
  `username` varchar(33) CHARACTER SET utf8 NOT NULL,
  `email` varchar(33) CHARACTER SET utf8 NOT NULL,
  `password` varchar(70) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `name`, `username`, `email`, `password`) VALUES
(1, 'Han Bu', 'shu', 'blah@sa.ca', '$2y$10$yYiRUe5tTyKI0s7eCofxleiHB09.5uxmvQMxPAGlv/cZgZCHrs5Iy'),
(2, 'Shush Mita', 'Blah1', 'blah@blah.com', '$2y$10$EH6N1t0p3P7zV1dC/MPFjO8x1HG1oYjHZ0kEQQJdVSgK2qXCtc.1.'),
(3, 'An Am', 'Sam', 'blow@dry.ca', '$2y$10$vKI04RJPdT1OpaTuV5cL9uUL5U300Fk9I1LPBclwqyUuYrItoFm3i'),
(6, 'Fi Fi', 'fifi', 'fifi@xyz.com', '$2y$10$xLWUfabjC/mZBNoTa8UmWe3TjApusx1xBRPkLrP4g4diEtGLlJdeu'),
(7, 'asd Jia', 'asd', '908003763@qq.com', '$2y$10$pi9pSloi6jIKaZoIvcbGTuxqJxFhv4eDUXHdujj80r.PDa9Cr0KWq'),
(9, 'w w', 'ww', 'shushmita.das@outlook.com', '$2y$10$.fD1fqjxehvichV8nAYSN.qiT2sP01PnhBMZB0ZRmP2hDvHAWOfyO'),
(10, 'jsdskvn skjdfnksjn', 'shush', 'kjsdnfj@jdnc.ca', '$2y$10$uuOE9PkUGTLZcbMTONu1GOKU/oHDUCNYRlHZR8gPLLysf5ejCcFNm'),
(11, 'sdfu hsfbhjb', 'qew', 'hahahahaha@hahahaha,com', '$2y$10$xicAi9NFLwKs8ubKCh49qOxmlBrpdSHIluVlK232xWfuNL.NjynE2'),
(12, 'Ghjb Ajhvj', 'QAR', 'shushmita.das@outlook.com', '$2y$10$fP5VAWJDAR3dP/XVP86F2e5NoMEe9sy4PhDpKckzBSOtw1Urq0REi'),
(14, 'Ahbshbj Aihfboiebf', 'Lama', 'jkebfjlbwelgjbrjw@hsbdfhbs.ca', '$2y$10$KyOUaiUylgLklwsO4oC0rOjWMS/NqDHIN6fI6UY8ze1ardueevIYe'),
(15, 'w w', 'ww', '908003763@qq.com', '$2y$10$UjhXY1eLWolpa827WvcIKeKnSAhf17a1I.MJ8MMI63aSvwcpWKiXa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Alien`
--
ALTER TABLE `Alien`
  ADD PRIMARY KEY (`alnum`);

--
-- Indexes for table `Branch`
--
ALTER TABLE `Branch`
  ADD PRIMARY KEY (`branch_name`);

--
-- Indexes for table `Catalog`
--
ALTER TABLE `Catalog`
  ADD KEY `sid` (`sid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `Customer_2`
--
ALTER TABLE `Customer_2`
  ADD PRIMARY KEY (`customer_name`);

--
-- Indexes for table `Games`
--
ALTER TABLE `Games`
  ADD PRIMARY KEY (`Game_ID`),
  ADD KEY `HomeTeam_ID` (`HomeTeam_ID`),
  ADD KEY `GuestTeam_ID` (`GuestTeam_ID`);

--
-- Indexes for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `Loan`
--
ALTER TABLE `Loan`
  ADD PRIMARY KEY (`loan_number`);

--
-- Indexes for table `movie_info`
--
ALTER TABLE `movie_info`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `oscar_AdminUsers`
--
ALTER TABLE `oscar_AdminUsers`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `oscar_CompleteResults`
--
ALTER TABLE `oscar_CompleteResults`
  ADD PRIMARY KEY (`entryId`),
  ADD KEY `email` (`email`),
  ADD KEY `fk_movieid` (`fk_movieId`);

--
-- Indexes for table `oscar_ReportingResults`
--
ALTER TABLE `oscar_ReportingResults`
  ADD PRIMARY KEY (`movieId`);

--
-- Indexes for table `Parts`
--
ALTER TABLE `Parts`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `Players`
--
ALTER TABLE `Players`
  ADD PRIMARY KEY (`Player_ID`),
  ADD KEY `Team_ID` (`Team_ID`);

--
-- Indexes for table `Player_Data`
--
ALTER TABLE `Player_Data`
  ADD KEY `Player_ID` (`Player_ID`);

--
-- Indexes for table `Restaurant`
--
ALTER TABLE `Restaurant`
  ADD PRIMARY KEY (`rest_phnum`);

--
-- Indexes for table `Sailors`
--
ALTER TABLE `Sailors`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `Sale`
--
ALTER TABLE `Sale`
  ADD PRIMARY KEY (`SaleID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `SaleItem`
--
ALTER TABLE `SaleItem`
  ADD KEY `SaleID` (`SaleID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `Scores`
--
ALTER TABLE `Scores`
  ADD KEY `Game_ID` (`Game_ID`),
  ADD KEY `Team_ID` (`Team_ID`);

--
-- Indexes for table `share`
--
ALTER TABLE `share`
  ADD PRIMARY KEY (`shrcode`);

--
-- Indexes for table `share_v2`
--
ALTER TABLE `share_v2`
  ADD PRIMARY KEY (`shrcode`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stunum`);

--
-- Indexes for table `Student_A1`
--
ALTER TABLE `Student_A1`
  ADD PRIMARY KEY (`snum`);

--
-- Indexes for table `Suppliers`
--
ALTER TABLE `Suppliers`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `Teams`
--
ALTER TABLE `Teams`
  ADD PRIMARY KEY (`Team_ID`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movie_info`
--
ALTER TABLE `movie_info`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `oscar_AdminUsers`
--
ALTER TABLE `oscar_AdminUsers`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oscar_CompleteResults`
--
ALTER TABLE `oscar_CompleteResults`
  MODIFY `entryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `oscar_ReportingResults`
--
ALTER TABLE `oscar_ReportingResults`
  MODIFY `movieId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Catalog`
--
ALTER TABLE `Catalog`
  ADD CONSTRAINT `Catalog_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `Suppliers` (`sid`),
  ADD CONSTRAINT `Catalog_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `Parts` (`pid`);

--
-- Constraints for table `Games`
--
ALTER TABLE `Games`
  ADD CONSTRAINT `Games_ibfk_1` FOREIGN KEY (`HomeTeam_ID`) REFERENCES `Teams` (`Team_ID`),
  ADD CONSTRAINT `Games_ibfk_2` FOREIGN KEY (`GuestTeam_ID`) REFERENCES `Teams` (`Team_ID`);

--
-- Constraints for table `movie_info`
--
ALTER TABLE `movie_info`
  ADD CONSTRAINT `movie_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `oscar_CompleteResults`
--
ALTER TABLE `oscar_CompleteResults`
  ADD CONSTRAINT `movie` FOREIGN KEY (`fk_movieId`) REFERENCES `oscar_ReportingResults` (`movieId`);

--
-- Constraints for table `Players`
--
ALTER TABLE `Players`
  ADD CONSTRAINT `Players_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `Teams` (`Team_ID`);

--
-- Constraints for table `Player_Data`
--
ALTER TABLE `Player_Data`
  ADD CONSTRAINT `Player_Data_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `Players` (`Player_ID`);

--
-- Constraints for table `Sale`
--
ALTER TABLE `Sale`
  ADD CONSTRAINT `Sale_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`);

--
-- Constraints for table `SaleItem`
--
ALTER TABLE `SaleItem`
  ADD CONSTRAINT `SaleItem_ibfk_1` FOREIGN KEY (`SaleID`) REFERENCES `Sale` (`SaleID`),
  ADD CONSTRAINT `SaleItem_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `Inventory` (`ItemID`);

--
-- Constraints for table `Scores`
--
ALTER TABLE `Scores`
  ADD CONSTRAINT `Scores_ibfk_1` FOREIGN KEY (`Game_ID`) REFERENCES `Games` (`Game_ID`),
  ADD CONSTRAINT `Scores_ibfk_2` FOREIGN KEY (`Team_ID`) REFERENCES `Teams` (`Team_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
