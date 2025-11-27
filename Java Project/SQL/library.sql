-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2024 at 05:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `BookID` int(11) NOT NULL,
  `BookName` varchar(50) NOT NULL,
  `Genre` varchar(10) NOT NULL,
  `Author` varchar(30) DEFAULT NULL,
  `Publisher` varchar(30) DEFAULT NULL,
  `Shelf` varchar(5) NOT NULL,
  `Row` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookID`, `BookName`, `Genre`, `Author`, `Publisher`, `Shelf`, `Row`) VALUES
(3, 'Harry Potter and Goblet of Fire', 'Fiction', 'J. K. Rowling', 'Pottermore', '12', 'B'),
(4, 'Harry Potter and Deathly Hallow', 'Fiction', 'J. K. Rowling', 'Pottermore', 'D', '23'),
(5, 'Famous Five', 'sd', 'ds', 'dsd', 'A', '3'),
(13, 'The da Vinci Code', 'Thriller', 'Dan Brown', 'Doubleday', 'r', '5'),
(14, 'Pride and Prejudice', 'Romantic', 'Alexander Dumas', 'Pearson', 'a', '9'),
(15, 'To Kill A Mocking Bird', 'Emotional', 'Harper Lee', 'McGraw', 'z', '8'),
(17, 'The Hunger Games', 'Action', 'Suzanne Collins', 'Pearson', 't', '7'),
(18, 'Madhushala', 'Life', 'H R Bacchan', 'Pushpalata', 'h', '6'),
(19, 'V for Vendetta ', 'Action', 'Alan Moore', 'Cambridge', 'a', '9'),
(22, 'Predestination', 'Horror', 'Ismaeel', 'Basheer', 'z', '9');

-- --------------------------------------------------------

--
-- Table structure for table `book_count`
--

CREATE TABLE `book_count` (
  `BookNo` int(11) DEFAULT 0,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `book_count`
--

INSERT INTO `book_count` (`BookNo`, `UserID`) VALUES
(1, 1),
(2, 2),
(0, 3),
(0, 4),
(0, 5),
(0, 6),
(0, 7),
(0, 8),
(0, 9),
(0, 10),
(0, 11);

-- --------------------------------------------------------

--
-- Table structure for table `fullname`
--

CREATE TABLE `fullname` (
  `UserID` int(11) DEFAULT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issuedbook`
--

CREATE TABLE `issuedbook` (
  `BookID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `IssueDate` date NOT NULL,
  `ReturnDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Triggers `issuedbook`
--
DELIMITER $$
CREATE TRIGGER `IssuedBook_AFTER_INSERT` AFTER INSERT ON `issuedbook` FOR EACH ROW BEGIN
 UPDATE Book_Count 
  SET BookNo = BookNo+1
  where UserID = NEW.UserID;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `count` AFTER DELETE ON `issuedbook` FOR EACH ROW BEGIN
  UPDATE Book_Count 
  SET BookNo = BookNo-1
  where Book_Count.UserID = OLD.UserID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `issuedmagazine`
--

CREATE TABLE `issuedmagazine` (
  `MagID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `IssueDate` date NOT NULL,
  `ReturnDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Triggers `issuedmagazine`
--
DELIMITER $$
CREATE TRIGGER `IssuedMagazine_AFTER_DELETE` AFTER DELETE ON `issuedmagazine` FOR EACH ROW BEGIN
UPDATE Book_Count
SET BookNo = BookNo
where Book_Count.UserID = OLD.UserID;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `IssuedMagazine_AFTER_INSERT` AFTER INSERT ON `issuedmagazine` FOR EACH ROW BEGIN
UPDATE Book_Count
SET BookNo = BookNo +1 
where Book_Count.UserID = NEW.UserID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `LibrarianID` int(11) NOT NULL,
  `FullName` varchar(30) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`LibrarianID`, `FullName`, `UserName`, `Password`, `Email`) VALUES
(1, 'ismail Basheer', 'Ismaeel', '1234', 'ismaeel@gmail.com'),
(2, 'Marwa Jamal', 'marwa', '1234', 'marwa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `magazine`
--

CREATE TABLE `magazine` (
  `MagID` int(11) NOT NULL,
  `VolNo` int(11) NOT NULL,
  `Mname` varchar(30) NOT NULL,
  `Magazine` varchar(30) NOT NULL,
  `MagazineShelf` varchar(10) NOT NULL,
  `Genre` varchar(10) NOT NULL,
  `Publisher` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `PublisherID` int(11) NOT NULL,
  `PublisherName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`PublisherID`, `PublisherName`) VALUES
(1, 'hjkhdkj'),
(2, 'Pottermore'),
(3, 'dsd'),
(4, 'Whittaker'),
(5, 'ewhkje'),
(6, 'dhskj'),
(7, 'hkjdfh'),
(8, 'gsjf'),
(9, 'dshh'),
(10, 'gdsh'),
(11, 'Water'),
(12, 'ew'),
(13, 'dgjs'),
(14, 'SGAJ'),
(15, 'WHOKNOW'),
(16, 'Doubleday'),
(17, 'Pearson'),
(18, 'McGraw'),
(19, 'Klett'),
(20, 'Pushpalata'),
(21, 'Cambridge'),
(22, 'TMH'),
(23, 'basheer');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserPass` varchar(30) NOT NULL,
  `RegDate` date NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserPass`, `RegDate`, `UserName`, `Email`) VALUES
(4, '1234', '2024-01-26', 'marwa', 'marwa@gmail.com'),
(5, '1234', '2024-01-26', 'sinan', 'sinan@gmail.com'),
(6, '1234', '2024-01-26', 'Vishnu', 'Vishnu@gmail.com'),
(7, '1234', '2024-01-26', 'Aswin', 'sswin@gmail.com'),
(8, '1234', '2024-01-26', 'Rashid', 'Rashid@gmail.com'),
(11, '1234', '2024-01-26', 'shukooor', 'shukooooooor@gmail.com');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `Users_AFTER_INSERT` AFTER INSERT ON `users` FOR EACH ROW BEGIN
INSERT INTO Book_Count
values(0,New.UserID);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookID`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`LibrarianID`);

--
-- Indexes for table `magazine`
--
ALTER TABLE `magazine`
  ADD PRIMARY KEY (`MagID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`PublisherID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
  MODIFY `LibrarianID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `magazine`
--
ALTER TABLE `magazine`
  MODIFY `MagID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `PublisherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
