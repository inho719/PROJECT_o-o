-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.35 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- products 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `products`;
USE `products`;

-- 테이블 products.notebook 구조 내보내기
CREATE TABLE IF NOT EXISTS `notebook` (
  `num` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `Maker` varchar(45) DEFAULT NULL,
  `DisplayCm` int DEFAULT NULL,
  `DisplayInch` float DEFAULT NULL,
  `DisplayRes` varchar(45) DEFAULT NULL,
  `CPUMaker` varchar(45) DEFAULT NULL,
  `CPUName` varchar(45) DEFAULT NULL,
  `CPUCore` int DEFAULT NULL,
  `RAM` int DEFAULT NULL,
  `SSD` int DEFAULT NULL,
  `Graphic` varchar(45) DEFAULT NULL,
  `PriceLow` int DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 products.notebook:~35 rows (대략적) 내보내기
REPLACE INTO `notebook` (`num`, `name`, `Maker`, `DisplayCm`, `DisplayInch`, `DisplayRes`, `CPUMaker`, `CPUName`, `CPUCore`, `RAM`, `SSD`, `Graphic`, `PriceLow`) VALUES
(1, 'Apple 2020 맥북 Air 13 M1', 'Apple', 31, 13, '1366x768', 'Apple', 'M1', 8, 8, 256, 'M1 air 13 Core', 1390000),
(2, 'Apple 2020 맥북 Air 13 M2', 'Apple', 31, 13, '1366x768', 'Apple', 'M2', 8, 8, 256, 'M2 air 13 Core', 1590000),
(3, 'Apple 2020 맥북 Pro 13 M1', 'Apple', 33, 14, '1920x1080', 'Apple', 'M1', 8, 8, 256, 'M1 pro 13 Core', 1690000),
(4, 'Apple 2020 맥북 Pro 13 M2', 'Apple', 33, 14, '1920x1080', 'Apple', 'M2', 8, 16, 256, 'M2 pro 13 Core', 1890000),
(5, 'Apple 2020 맥북 Pro Max 13 M2', 'Apple', 36.5, 15.6, '2560x1600', 'Apple', 'M2 Pro', 8, 16, 256, 'M2 pro 13 Core', 2090000),
(6, 'Apple 2021 맥북 Air 14 M1', 'Apple', 33, 14, '1920x1080', 'Apple', 'M1', 8, 8, 256, 'M1 air 14 Core', 1590000),
(7, 'Apple 2021 맥북 Air 14 M2', 'Apple', 33, 14, '1920x1080', 'Apple', 'M2', 8, 8, 256, 'M2 air 14 Core', 1790000),
(8, 'Apple 2021 맥북 Pro 14 M1', 'Apple', 34, 15, '2560x1600', 'Apple', 'M1', 12, 16, 256, 'M1 pro 14 Core', 1890000),
(9, 'Apple 2021 맥북 Pro 14 M2', 'Apple', 38, 17.6, '2560x1600', 'Apple', 'M2 Pro', 10, 16, 512, 'M2 pro 14 Core', 2090000),
(10, 'Apple 2021 맥북 Pro Max 14 M2', 'Apple', 40, 18, '2880x1800', 'Apple', 'M2 Pro', 8, 8, 256, 'M2 pro 14 Core', 2290000),
(11, 'Apple 2021 맥북 Air 15 M1', 'Apple', 33, 14, '1920x1080', 'Apple', 'M1', 8, 8, 256, 'M1 air 15 Core', 1890000),
(12, 'Apple 2021 맥북 Air 15 M2', 'Apple', 33, 14, '1920x1080', 'Apple', 'M2', 8, 8, 256, 'M2 air 15 Core', 2090000),
(13, 'Apple 2021 맥북 Pro 15 M1', 'Apple', 36.5, 15.6, '2880x1800', 'Apple', 'M1 Pro', 12, 24, 512, 'M1 pro 15 Core', 2190000),
(14, 'Apple 2021 맥북 Pro 15 M2', 'Apple', 38, 17.6, '2880x1800', 'Apple', 'M2 Pro', 16, 24, 1024, 'M2 pro 15 Core', 2390000),
(15, 'Apple 2021 맥북 Pro Max 15 M2', 'Apple', 41, 18.6, '3200x1800', 'Apple', 'M2 Pro', 8, 8, 256, 'M2 pro 15 Core', 2790000),
(16, 'Apple 2022 맥북 Air 16 M1', 'Apple', 33, 14, '2560x1600', 'Apple', 'M1', 12, 12, 256, 'M1 air 16 Core', 2690000),
(17, 'Apple 2022 맥북 Air 16 M2', 'Apple', 33, 14, '2560x1600', 'Apple', 'M2', 12, 16, 256, 'M2 air 16 Core', 2890000),
(18, 'Apple 2022 맥북 Pro 16 M1', 'Apple', 40, 18, '3200x1800', 'Apple', 'M1 Pro', 16, 24, 1024, 'M1 pro 16 Core', 3090000),
(19, 'Apple 2022 맥북 Pro 16 M2', 'Apple', 41, 18.6, '3456x2234', 'Apple', 'M2 Pro', 16, 32, 1024, 'M2 pro 16 Core', 3290000),
(20, 'Apple 2022 맥북 Pro 16 Max M2', 'Apple', 43, 19.7, '3840x2160', 'Apple', 'M2 Pro Max', 8, 8, 256, 'M2 pro 16 Core', 3690000),
(21, 'Apple 2017 맥북 Intel Air', 'Apple', 40.6, 14, '1366x768', 'Apple', 'M1', 6, 8, 256, 'Intel Core i4', 780000),
(22, 'Apple 2020 맥북 Intel Air', 'Apple', 33, 14, '1366x768', 'Apple', 'M1', 8, 8, 256, 'Iris Core i7', 980000),
(23, 'Apple 2020 맥북 Intel 13', 'Apple', 33, 14, '1600x900', 'Apple', 'M1', 8, 12, 256, 'Intel Iris 13 Core', 990000),
(24, 'Apple 2019 맥북 Intel 16', 'Apple', 33, 14, '1600x900', 'Apple', 'M1', 8, 8, 256, 'Intel air 16 Core', 1080000),
(25, 'Apple 2021 맥북 Intel 16 Air', 'Apple', 33, 14, '1920x1080', 'Apple', 'M2', 8, 12, 256, 'Intel air 16 Core', 1430000),
(26, 'Apple 2023 맥북 Intel 16 Pro', 'Apple', 33, 14, '1920x1080', 'Apple', 'M2', 12, 12, 256, 'Intel pro 16 Core', 1590000),
(27, 'Apple 2017 iMac', 'Apple', 33, 14, '1366x768', 'Apple', 'M1', 6, 8, 256, 'Iris Core i5', 890000),
(28, 'Apple 2019 Mac mini', 'Apple', 33, 14, '1366x768', 'Apple', 'M1', 6, 8, 256, 'Iris Core i6', 1040000),
(29, 'Apple 2020 Mac studio', 'Apple', 33, 14, '1600x900', 'Apple', 'M1', 6, 8, 512, 'Iris Core i7', 1140000),
(30, 'Apple 2021 Mac pro', 'Apple', 33, 14, '1920x1080', 'Apple', 'M2', 12, 12, 1024, 'Iris Core i8', 1620000);

CREATE TABLE IF NOT EXISTS `iphone` (
`num` int NOT NULL,
`name` varchar(45) DEFAULT NULL,
`Maker` varchar(45) DEFAULT NULL,
`DisplayCm` float DEFAULT NULL,
`DisplayRes` varchar(45) DEFAULT NULL,
`CPUName` varchar(45) DEFAULT NULL,
`CPUCore` int DEFAULT NULL,
`SSD` int DEFAULT NULL,
`RAM` int DEFAULT NULL,
`MaxUseTime` int DEFAULT NULL,
`PriceLow` int DEFAULT NULL,
PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 products.iphone:~35 rows (대략적) 내보내기
REPLACE INTO `iphone` (`num`, `name`, `Maker`, `DisplayCm`, `DisplayRes`, `CPUName`, `CPUCore`, `SSD`, `RAM`, `MaxUseTime`, `PriceLow`) VALUES
(1, 'Apple iPhone 7', 'Apple', 11.9, '1334x750', 'A10 Fusion', 6, 128, 6, 13, 668800),
(2, 'Apple iPhone 7 Plus', 'Apple', 13.9, '1920x1080', 'A10 Fusion', 6, 128, 6, 14, 821700),
(3, 'Apple iPhone 8', 'Apple', 11.9, '1334x750', 'A11 Bionic', 6, 128, 6, 13, 708400),
(4, 'Apple iPhone 8 Plus', 'Apple', 13.9, '1920x1080', 'A11 Bionic', 6, 128, 6, 14, 850300),
(5, 'Apple iPhone X', 'Apple', 14.8, '2436x1125', 'A11 Bionic', 6, 256, 8, 13, 1250000),
(6, 'Apple iPhone XR', 'Apple', 15.4, '1792x828', 'A12 Bionic', 6, 128, 8, 16, 990000),
(7, 'Apple iPhone XS', 'Apple', 14.8, '2436x1125', 'A12 Bionic', 6, 512, 8, 14, 1364000),
(8, 'Apple iPhone XS Max', 'Apple', 16.4, '2688x1242', 'A12 Bionic', 6, 512, 8, 15, 1518000),
(9, 'Apple iPhone 11', 'Apple', 15.4, '1792x828', 'A13 Bionic', 6, 128, 10, 17, 990000),
(10, 'Apple iPhone 11 Pro', 'Apple', 14.8, '2436x1125', 'A13 Bionic', 6, 512, 10, 18, 1375000),
(11, 'Apple iPhone 11 Pro Max', 'Apple', 16.4, '2688x1242', 'A13 Bionic', 6, 512, 10, 20, 1529000),
(12, 'Apple iPhone 12', 'Apple', 15.4, '2532x1170', 'A14 Bionic', 6, 256, 10, 17, 1090000),
(13, 'Apple iPhone 12 mini', 'Apple', 13.7, '2340x1080', 'A14 Bionic', 6, 256, 10, 15, 950000),
(14, 'Apple iPhone 12 Pro', 'Apple', 15.4, '2532x1170', 'A14 Bionic', 6, 512, 10, 17, 1350000),
(15, 'Apple iPhone 12 Pro Max', 'Apple', 17, '2778x1284', 'A14 Bionic', 6, 512, 10, 20, 1490000),
(16, 'Apple iPhone 13', 'Apple', 15.4, '2532x1170', 'A15 Bionic', 6, 512, 10, 19, 1090000),
(17, 'Apple iPhone 13 mini', 'Apple', 13.7, '2556x1179', 'A15 Bionic', 6, 512, 8, 17, 990000),
(18, 'Apple iPhone 13 Pro', 'Apple', 15.4, '2532x1170', 'A15 Bionic', 6, 1024, 12, 22, 1350000),
(19, 'Apple iPhone 13 Pro Max', 'Apple', 17, '2556x1179', 'A15 Bionic', 6, 1024, 12, 28, 1520000),
(20, 'Apple iPhone SE 1', 'Apple', 10.1, '1136x640', 'A9', 6, 128, 8, 13, 540000),
(21, 'Apple iPhone SE 2', 'Apple', 11.9, '1334x750', 'A13 Bionic', 6, 128, 8, 13, 580000),
(22, 'Apple iPhone SE 3', 'Apple', 11.9, '1334x750', 'A15 Bionic', 6, 256, 8, 15, 620000),
(23, 'Apple iPhone 14', 'Apple', 15.4, '2532x1170', 'A15 Bionic', 6, 512, 12, 20, 1240000),
(24, 'Apple iPhone 14 Plus', 'Apple', 17, '2778x1284', 'A15 Bionic', 6, 512, 12, 26, 1350000),
(25, 'Apple iPhone 14 Pro', 'Apple', 15.5, '2556x1179', 'A16 Bionic', 6, 512, 12, 20, 1550000),
(26, 'Apple iPhone 14 Pro Max', 'Apple', 17, '2796x1290', 'A16 Bionic', 6, 1024, 12, 29, 1750000),
(27, 'Apple iPhone 15', 'Apple', 15.5, '2556x1179', 'A16 Bionic', 6, 512, 12, 20, 1250000),
(28, 'Apple iPhone 15 Plus', 'Apple', 17, '2796x1290', 'A16 Bionic', 6, 512, 16, 26, 1350000),
(29, 'Apple iPhone 15 Pro', 'Apple', 15.5, '2556x1179', 'A16 Bionic', 6, 512, 16, 20, 1550000),
(30, 'Apple iPhone 15 Pro Max', 'Apple', 17, '2796x1290', 'A17 Pro', 6, 1024, 16, 29, 1900000);

CREATE TABLE IF NOT EXISTS `airpods` (
`num` int NOT NULL,
`name` varchar(45) DEFAULT NULL,
`Maker` varchar(45) DEFAULT NULL,
`Height` float DEFAULT NULL,
`Width` float DEFAULT NULL,
`Thickness` float DEFAULT NULL,
`Weight` float DEFAULT NULL,
`Chip` varchar(45) DEFAULT NULL,
`Bluetooth` varchar(45) DEFAULT NULL,
`MaxUseTime` int DEFAULT NULL,
`PriceLow` int DEFAULT NULL,
PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 products.airpods:~35 rows (대략적) 내보내기
REPLACE INTO `airpods` (`num`, `name`, `Maker`, `Height`, `Width`, `Thickness`, `Weight`, `Chip`, `Bluetooth`, `MaxUseTime`, `PriceLow`) VALUES
(1, 'Apple 에어팟 1세대', 'Apple', 40.5, 16.5, 18, 4, 'H1', 'Bluetooth 4.0', 4, 159000),
(2, 'Apple 에어팟 2세대 유선 충전', 'Apple', 40.5, 16.5, 18, 4, 'H1', 'Bluetooth 5.0', 5, 199000),
(3, 'Apple 에어팟 2세대 무선 충전', 'Apple', 40.5, 16.5, 18, 4, 'H1', 'Bluetooth 5.0', 5, 229000),
(4, 'Apple 에어팟 3세대 유선 충전', 'Apple', 30.79, 18.26, 19.21, 4.28, 'H2', 'Bluetooth 5.0', 6, 259000),
(5, 'Apple 에어팟 3세대 무선 충전', 'Apple', 30.79, 18.26, 19.21, 4.28, 'H2',  'Bluetooth 5.0', 6, 289000),
(6, 'Apple 에어팟 Pro 유선 충전', 'Apple', 30.9, 21.8, 24, 5.3, 'H2', 'Bluetooth 5.0', 6, 359000),
(7, 'Apple 에어팟 Pro 무선 충전', 'Apple', 30.9, 21.8, 24, 5.3, 'H3', 'Bluetooth 5.0', 6, 389000),
(8, 'Apple 에어팟 Pro 2세대 유선 충전', 'Apple', 30.9, 21.8, 24, 5.3, 'H2', 'Bluetooth 5.0', 8, 379000),
(9, 'Apple 에어팟 Pro 2세대 무선 충전', 'Apple', 30.9, 21.8, 24, 5.3, 'H3', 'Bluetooth 5.0', 8, 399000),
(10, 'Apple 에어팟 MAX 헤드셋', 'Apple', 187.3, 168.6, 83.4, 384.8, 'H4', 'Bluetooth 5.0', 20, 769000),
(11, 'Apple 에어팟 MAX 2 헤드셋', 'Apple', 186.2, 167.1, 82, 381.4, 'H4', 'Bluetooth 5.0', 24, 799000),
(12, 'Apple Beats Studio Buds True', 'Apple', 25.5, 72, 51, 48, 'IPX2', 'Wireless Bluetooth', 24, 199000),
(13, 'Apple Beats Studio Buds+', 'Apple', 25.5, 72, 51, 49, 'IPX4', 'Wireless Bluetooth', 36, 229000),
(14, 'Apple Beats Fit', 'Apple', 28.3, 60, 67, 56, 'H1', 'Bluetooth 5.0', 24, 219000),
(15, 'Apple Beats Fit Pro', 'Apple', 28.5, 62, 62, 55.1, 'H2', 'Bluetooth 5.0', 24, 269000),
(16, 'Apple URBeats', 'Apple', 39, 17, 18, 8, 'W1', 'Bluetooth 4.1', 8, 179000),
(17, 'Apple Beats Flex', 'Apple', 38.7, 17.5, 9.1, 6, 'W1', 'Bluetooth 5.0', 12, 239000),
(18, 'Apple Beats X', 'Apple', 32, 21.1, 6, 14.6, 'H1', 'Bluetooth 5.0', 6, 119000),
(19, 'Apple Powerbeats 1', 'Apple', 23, 55, 39.1, 13, 'H1', 'Bluetooth 5.0', 20, 299000),
(20, 'Apple Powerbeats 2', 'Apple', 24, 57, 37, 13, 'H1', 'Bluetooth 5.0', 24, 319000),
(21, 'Apple Powerbeats 3', 'Apple', 23, 54, 38, 12, 'H2', 'Bluetooth 5.0', 30, 309000),
(22, 'Apple Powerbeats 4', 'Apple', 26, 56, 39.4, 14, 'H2 Pro', 'Bluetooth 5.0', 36, 349000),
(23, 'Apple Powerbeats Pro', 'Apple', 23, 59, 38, 11, 'H2', 'Bluetooth 5.0', 24, 329000),
(24, 'Apple Beats Studio Pro Wireless', 'Apple', 181, 178, 78, 260, 'IPX Pro4', 'Wireless Bluetooth 5.3', 40, 449000),
(25, 'Apple Beats Studio Solo1 Wireless', 'Apple', 178, 168, 86, 245, 'W1', 'Bluetooth 4.0', 28, 199000),
(26, 'Apple Beats Studio Solo2 Wireless', 'Apple', 73, 170, 158, 240, 'W2', 'Bluetooth 4.0', 36, 239000),
(27, 'Apple Beats Studio Solo3 Wireless', 'Apple', 68, 177, 158, 215, 'W2 Pro', 'Bluetooth 5.0', 40, 269000),
(28, 'Apple Beats Flex All Day Wireless', 'Apple', 16, 86.4, 10.6, 18.6, 'W1', 'Bluetooth 5.0', 12, 89000),
(29, 'Apple Beats EP 헤드셋', 'Apple', 170, 168, 80, 382.4, 'H1', 'Bluetooth 5.0', 20, 339000),
(30, 'Apple Beats EP 2세대 헤드셋', 'Apple', 174, 171, 81.2, 392.6, 'H1', 'Bluetooth 5.0', 20, 339000);


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;