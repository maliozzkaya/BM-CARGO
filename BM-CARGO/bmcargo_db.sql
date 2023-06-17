-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 01 Haz 2023, 17:04:35
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `bmcargo_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branch-info`
--

CREATE TABLE `branch-info` (
  `BranchID` int(55) NOT NULL,
  `DeliveryID` int(55) NOT NULL,
  `StaffID` int(55) NOT NULL,
  `CompanyID` int(55) NOT NULL,
  `CampaignsID` int(55) NOT NULL,
  `BranchAddress` varchar(55) NOT NULL,
  `BranchPhoneNumber` char(55) NOT NULL,
  `BranchName` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `branch-info`
--

INSERT INTO `branch-info` (`BranchID`, `DeliveryID`, `StaffID`, `CompanyID`, `CampaignsID`, `BranchAddress`, `BranchPhoneNumber`, `BranchName`) VALUES
(341, 1, 1, 1, 0, 'Istanbul Umraniye', '216 00 00 00', 'BM Cargo Umraniye'),
(351, 1, 1, 1, 0, 'Izmir Bornova', '216 00 00 00', 'BM Cargo Bornova'),
(161, 1, 1, 1, 0, 'BM Cargo Nilüfer', '216 00 00 00', 'BM Cargo Nilüfer Bursa'),
(481, 1, 1, 1, 0, 'BM Cargo Bodrum', '216 00 00 00', 'BM Cargo Bodrum Muğla');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `campaigns`
--

CREATE TABLE `campaigns` (
  `CampaignsID` int(55) NOT NULL,
  `CampaignStartTime` date NOT NULL,
  `CampaignEndTime` date NOT NULL,
  `CampaignsDetails` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `campaigns`
--

INSERT INTO `campaigns` (`CampaignsID`, `CampaignStartTime`, `CampaignEndTime`, `CampaignsDetails`) VALUES
(1, '2023-09-01', '0000-00-00', 'tarihleri arasında geçerli olacak olan kampanyaya göre ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cargo-info`
--

CREATE TABLE `cargo-info` (
  `CargoID` int(55) NOT NULL,
  `TimeID` int(55) NOT NULL,
  `CustomerID` int(55) NOT NULL,
  `BranchID` int(55) NOT NULL,
  `CargoCostID` int(55) NOT NULL,
  `DeliveryID` int(55) NOT NULL,
  `SenderAddress` varchar(55) NOT NULL,
  `ReceiverAddress` varchar(55) NOT NULL,
  `WeightInfo` int(55) NOT NULL,
  `SizeInfo` int(55) NOT NULL,
  `Sss` int(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `cargo-info`
--

INSERT INTO `cargo-info` (`CargoID`, `TimeID`, `CustomerID`, `BranchID`, `CargoCostID`, `DeliveryID`, `SenderAddress`, `ReceiverAddress`, `WeightInfo`, `SizeInfo`, `Sss`) VALUES
(1, 1, 1, 341, 1, 1, 'BM Cargo Umraniye', 'BM Cargo Bornova', 1, 1, 0),
(2, 2, 2, 161, 2, 2, 'BM Cargo Nilüfer Bursa', 'BM Cargo Bodrum Muğla', 2, 2, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cargocosts`
--

CREATE TABLE `cargocosts` (
  `CargoCostID` int(55) NOT NULL,
  `CustomerID` int(55) NOT NULL,
  `PaymentDate` date NOT NULL,
  `PaymentAmount` int(55) NOT NULL,
  `PaymentDistance` int(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `cargocosts`
--

INSERT INTO `cargocosts` (`CargoCostID`, `CustomerID`, `PaymentDate`, `PaymentAmount`, `PaymentDistance`) VALUES
(1, 1, '2023-05-18', 1, 1),
(2, 2, '2023-05-19', 2, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `complaint-info`
--

CREATE TABLE `complaint-info` (
  `ComplaintID` int(55) NOT NULL,
  `CustomerID` int(55) NOT NULL,
  `ComplaintDate` date NOT NULL,
  `ComplaintStatus` tinyint(1) NOT NULL,
  `ComplaintDescription` int(55) NOT NULL,
  `SenderTC` char(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `complaint-info`
--

INSERT INTO `complaint-info` (`ComplaintID`, `CustomerID`, `ComplaintDate`, `ComplaintStatus`, `ComplaintDescription`, `SenderTC`) VALUES
(0, 0, '0000-00-00', 0, 0, '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contracted companies`
--

CREATE TABLE `contracted companies` (
  `CompanyID` int(55) NOT NULL,
  `CompanyName` varchar(55) NOT NULL,
  `AgreementStartDate` date NOT NULL,
  `AgreementEndDate` date NOT NULL,
  `AgreementTerm` date NOT NULL,
  `AgreementDetails` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `contracted companies`
--

INSERT INTO `contracted companies` (`CompanyID`, `CompanyName`, `AgreementStartDate`, `AgreementEndDate`, `AgreementTerm`, `AgreementDetails`) VALUES
(0, '-', '0000-00-00', '0000-00-00', '0000-00-00', '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `customer-info`
--

CREATE TABLE `customer-info` (
  `CustomerID` int(55) NOT NULL,
  `SenderName` varchar(55) NOT NULL,
  `SenderSurname` varchar(55) NOT NULL,
  `SenderStatus` tinyint(1) NOT NULL,
  `SenderPhoneNumber` char(55) NOT NULL,
  `SenderEmail` varchar(55) NOT NULL,
  `SenderAddress` varchar(55) NOT NULL,
  `SenderBirthdate` date NOT NULL,
  `SenderTC` char(55) NOT NULL,
  `ReceiverName` varchar(55) NOT NULL,
  `ReceiverSurname` varchar(55) NOT NULL,
  `ReceiverTC` char(55) NOT NULL,
  `ReceiverAddress` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `customer-info`
--

INSERT INTO `customer-info` (`CustomerID`, `SenderName`, `SenderSurname`, `SenderStatus`, `SenderPhoneNumber`, `SenderEmail`, `SenderAddress`, `SenderBirthdate`, `SenderTC`, `ReceiverName`, `ReceiverSurname`, `ReceiverTC`, `ReceiverAddress`) VALUES
(1, 'BERK ', 'SEBİT', 1, '532-00-00-00', 'bs@example.com', 'BM Cargo Umraniye Istanbul ', '2001-01-01', '2192904883', 'MEHMET ALI', 'OZKAYA', '2837920828', 'BM Cargo Bornova Izmir'),
(2, 'AHMET', 'KAPLAN', 1, '532-00-00-01', 'ahmt@example.com', 'BM Cargo Nilüfer Bursa', '2002-02-02', '4798746929', 'BURCU', 'YILMAZ', '89080486782', 'BM Cargo Bodrum Muğla');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `delivery-type`
--

CREATE TABLE `delivery-type` (
  `DeliveryID` int(55) NOT NULL,
  `BranchDelivery` tinyint(1) NOT NULL,
  `AddressDelivery` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `delivery-type`
--

INSERT INTO `delivery-type` (`DeliveryID`, `BranchDelivery`, `AddressDelivery`) VALUES
(1, 1, 0),
(2, 1, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `staffinfo`
--

CREATE TABLE `staffinfo` (
  `StaffID` int(55) NOT NULL,
  `StaffName` varchar(55) NOT NULL,
  `StaffSurname` varchar(55) NOT NULL,
  `StaffTitle` varchar(55) NOT NULL,
  `SalaryDetails` int(55) NOT NULL,
  `WorkHours` datetime(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `staffinfo`
--

INSERT INTO `staffinfo` (`StaffID`, `StaffName`, `StaffSurname`, `StaffTitle`, `SalaryDetails`, `WorkHours`) VALUES
(1, 'AHMET ', 'TALHA', '-', 1, '2023-05-01 15:07:28.00000'),
(2, 'KAAN', 'TÜRKERİ', '-', 1, '2023-05-19 08:00:00.00000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `time-info`
--

CREATE TABLE `time-info` (
  `TimeID` int(55) NOT NULL,
  `DeliveredDateofCargo` date NOT NULL,
  `ReceivedDateofCargo` date NOT NULL,
  `EstimatedDeliveryTime` datetime(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `time-info`
--

INSERT INTO `time-info` (`TimeID`, `DeliveredDateofCargo`, `ReceivedDateofCargo`, `EstimatedDeliveryTime`) VALUES
(1, '2023-05-18', '2023-05-18', '2023-05-18 15:08:56.00000'),
(2, '2023-05-19', '2023-05-19', '2023-05-19 08:00:00.00000');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
