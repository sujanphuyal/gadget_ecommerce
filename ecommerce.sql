-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2022 at 02:04 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(11, 'Accessories', 1),
(12, 'Smartphones', 1),
(13, 'Laptops', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(1, 'ram', 'ram@gmail.com', '986464', 'test query', '2021-12-02 16:47:14'),
(2, 'ram', 'ram@gmail.com', '9876543210', 'message sending trail', '2021-12-09 06:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `added_on`) VALUES
(15, 14, 'ktm', 'ktm', 12345, 'COD', 11250, 'pending', 1, '2021-12-16 07:58:10'),
(16, 13, 'btl', 'btl', 1233, 'COD', 33500, 'pending', 1, '2021-12-16 07:59:53'),
(17, 13, 'ghost street', 'ktm', 12345, 'COD', 395000, 'pending', 1, '2021-12-16 08:17:10'),
(18, 14, 'ktm street', 'ktm', 123, 'COD', 33750, 'pending', 4, '2021-12-16 04:20:03'),
(21, 13, 'street', 'ktm', 123, 'COD', 18400, 'pending', 2, '2021-12-20 08:25:28'),
(22, 13, 'ktm street', 'kkktm', 123, 'COD', 199250, 'pending', 1, '2021-12-20 09:46:31'),
(23, 13, 'street', 'hnn', 123, 'COD', 22500, 'pending', 1, '2021-12-20 09:50:21'),
(24, 29, 'street', 'bkt', 123, 'COD', 9200, 'pending', 1, '2021-12-20 11:29:09'),
(25, 13, 'street 11', 'nyk', 12345, 'COD', 202500, 'pending', 1, '2022-01-03 02:00:24'),
(26, 13, 'street', 'ktm', 123, 'COD', 33500, 'pending', 1, '2022-01-03 02:02:04');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(24, 16, 64, 1, 33500),
(25, 17, 63, 3, 19000),
(26, 17, 61, 2, 169000),
(30, 21, 65, 8, 2300),
(32, 22, 62, 2, 94000),
(33, 23, 66, 2, 11250),
(34, 24, 65, 4, 2300),
(35, 25, 61, 1, 169000),
(36, 25, 64, 1, 33500),
(37, 26, 64, 1, 33500);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `product_name` varchar(500) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `best_seller` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `categories_id`, `product_name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `status`) VALUES
(61, 13, 'Acer Predator Helios 300 2021', 177000, 169000, 5, '880766918_acer.jpg', 'i5 10th Gen / RTX 3060 / 8GB RAM / 512GB SSD / 15.6', 'Brand new factory-sealed Acer Predator Helios 300 2021 with 10th Gen Intel Core i5-10300H processor, NVIDIA GeForce RTX 3060 Graphics Card with 6GB of dedicated GDDR6 VRAM, 8GB DDR4 RAM (Expandable up to 32GB), 512GB SSD storage, Additional HDD slot for storage expansion, 15.6-inch IPS display; Full-HD (1920 x 1080 pixels) resolution; 144Hz Refresh Rate; 3ms Overdrive Response Time; 300nit Brightness; 72% NTSC color gamut (Color coverage close to 100% sRGB), 4-Zone RGB Backlit Keyboard, 0.9\" thickness, 5.07 lbs weight, 180watt maximum power supply', 1, 1),
(62, 13, 'Acer Swift 3 2021', 100000, 94000, 2, '297118835_swift.jpg', 'Ryzen 5 5500U / AMD Vega 8 / 8GB RAM / 512GB SSD / 14', 'Brand new factory-sealed Acer Swift 3 2021 with 5000-series AMD Ryzen 5 5500U processor featuring Hexa-core (6-core) CPU, 8GB DDR4 RAM, 512GB SSD storage, 14-inch IPS display with Full-HD (1920 x 1080 pixels) resolution, 300 nits brightness, 72% NTSC color gamut, 100% SRGB color coverage, Fingerprint scanner, Backlight Keyboard, Thin and light ultrabook with 15.9mm thickness and 1.2KG Weight', 1, 1),
(63, 12, 'Xiaomi Redmi 10 Prime', 20000, 19000, 7, '214179988_rredmi.jpg', 'MediaTek Helio G884 GB RAM64 GB internal storage6000 mAh batteryQuad (50+8+2+2) MP Rear, 8 MP Front Camera6.5 inches (16.51 cm)Dual, Nano-Nano SIMAndroid v11', 'Processor	MediaTek Helio G88\r\nDisplay	6.5 inches (16.51 cms)\r\nStorage	64 GB\r\nFront Camera	Single (8 MP, f/2.0 Camera(1.12 m pixel size))\r\nRear Camera	Quad (50 MP, f/1.8 Camera + 8 MP, f/2.2, Wide Angle, Ultra-Wide Angle Camera + 2 MP, f/2.4 Camera(1.75µm pixel size) + 2 MP, f/2.4, depth Camera(1.75µm pixel size))\r\nBattery	6000 mAh\r\nRAM	4 GB\r\nGENERAL\r\nLaunch Date	September 7, 2021\r\nDimensions	6.37 x 2.97 x 0.37 inch (161.9 x 75.5 x 9.5 mm)\r\nWeight	192 grams\r\nFace unlock	Yes\r\nWater Resistant	Yes, Splash proof\r\nColors	Phantom Black, Bifrost Blue, Astral White\r\nPROCESSOR\r\nChipset	MediaTek Helio G88\r\nNo of Cores	8 (Octa Core)\r\nCPU	2GHz, Dual core, Cortex A75 + 1.8GHz, Hexa Core, Cortex A55\r\nArchitecture	64-bit\r\nGraphics	Mali-G52 MC2\r\nSOFTWARE\r\nOperating System	Android v11\r\nCustom UI	MIUI\r\nSTORAGE\r\nInternal Memory	64 GB\r\nRAM	4 GB\r\nExpandable Memory	Yes, microSD, Up to 512 GB (Dedicated)\r\nDISPLAY\r\nResolution	1080 x 2400 pixels\r\nSize	6.5 inches (16.51 cms)\r\nDisplay Type	IPS LCD\r\nAspect ratio	20:9\r\nBezel-less display	Yes, with Punch-hole\r\nBrightness	400 nits\r\nProtection	Corning Gorilla Glass v3\r\nTouchScreen	Yes, Capacitive, Multi-touch\r\nColor Reproduction	16M Colors\r\nScreen to body percentage	83.45 %\r\nPixel Density	405 pixels per inch (ppi)\r\nCAMERA\r\nRear	Quad (50 MP, f/1.8 Camera + 8 MP, f/2.2, Wide Angle, Ultra-Wide Angle Camera + 2 MP, f/2.4 Camera(1.75µm pixel size) + 2 MP, f/2.4, depth Camera(1.75µm pixel size))\r\nFlash	Rear (LED Flash)\r\nFront	Single (8 MP, f/2.0 Camera(1.12µm pixel size))\r\nCamera Features	Auto Flash, Auto Focus, Face detection, Touch to focus\r\nShooting Modes	Continuos Shooting, High Dynamic Range mode (HDR)\r\nVideo	Rear: 1920x1080 @ 30 fps, 1280x720 @ 30 fps, Front: 1920x1080 @ 30 fps, 1280x720 @ 30 fps\r\nBATTERY\r\nType	Li-Polymer\r\nCapacity	6000 mAh\r\nRemovable	No\r\nFast Charging	Yes, 18W\r\nWireless Charging	No\r\nCONNECTIVITY\r\nWi-Fi	Yes with a/ac/b/g/n/n 5GHz\r\nSIM Configuration	Dual SIM (SIM1: Nano) (SIM2: Nano)\r\nBluetooth	Bluetooth v5.1\r\nNetwork	4G: Available (supports Indian bands), 3G: Available, 2G: Available\r\nVoice over LTE(VoLTE)	Yes\r\nWi-fi features	Mobile Hotspot\r\nGPS	Yes with A-GPS, Glonass\r\nInfrared	Yes\r\nUSB	USB Type-C, Mass storage device, USB charging\r\nNFC Chipset	No\r\nSENSORS\r\nFingerprint sensor	Yes, Side\r\nOther Sensor	Light sensor, Proximity sensor, Accelerometer, Compass\r\nSOUND\r\nSpeaker	Yes\r\nAudio Jack	Yes, 3.5mm', 1, 1),
(64, 12, 'Samsung Galaxy F62', 35000, 33500, 3, '182922336_sf62.jpg', 'Samsung Exynos 9 Octa 98256 GB RAM128 GB internal storage7000 mAh batteryQuad (64+12+5+5) MP Rear, 32 MP Front Camera6.7 inches (17.02 cm)Dual, Nano-Nano SIMAndroid v11', 'Processor	Samsung Exynos 9 Octa 9825\\\\r\\\\nDisplay	6.7 inches (17.02 cms)\\\\r\\\\nStorage	128 GB\\\\r\\\\nFront Camera	Single (32 MP, f/2.2, Wide Angle Camera(26 mm focal length, 2.8\\\\\\\" sensor size, 0.8 m pixel size))\\\\r\\\\nRear Camera	Quad (64 MP, f/1.8, Wide Angle Camera + 12 MP, f/2.2, Wide Angle, Ultra-Wide Angle Camera + 5 MP, f/2.4, depth Camera + 5 MP, f/2.4 Camera)\\\\r\\\\nBattery	7000 mAh\\\\r\\\\nRAM	6 GB\\\\r\\\\nGENERAL\\\\r\\\\nLaunch Date	February 16, 2021\\\\r\\\\nDimensions	6.45 x 3 x 0.37 inch (163.9 x 76.3 x 9.5 mm)\\\\r\\\\nWeight	218 grams\\\\r\\\\nBuild	Back: Plastic\\\\r\\\\nFace unlock	Yes\\\\r\\\\nColors	Laser Green, Laser Blue, Laser Grey\\\\r\\\\nPROCESSOR\\\\r\\\\nChipset	Samsung Exynos 9 Octa 9825\\\\r\\\\nNo of Cores	8 (Octa Core)\\\\r\\\\nCPU	2.73GHz, Dual core + 2.4GHz, Dual core, Cortex A75 + 1.95GHz, Quad core, Cortex A55\\\\r\\\\nArchitecture	64-bit\\\\r\\\\nGraphics	Mali-G76 MP12\\\\r\\\\nSOFTWARE\\\\r\\\\nOperating System	Android v11\\\\r\\\\nCustom UI	Samsung One UI\\\\r\\\\nSTORAGE\\\\r\\\\nInternal Memory	128 GB\\\\r\\\\nRAM	6 GB\\\\r\\\\nExpandable Memory	Yes, Up to 1 TB (Dedicated)\\\\r\\\\nDISPLAY\\\\r\\\\nSize	6.7 inches (17.02 cms)\\\\r\\\\nDisplay Type	Super AMOLED Plus\\\\r\\\\nResolution	1080 x 2400 pixels\\\\r\\\\nAspect ratio	20:9\\\\r\\\\nBezel-less display	Yes, with Punch-hole\\\\r\\\\nBrightness	420 nits\\\\r\\\\nProtection	Corning Gorilla Glass v3\\\\r\\\\nTouchScreen	Yes, Capacitive, Multi-touch\\\\r\\\\nColor Reproduction	16M Colors\\\\r\\\\nScreen to body percentage	86.66 %\\\\r\\\\nPixel Density	393 pixels per inch (ppi)\\\\r\\\\nCAMERA\\\\r\\\\nFlash	Rear (LED Flash)\\\\r\\\\nRear	Quad (64 MP, f/1.8, Wide Angle Camera + 12 MP, f/2.2, Wide Angle, Ultra-Wide Angle Camera + 5 MP, f/2.4, depth Camera + 5 MP, f/2.4 Camera)\\\\r\\\\nSensor	Exmor-RS CMOS Sensor\\\\r\\\\nFront	Single (32 MP, f/2.2, Wide Angle Camera(26 mm focal length, 2.8\\\\\\\" sensor size, 0.8µm pixel size))\\\\r\\\\nCamera Features	Auto Flash, Auto Focus, Face detection, Touch to focus\\\\r\\\\nShooting Modes	Continuos Shooting, High Dynamic Range mode (HDR)\\\\r\\\\nZoom	Digital 10 x\\\\r\\\\nVideo	Rear: 3840x2160 @ 30 fps, 1920x1080 @ 30 fps, 1280x720 @ 60 fps, Front: 3840x2160 @ 30 fps, 30 fps\\\\r\\\\nBATTERY\\\\r\\\\nCharging speed	20% to 100% in 01h 40m 22s (in-house tested)\\\\r\\\\nType	Li-ion\\\\r\\\\nCapacity	7000 mAh\\\\r\\\\nRemovable	No\\\\r\\\\nFast Charging	Yes, 25W\\\\r\\\\nTalk time	Up to 50 Hours(4G)\\\\r\\\\nWireless Charging	No\\\\r\\\\nCONNECTIVITY\\\\r\\\\nUSB OTG Support	Yes\\\\r\\\\nWi-Fi	Yes with ac/b/g/n/n 5GHz\\\\r\\\\nSIM Configuration	Dual SIM (SIM1: Nano) (SIM2: Nano)\\\\r\\\\nBluetooth	Bluetooth v5.0\\\\r\\\\nNetwork	4G: Available (supports Indian bands), 3G: Available, 2G: Available\\\\r\\\\nVoice over LTE(VoLTE)	Yes\\\\r\\\\nWi-fi features	Wi-Fi Direct, Mobile Hotspot\\\\r\\\\nGPS	Yes with A-GPS, Glonass\\\\r\\\\nInfrared	Yes\\\\r\\\\nUSB	USB Type-C, Mass storage device, USB charging, USB On-The-Go\\\\r\\\\nNFC Chipset	Yes\\\\r\\\\nSENSORS\\\\r\\\\nFingerprint sensor	Yes, Side\\\\r\\\\nOther Sensor	Light sensor, Proximity sensor, Accelerometer, Gyroscope\\\\r\\\\nSOUND\\\\r\\\\nSpeaker Features	Dolby Atmos\\\\r\\\\nSpeaker	Yes\\\\r\\\\nAudio Jack	Yes, 3.5mm', 0, 1),
(65, 11, 'TP-Link 300Mbps Wireless N Router TL-WR841N', 2500, 2300, 12, '812731776_rrouter.jpg', '300Mbps/ wireless/ two antennas/ compatible with IPv6/ IP based bandwidth control', '300Mbps wireless speed ideal for interruption sensitive applications like HD video streaming*\r\nTwo antennas greatly increase the wireless robustness and stability\r\nEasy wireless security encryption at a push of WPS button\r\nIP based bandwidth control allows administrators to determine how much bandwidth is allotted to each PC\r\nCompatible with IPv6 -the more recent Internet Protocol version\r\nTP-LINK Tether App allows quick installation and easy management using any mobile device', 1, 1),
(66, 11, 'Logitech G403 Prodigy RGB Gaming Mouse', 12000, 11250, 2, '695501084_mousee.jpg', 'Ergonomic, lightweight design/ rubber side grips/ removable 10 gram weight/ optical sensor/ Six programmable buttons and onboard memory', 'Logitech G403 mouse for advanced gaming-grade accuracy and performance\\r\\nErgonomic, lightweight design with rubber side grips and a removable 10 gram weight for supremely comfortable grip and control\\r\\nLogitech’s most advanced optical sensor delivers unbeatable fps mouse accuracy and more\\r\\nCustomize lighting from a palette of 16.8 million colors to match your style and gaming gear\\r\\nSix programmable buttons and onboard memory make it easy to setup and store custom commands for your favorite games\\r\\n1 Year Warranty', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_rating` float NOT NULL,
  `review` text NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_review`
--

INSERT INTO `product_review` (`id`, `product_id`, `user_id`, `product_name`, `product_rating`, `review`, `status`, `added_on`) VALUES
(64, 66, 29, 'Logitech G403 Prodigy RGB Gaming Mouse', 1, '', 1, '2022-01-03 01:56:39'),
(65, 62, 29, 'Acer Swift 3 2021', 2, '', 1, '2022-01-03 01:56:51'),
(66, 61, 29, 'Acer Predator Helios 300 2021', 3, '', 1, '2022-01-03 01:57:07'),
(67, 64, 29, 'Samsung Galaxy F62', 5, '', 1, '2022-01-03 01:57:38'),
(68, 63, 29, 'Xiaomi Redmi 10 Prime', 4, '', 1, '2022-01-03 01:57:47'),
(69, 65, 29, 'TP-Link 300Mbps Wireless N Router TL-WR841N', 2, '', 1, '2022-01-03 01:57:57'),
(70, 66, 13, 'Logitech G403 Prodigy RGB Gaming Mouse', 3, '', 1, '2022-01-03 01:58:42'),
(71, 65, 13, 'TP-Link 300Mbps Wireless N Router TL-WR841N', 4, '', 1, '2022-01-03 01:58:54'),
(72, 62, 13, 'Acer Swift 3 2021', 5, '', 1, '2022-01-03 01:59:26'),
(73, 61, 13, 'Acer Predator Helios 300 2021', 3, '', 1, '2022-01-03 01:59:38'),
(74, 63, 13, 'Xiaomi Redmi 10 Prime', 2, '', 1, '2022-01-03 01:59:49'),
(75, 64, 13, 'Samsung Galaxy F62', 3, '', 1, '2022-01-03 02:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `mobile`, `added_on`) VALUES
(13, 'user', 'user', 'user@user.com', '9876543210', '2021-12-12 06:41:05'),
(29, 'abc', 'abc', 'abc@gmail.com', '1234567891', '2021-12-18 06:09:22');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `added_on`) VALUES
(42, 14, 64, '2021-12-17 12:04:20'),
(43, 14, 63, '2021-12-17 12:04:22'),
(44, 14, 66, '2021-12-17 12:10:33'),
(65, 13, 66, '2022-01-03 02:00:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
