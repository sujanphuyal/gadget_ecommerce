-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2022 at 07:11 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

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
(1, 'Accessories', 1),
(2, 'Smartphones', 1),
(3, 'Laptops', 1);

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
(36, 2, 'Suryabinayk-05', 'Bhaktapur', 8080, 'cod', 193000, 'success', 5, '2022-01-30 10:27:52');

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
(47, 36, 90, 1, 193000);

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
(1, 3, 'HP Notebook 14-df0008nx', 12590, 12590, 5, '1.jpg', '14 inch  Intel Celeron N4000  Intel HD Graphics 600  64 GB (eMMC)', 'HP NoteBook 14-DF0010NR is a Windows 10 laptop with a 14.00-inch display that has a resolution of 226x32.4 pixels. It is powered by a Pentium Dual Core processor and it comes with 4GB of RAM. The HP NoteBook 14-DF0010NR packs 128GB of SSD storage.', 0, 1),
(2, 3, 'Lenovo IdeaPad 330S-14IKB', 20990, 18490, 5, '2.jpg', '14 inch  Intel Core i5-8250U  Intel UHD Graphics 620  1 TB HDD', 'Lenovo IdeaPad 330-15IKB is a Windows 10 Home laptop with a 15.60-inch display that has a resolution of 1366x768 pixels. It is powered by a Core i5 processor and it comes with 8GB of RAM. The Lenovo IdeaPad 330-15IKB packs 2TB of HDD storage.\n\nGraphics are powered by AMD Radeon 530 Graphics. Connectivity options include Bluetooth, Ethernet and it comes with 3 USB ports (2 x USB 3.0), Mic In, RJ45 (LAN) ports.', 0, 1),
(3, 3, 'Huawei MateBook D Volta', 37990, 29990, 5, '3.jpg', '14 inch  Intel Core i5-8250U  NVIDIA GeForce MX150 (2 GB)  256 GB SSD', 'Huawei MateBook D Volta-W50D is a Windows 10 laptop with a 12.00-inch display that has a resolution of 1920x1080 pixels. It is powered by a Core i5 processor and it comes with 8GB of RAM. The Huawei MateBook D Volta-W50D packs 256GB of SSD storage.\n\nGraphics are powered by GeForce MX150. Connectivity options include Wi-Fi 802.11 a/b/g/n/ac and it comes with 2 USB ports, HDMI Port, Multi Card Slot ports.', 0, 1),
(4, 3, 'Dell Inspiron 15 3567', 18490, 18490, 5, '4.jpg', '15.6 inch  Intel Core i3-7020U  Intel HD Graphics 620  1 TB HDD', 'Dell Inspiron 15-3567 is a Windows 10 Home laptop with a 15.60-inch display that has a resolution of 1920x1080 pixels. It is powered by a Core i5 processor and it comes with 8GB of RAM. The Dell Inspiron 15-3567 packs 1TB of HDD storage.\n\nGraphics are powered by AMD Radeon R5 M430. Connectivity options include Wi-Fi 802.11 b/g/n, Bluetooth, Ethernet and it comes with 3 USB ports (1 x USB 2.0, 2 x USB 3.0), HDMI Port, Multi Card Slot, Lock Slot, Headphone and Mic Combo Jack, RJ45 (LAN) ports.', 0, 1),
(5, 3, 'Asus VivoBook 15 X510UR', 31490, 24990, 5, '5.jpg', '15.6 inch  Intel Core i7-8550U  NVIDIA GeForce 930MX (2 GB)  1 TB HDD', 'Asus VivoBook 15 X510UF is a Windows 10 laptop with a 15.60-inch display that has a resolution of 1920x1080 pixels. It is powered by a Core i7 processor and it comes with 8GB of RAM. The Asus VivoBook 15 X510UF packs 1TB of HDD storage.\n\nGraphics are powered by Nvidia GeForce MX150. Connectivity options include Wi-Fi 802.11 ac, Bluetooth, Ethernet and it comes with 4 USB ports (2 x USB 2.0, 1 x USB 3.0, 1 x USB 3.0 (Type C)), Mic In ports.', 0, 1),
(6, 3, 'Dell Vostro 5471', 37990, 37990, 5, '6.jpg', '14 inch  Intel Core i7-8550U  AMD Radeon 530 (4 GB)  128 GB SSD/1 TB HDD', 'Dell Vostro 5471 is a Windows 10 Home laptop with a 14.00-inch display that has a resolution of 1920x1080 pixels. It is powered by a Core i5 processor and it comes with 8GB of RAM.\n\nGraphics are powered by AMD Radeon 530 Graphics. Connectivity options include Wi-Fi 802.11 ac, Bluetooth, Ethernet and it comes with 3 USB ports, Multi Card Slot, Mic In, RJ45 (LAN) ports.', 0, 1),
(7, 3, 'Apple MacBook Air (Retina)', 51990, 46490, 5, '7.jpg', '13.3 inch  Intel Core i5 Dual Core  Intel UHD Graphics 617  128 GB (PCIe SSD)', 'Apple MacBook Air (M1, 2020) is a macOS laptop with a 13.30-inch display that has a resolution of 2560x1600 pixels. it comes with 8GB of RAM. The Apple MacBook Air (M1, 2020) packs 512GB of SSD storage.\n\nConnectivity options include Wi-Fi 802.11 a/b/g/n/ac/ax, Bluetooth and it comes with 2 USB ports (2 x Thunderbolt 3 (Type C)), Headphone and Mic Combo Jack ports.', 0, 1),
(8, 3, 'Huawei MateBook D', 27990, 24490, 5, '8.jpg', '15.6 inch  Intel Core i5-8250U  NVIDIA GeForce MX150 (2 GB)  128 GB SSD/1 TB HDD', 'Huawei MateBook D 14 (Ryzen) is a Windows 10 Home laptop with a 14.00-inch display that has a resolution of 1920x1080 pixels. It is powered by a Ryzen 5 processor and it comes with 8GB of RAM. The Huawei MateBook D 14 (Ryzen) packs 256GB of SSD storage.\n\nConnectivity options include Bluetooth and it comes with 4 USB ports, HDMI Port, Headphone and Mic Combo Jack ports.', 0, 1),
(9, 3, 'Huawei MateBook X Pro', 59990, 49990, 5, '9.jpg', '13.88 inch  Intel Core i5-8250U  NVIDIA GeForce MX150 (2 GB)  256 GB NVMe M.2 SSD', 'Huawei MateBook Pro X 2020 is a Windows 10 Home laptop with a 13.90-inch display that has a resolution of 3000x2000 pixels. It is powered by a Core i5 processor and it comes with 8GB of RAM. The Huawei MateBook Pro X 2020 packs 512GB of SSD storage.\n\nConnectivity options include Wi-Fi 802.11 a/b/g/n/ac, Bluetooth and it comes with 3 USB ports (1 x USB 3.0 (Type A), 2 x USB 3.1 Gen 1 (Type C)), Headphone and Mic Combo Jack ports.', 0, 1),
(10, 3, 'HP 14-cf0007nx', 26290, 26290, 5, '10.jpg', '14 inch  Intel Core i5-8250U  AMD Radeon 530 (2 GB)  16 GB (Optane)/1 TB HDD', 'Processor: Intel Core i5-8250U \nRAM: 8GB DDR4 1DM\nHDD: 1TB 5400RPM + 16GB Optane \nGraphics Card: AMD Radeon 530 2GB\nOS: W10 \nScreen Size: 14.0 HD Antiglare slim SVA Narrow Border\nWarranty: 2 Years International\nBattery Life: up to 12 hours\nWeight: 1.51 kg', 0, 1),
(11, 3, 'HP 15-db0001nx', 19990, 19990, 5, '11.jpg', '15.6 inch  AMD A9-9425  AMD Radeon R5  1 TB HDD', 'Intel Core i3, 10th Gen\nRAM: 4 GB\nHDD: 1 TB\nSD Memory Slot\nIntel Graphics: Shared\nScreen Size: 15.6\"\nWindows 10', 0, 1),
(12, 3, 'Acer Swift 5', 59990, 44990, 5, '12.jpg', '14 inch  Intel Core i7-8565U  Intel GMA HD  512 GB SSD', '1 GhzGHz Intel Intel Core i5-1035G1 processor 10th Gen processor\n8GB DDR4X RAM\n512GB SSD\n14-inch screen, Intel UHD Graphics Graphics\nWindows 10 Home operating system\n12 hours battery life, 0.99kg laptop\nProcessor: Intel Core i5-1035G1 processor, turbo up to 3.6 Ghz | Display: 14.0\" display with IPS (In-Plane Switching) technology, Multi-touch display\nRam: 8 GB RAM | Storage: 512 GB NvMe SSD\nPre-installed software: Windows 10 Home | Speciality: 990 Gms, Ultra Thin and Light, Thunderbolt 3, Multi-touch screen, Farfield support, Cortana Enabled, Wake on voice enabled, Mg-Lith Alloy Body\nWarranty: One-year International Travelers Warranty (ITW)\nCountry of Origin: China', 0, 1),
(13, 3, 'Apple MacBook Air', 44990, 33990, 5, '13.jpg', '13.3 inch  Intel Core i5 Dual Core  Intel HD Graphics 6000  128 GB (PCIe Flash)', 'All-Day Battery Life ? Go longer than ever with up to 18 hours of battery life.\nPowerful Performance ? Take on everything from professional-quality editing to action-packed gaming with ease. The Apple M1 chip with an 8-core CPU delivers up to 3.5x faster performance than the previous generation while using way less power.\nSuperfast Memory ? 8GB of unified memory makes your entire system speedy and responsive. That way it can support tasks like memory-hogging multitab browsing and opening a huge graphic file quickly and easily.\nStunning Display ? With a 13.3-inch/33.74 cm Retina display, images come alive with new levels of realism. Text is sharp and clear, and colors are more vibrant.\nWhy Mac ? Easy to learn. Easy to set up. Astoundingly powerful. Intuitive. Packed with apps to use right out of the box. Mac is designed to let you work, play, and create like never before.\nSimply Compatible ? All your existing apps work, including Adobe Creative Cloud, Microsoft 365, and Google Drive. Plus you can use your favorite iPhone and iPad apps directly on macOS. Altogether you?ll have access to the biggest collection of apps ever for Mac. All available on the App Store.\nEasy to Learn ? If you already have an iPhone, MacBook Air feels familiar from the moment you turn it on. And it works perfectly with all your Apple devices. Use your iPad to extend the workspace of your Mac, answer texts and phone calls directly on your Mac, and more.\nFanless Design ? Your MacBook Air stays cool and runs quietly even while tackling intense workloads.\nAppleCare ? Every Mac comes with a one-year limited warranty and up to 90 days of complimentary technical support. Get AppleCare+ to extend your coverage and reduce the stress and cost of unexpected repairs.\nEnvironmentally Friendly ? MacBook Air is made with a 100% recycled aluminum enclosure and uses less energy for a smaller carbon footprint', 1, 1),
(14, 3, 'Acer Swift 5 SF514-52TP-8933', 59990, 48990, 5, '14.jpg', '14 inch  Intel Core i7-8550U  Intel UHD Graphics 620  512 GB SSD', 'Free upgrade to Windows 11 when available*\nThis laptop?s 11th Gen Intel Core i5 processor and 8 GB of LPDDR4X RAM ensure fast computing speeds along with seamless multitasking capabilities. The high-capacity and high-speed PCIe SSD, with a capacity of up to 512 GB, helps you store a plethora of music albums, photos, videos, and more on this laptop.\nThis Acer laptop comes with a 35.56 cm (14) Full HD IPS touchscreen display, with 340 nits brightness and a 100% sRGB gamut, that delivers clear and vivid visuals, be it while watching movies, working on projects, or browsing the Web. Furthermore, this laptop?s narrow bezel and up to 90% screen-to-body ratio, makes it a delight to view any form of content.\nThis laptop?s battery can offer a runtime of up to 17 hours on a single full charge, enabling you to watch your favorite movie and also complete your work task before having to recharge it. If you?re in a hurry, charging this laptop for about 30 minutes will offer a runtime of up to 4 hours, enabling you to complete any last-minute tasks.\nAs we tend to use a laptop for long hours, its surface can have bacteria. The surface of this Acer laptop?s keyboard, chassis, fingerprint reader, hinge, rubber feet, and more come with a BPR- and EPA-compliant silver-ion antimicrobial agent that is proven to show a consistent reduction in the microbial rate against a broad range of bacteria (under the JIS Z 2801 and ISO 22196 test protocol).\nWarranty: The product comes with 1 year of International Travellers Warranty\nThis laptop is equipped with an Intel Integrated Iris Xe graphics processor so that you can work on graphics-rich applications and play games with ease. This laptop comes with unique features, such as wake from sleep in less than 1 second and more, making it a delight to use this commuting device.\nThe screen of this Acer laptop is covered in highly durable antimicrobial corning gorilla glass, making it durable, scratch-resistant, and tough.\nThe keyboard shortcut - Fn+F - helps you switch between different cooling modes, such as silent, normal, or performance, ensuring an optimal computing experience. Also, the dual D6 copper heat pipes and the hinge, help in enhancing this laptop?s performance.', 0, 1),
(16, 3, 'Acer Swift 3 SF314-52G', 43990, 33990, 5, '16.jpg', '14 inch  Intel Core i7-8550U  NVIDIA GeForce MX150 (2 GB)  512 GB SSD', 'Featuring a powerful 11th Gen Intel Core i7 processor, with 16 GB of LPDDR4X RAM, and Intel Iris Xe Max discrete graphics processor, with 4 GB of RAM, this laptop from Acer is here to offer you a powerful computing experience, be it while working at home or when you?re on the move. It also comes with multiple cooling modes (accessible via the Fn + F shortcut), dual heat pipes, and a device-lifting hinge, which helps enhance its performance.\n14\" Full HD (1920 x 1080) IPS Widescreen LED-backlit Display | Intel Iris Xe Max Graphics, supporting LPDDR4X 4GB\n16GB Onboard LPDDR4X Memory and 512 SSD\nEquipped with a 57 WHr Li-ion battery, this laptop can last for 17 hours on a single full charge, enabling you to complete your tasks well on time. In cases of an emergency, you can charge it for about 30 minutes to enjoy a runtime of up to 4 hours.\nYou can connect to your home Wi-Fi network, mobile hotspots, and other wireless networks with ease, thanks to the 2x2 MU-MIMO Wi-Fi 6 (802.11 AX) connectivity and Bluetooth 5.0 support. Not only that, but this Acer laptop also offers a host of connectivity options, two USB 3.2 ports and one USB Type-C port. You can even connect compatible monitors to this laptop, thanks to the HDMI 2.0 port', 0, 1),
(18, 3, 'Apple MacBook Pro (Retina + Touch Bar)', 77690, 69690, 5, '18.jpg', '13.3 inch  Intel Core i5 Quad Core  Intel Iris Plus Graphics 655  256 GB SSD', 'Apple-designed M1 chip for a giant leap in CPU, GPU, and machine learning performance\nGet more done with up to 20 hours of battery life, the longest ever in a Mac\n8-core CPU delivers up to 2.8x faster performance to fly through workflows quicker than ever\n8-core GPU with up to 5x faster graphics for graphics-intensive apps and games\n16-core Neural Engine for advanced machine learning\n8GB of unified memory so everything you do is fast and fluid\nSuperfast SSD storage launches apps and opens files in an instant\nActive cooling system sustains incredible performance\n33.78cm (13.3-inch) Retina display with 500 nits of brightness for vibrant colors and incredible image detail\nFaceTime HD camera with advanced image signal processor for clearer, sharper video calls', 0, 1),
(19, 3, 'Huawei MateBook 13', 49990, 49990, 5, '19.jpg', '13 inch  Intel Core i7-8565U  NVIDIA GeForce MX150 (2 GB)  512 GB SSD', 'Thin, light & portable: weighs only 2.86 pounds (or less with integrated graphics) and measures 11.26? wide x 8.31? deep x .59? high\nFullview touch Display: feels larger than 13? - thin Bezel at only 4.4mm, 88% screen-to-body ratio, 2K (2160x1440) touchscreen, 200ppi, 1000: 1 contrast ratio\nPowerful performance: 8th Gen Intel Core i5 8265U Processor boosts performance up to 40% over its predecessor.\nInnovative cooling design: Huawei Shark fin design 2.0 cooling solution reaches up to 8, 000 revolutions per minute and increases airflow approximately 25% more than conventional laptop fans\nIncludes compact Mate dock 2.0: USB-A port, USB-C port, HDMI port and VGA port. Includes 1 year office 365 personal and 1 year manufacturer warranty', 0, 1),
(21, 3, 'Dell XPS 13 9380', 53990, 46990, 5, '21.jpg', '13.3 inch  Intel Core i5-8265U  Intel UHD Graphics 620  256 GB PCIe NVMe M.2 SSD', '13.3\" FHD (1920x1080) Non-Touch InfinityEdge Display\n8th Generation Intel Core i7-8565U Processor (8MB Cache, up to 4.6 GHz, 4 cores)\n8GB RAM, 256GB PCIe SSD\nEnglish Backlit Keyboard with Fingerprint Reader\nWindows 10 Home 64-Bit, 52WHr 4C Battery', 0, 1),
(22, 3, 'HP Pavilion 13-an0001nx', 39990, 32990, 5, '22.jpg', '13.3 inch  Intel Core i7-8565U  Intel UHD Graphics 620  256 GB PCIe NVMe M.2 SSD', 'TAKE IT ANYWHERE ? With its thin and light design, 6.5 millimeter micro-edge bezel display, and 82% screen to body ratio, you can take this PC anywhere and see more of what you love (1).\nREVOLUTIONARY ENTERTAINMENT ? Enjoy ultra-wide viewing angles and seamlessly perform multi-monitor set-ups with a 15.6-inch, Full HD, IPS, micro-edge, and anti-glare display (2).\nIMPRESSIVE GRAPHICS ? The Intel Iris Xe Graphics gives you a new level of performance with crisp, stunning visuals, plus the convenience of a thin and light laptop (3).\nUNSTOPPABLE PERFORMANCE ? Get things done fast with the 11th Generation Intel Core i5-1135G7 processor, which delivers instant responsiveness and best-in-class connectivity (4).\nMEMORY AND STORAGE ? Get up to 15x faster performance than a traditional hard drive with 256 GB PCIe NVMe M.2 SSD storage and experience improved multitasking with higher bandwidth thanks to 8 GB of RAM (5).\nWORK ON THE GO ? Get work done on the go with a long battery life of up to 7 hours and 15 minutes (6), while HP Fast Charge lets you go from 0 to 50% charge in approximately 45 minutes (7).\nOS AND WARRANTY ? Do more with greater peace of mind thanks to the familiar feel of the Windows 10 Home operating system and the HP 1-year limited hardware warranty (8).\nEFFORTLESSLY CONNECTED ? Enjoy a smoother wireless experience with Wi-Fi 6 (2x2) (9) and Bluetooth 5.0 combo (10). All your connections are solid and up to 3x faster file transfer speeds than Wi-Fi 5, now supporting gigabit file transfer speeds (11) (12).\nREMOTE WORK READY ? Enjoy unparalleled work from home efficiency with a fully integrated keyboard, plus MU-MIMO support for multi-device homes. Plus, video chat with vibrant clarity thanks to the HP True Vision 720p HD camera with integrated dual array digital microphones (13).\nENVIRONMENTAL RESPONSIBILITY ? Stay energy-efficient and sustainable with a laptop that is Energy Star certified (14), EPEAT Silver registered (15), and built with a low halogen display (16).', 0, 1),
(25, 3, 'HP Pavilion 14-ce0001nx', 41990, 35990, 5, '25.jpg', '14 inch  Intel Core i7-8550U  NVIDIA GeForce MX150 (4 GB)  256 GB M.2 SSD/1 TB HDD', '??14\" HD Display?14\" HD(1366 x 768) Display with micro-edge bezel design, WLED-backlit, BrightView, Enjoy your entertainment with the great quality and high-definition detail of 1 million pixels\n??AMD 3000 Series Mobile Processors?AMD 3020e, 2 Cores & 4 Thrades, 1.2GHz Base Clock, 2.6GHz Max Boost Clock, 4MB L3 Cache, 6W TDP, Built in 3 Cores Radeon Graphics, Exprience high performance for all your entertainment\n??Upgraded to 8GB RAM?Substantial high-bandwidth RAM to smoothly run your games and photo- and video-editing applications, as well as multiple programs and browser tabs all at once\n?Upgraded to 64GB emmc + 256GB SSD?Speedy solid-state drive for seanless performance and reliable multitasking, allows you to store a large number of files, improving the reading speed of large files, ensuring daily use and the speed of opening large files, reduce the time of application and file loading\n??Activate 1 Year MS office 365 & Win10 in S mode?(About switch to regular Win10, see the detail in Product description) Activate pre-installed Office: 1.Launch any Office app > 2.Start your activation by signing in with your Microsoft account(Create a account if you don\'t have one yet) > 3.Click \"Activate Office\" > 4.Sign in your account and follow the next prompts. > 5.Complete Step 1,2 and 3 > 6.Click on Refresh once Office is ready > 7.Open a document and accept the license agreement.', 0, 1),
(26, 2, 'OnePlus Nord CE 5G', 46000, 44999, 5, '26.jpg', 'OnePlus Nord CE 5G (8GB RAM, 128GB Storage)', 'Brand: Oneplus\n64MP+8MP+2MP triple rear camera with 1080p video at 30/60 fps, 4k 30 fps | 16MP front camera with 1080p video at 30/60 fps.\n6.43-inch, 90Hz fluid AMOLED display with 2400 x 1080 pixels resolution | 410ppi\nMemory, Storage & SIM: 8GB RAM | 128GB internal memory on UFS 2.1 storage system.\nDual SIM (nano + nano) | OnePlus Nord CE currently supports dual 4G SIM Cards or a single 5G SIM + 4G SIM.\nChipset: Qualcomm Snapdragon 750G 5G mobile platform with an octa-core processor, Kryo 570 CPU (20% improvement from predecessor), and an Adreno 619 GPU (10% improved graphics performance from predecessor).\nAlexa Hands-Free capable: Download the Alexa app to use Alexa hands-free. Play music, make calls, hear news, open apps, navigate and more, all using just your voice, while on-the-go.\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase', 0, 1),
(27, 2, 'Samsung A32 5G', 33000, 31999, 5, '27.jpg', 'Samsung Galaxy Smart Phone Mobile A32 5G 6GBRAM 128GB ROM - Blue', 'Brand:Samsung\nDisplay: 6.4 inches FHD+ Super AMOLED ?Infinity-U? panel\n90Hz refresh rate, Corning Gorilla Glass 5, 800 nits brightness\nChipset: MediaTek Helio G80 (12nm Mobile Platform)\nBattery: 5000mAh with 15W fast charging\nMemory: 6GB RAM/ 128GB storage (expandable up to 1TB)\nRear Camera: Quad-camera: 64MP f/1.8 primary lens, 8MP f/2.2 wide-angle lens, 5MP f/2.4 depth sensor, 5MP f/2.4 macro sensor? LED flash\nFront Camera: 20MP, f/2.2 lens (notch)\nCPU: Octa-core (4?2.0 GHz Kryo 260 Gold & 4?1.8 GHz Kryo 260 Silver)\nSoftware & UI: One UI 3.0 on top of Android 11\nSecurity: In-display fingerprint sensor\nAudio: 3.5mm headphone jack, loudspeaker, Dolby Audio\nConnectivity: Dual-SIM (Nano), WiFi 802.11 a/b/g/n/ac (Dual-band), Bluetooth 5.0, GPS / AGPS / Glonass / Galileo, USB Type-C, 4G LTE\nColor options: Awesome ? Black, Blue, Violet, White\nBody: 6.26 x 2.90 x 0.33 inches, 184 gm\nWarranty:1 Year', 0, 1),
(28, 2, 'Motorola Moto G9 Play', 20000, 19190, 5, '28.jpg', 'Motorola Moto G9 Play [ 4GB RAM, 128GB ROM, 48 MP]', 'Brand:Motorola\nNetwork Technology: GSM / HSPA / LTE, Hybrid Dual SIM (Nano-SIM, dual stand-by)\nBody Dimension: 165.2 x 75.7 x 9.2 mm (6.50 x 2.98 x 0.36 in), Weight: 200 g (7.05 oz)\nBuild: Glass front, plastic back, plastic frame, OS: Android 10\nDisplay: 6.5 inches, IPS LCD, 720 x 1600 pixels, 20:9 ratio (~269 ppi density)\nChipset: Qualcomm SM6115 Snapdragon 662 (11 nm), Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver)\nMemory: RAM: 4GB, Storage: 128GB\nRear Camera: 48 MP, f/1.7, (wide), 1/2.0\", 2 MP, f/2.4, (macro), 2 MP, f/2.4, (depth), LED flash, HDR, panorama, Front camera: 8 MP, f/2.2, 1.12?m\nConnectivity: Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot, Bluetooth 5.0, A2DP, LE, 3.5mm jack, USB Type-C 2.0 , GPS: A-GPS, GLONASS, GALILEO, LTEPP, SUPL\nSensors: Fingerprint (rear-mounted), accelerometer, gyro, proximity\nBattery: Li-Po 5000 mAh, non-removable, Fast charging 20W\n1 Year Brand Warranty', 0, 1),
(29, 2, 'NARZO Mobile 50A', 20000, 19499, 5, '29.jpg', 'NARZO Mobile 50A Helio G85 process 50MP AI Camera 4GB RAM & 64 GB ROM', 'Display: 6.5 inch (1600 x 720 pixels) HD+ IPS\nChipset: MediaTek Helio G85 (12nm)\nCPU: Octa-core (2x2.0 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55)\nGPU: Mali-G52 MC2\nRAM: 4GB\nStorage: 64GB\nExpandable memory up to 256GB\nSIM: Dual SIM (nano+nano + microSD)\nOS: realme UI R Edition based on Android 11\nBack Camera(s): 50MP primary, f/1.8 aperture; 2MP macro, f/2.4 aperture; 2MP B&W, f/2.4 aperture\nFront Camera: 8MP, f/2.0 aperture\nSecurity: Fingerprint + Face-unlock -Fingerprint (rear-mounted)\nAudio: 3.5mm audio jack\nDimensions: 164.5 x 76 x 9.1 mm, Weight: 200g\nSupport: 4G, Bluetooth 5.0, A-GPS/GLONASS/ BDS\nmicroUSB 2.0\nBattery: 6000mAh with 18W Quick charge\nColour Option:Oxygen Blue ', 0, 1),
(30, 2, 'Samsung Galaxy M62', 41000, 39999, 5, '30.jpg', 'Samsung Galaxy Smart Phone Mobile M62 M625F/1DN (6/128GB) 6GB RAM 128GB ROM', 'Brand:Samsung\nRAM:6 GB\nInternal Memory:128 GB\nProcessor:Samsung Exynos 9 Octa 9825\nRear Camera:64 MP + 12 MP + 5 MP + 5 MP\nFront Camera:32 MP\nBattery:7000 mAh\nDisplay:6.7 inches\nOperating System:Android v11\nCustom UI:Samsung One UI\nChipset:Samsung Exynos 9 Octa 9825\nCPU:Octa core (2.73 GHz, Dual core + 2.4 GHz, Dual core, Cortex A75 + 1.95 GHz, Quad core, Cortex A55)\nArchitecture:64 bit\nFabrication:7 nm\nGraphics:Mali-G76 MP12\nDisplay Type:Super AMOLED Plus\nScreen Size:6.7 inches (17.02 cm)\nResolution:1080 x 2400 pixels\nAspect Ratio:20:9\nPixel Density:393 ppi\nScreen to Body Ratio (calculated):86.66 %\nBezel-less display:Yes with punch-hole display\nTouch Screen:Yes, Capacitive Touchscreen, Multi-touch\nBrightness:420 nits\nHeight:163.9 mm \nWidth:76.3 mm\nThickness:9.5 mm\nWeight:218 grams\nCamera Setup        Quad\nResolution        64 MP f/1.8 (upto 10x Digital Zoom), Wide Angle (81? field-of-view) Primary Camera\n(26 mm focal length, 1.7\" sensor size, 0.8?m pixel size)\n12 MP f/2.2, Wide Angle, Ultra-Wide Angle Camera\n5 MP f/2.4, Macro Camera\n5 MP f/2.4, Depth Camera\nAutofocus        Yes\nOIS        No\nFlash        Yes, LED Flash\nImage Resolution        9000 x 7000 Pixels\nSettings        Exposure compensation, ISO control\nShooting Modes        Continuos Shooting\nHigh Dynamic Range mode (HDR)\nCamera Features        10 x Digital Zoom\nAuto Flash\nFace detection\nTouch to focus\nVideo Recording        3840x2160 @ 30 fps\n1920x1080 @ 30 fps\nFRONT CAMERA\nCamera Setup        Single\nResolution        32 MP f/2.2, Wide Angle Primary Camera\n(26 mm focal length, 2.8\" sensor size, 0.8?m pixel size)\nAutofocus        No\nFlash        No\nVideo Recording        3840x2160 @ 30 fps\n1920x1080 @ 30 fps\nCapacity        7000 mAh\nType        Li-ion\nRemovable        No\nTalkTime        Up to 50 Hours(4G)\nQuick Charging        Yes, Fast, 25W\nUSB Type-C        Yes\nExpandable Memory        Yes, Up to 1 TB\nUser Available Storage        Up to 103 GB\nSIM Slot(s)        Dual SIM, GSM+GSM\nSIM Size        SIM1: Nano, SIM2: Nano\nNetwork Support        4G (supports Indian bands), 3G, 2G\nVoLTE        Yes\nSIM 1        4G Bands:TD-LTE 2600(band 38) / 2300(band 40) / 2500(band 41)\nFD-LTE 2100(band 1) / 1800(band 3) / 2600(band 7) / 900(band 8) / 700(band 28) / 1900(band 2) / 1700(band 4) / 850(band 5) / 700(band 17) / 800(band 20) / 850(band 26)3G Bands:UMTS 1900 / 2100 / 850 / 900 MHz2G Bands:GSM 1800 / 1900 / 850 / 900 MHz\nGPRS:AvailableEDGE:Available\nSIM 2        4G Bands:TD-LTE 2600(band 38) / 2300(band 40) / 2500(band 41)\nFD-LTE 2100(band 1) / 1800(band 3) / 2600(band 7) / 900(band 8) / 700(band 28) / 1900(band 2) / 1700(band 4) / 850(band 5) / 700(band 17) / 800(band 20) / 850(band 26)3G Bands:UMTS 1900 / 2100 / 850 / 900 MHz2G Bands:GSM 1800 / 1900 / 850 / 900 MHz\nGPRS:AvailableEDGE:Available\nWi-Fi        Yes, Wi-Fi 802.11, a/ac/b/g/n\nWi-Fi Features        Wi-Fi Direct, Mobile Hotspot\nBluetooth        Yes, v5.0\nGPS        Yes with A-GPS, Glonass\nNFC        Yes\nUSB Connectivity        Mass storage device, USB charging\nLoudspeaker        Yes\nAudio Jack        3.5 mm\nFingerprint Sensor        Yes\nFingerprint Sensor Position        Side\nOther Sensors        Light sensor, Proximity sensor, Accelerometer, Gyroscope\ncolour available: Black, Blue & Green\nWarranty:1 Year', 0, 1),
(31, 2, 'NARZO 50i  ', 15000, 12999, 5, '31.jpg', 'NARZO 50i 5000 mAh Battery 6.5\" HD+ Display Mobile, 2/32 GB', 'Screen: 6.5 Inch (720x1600) HD+ LCD, Dewdrop notch\nOS: realme UI Go Edition based on Android 11\nProcessor: Octa-Core Processor\nCamera: Rear: 8 MP (f/2.0); Front Camera: 5 MP (f/2.2)\nRAM: 2 GB ; ROM: 32 GB\nExpandable Memory: 256GB\nSupport: 4G\nBattery: 5000 mAh Big Battery (43 days standby)\nSim: Dual Sim\nExtra: Face Unlock, Google Smart Lock\nColour option : Oxygen green, Carbon Black ', 0, 1),
(32, 2, 'Moto E7 Power', 13000, 12479, 5, '32.jpg', 'Moto E7 Power RAM: 2GB/ Storage: 32GB 5000 mAh Battery & 6.53 inch Display', 'Brand:Motorola\nNetwork Technology: GSM / HSPA / LTE, Hybrid Dual SIM (Nano-SIM, dual stand-by)\nBody Dimension: 165.1 x 75.9 x 9.2 mm (6.5 x 2.99 x 0.36 in) | Weight: 200 g (7.05 oz)\nOS: Android 10 | Build: Glass front, plastic back, plastic frame\nDisplay: 6.51 inches IPS LCD720 x 1600 pixels, 20:9 ratio (~269 ppi density)\nChipset: MediaTek Helio G25 (12 nm), Octa-core (4x2.0 GHz Cortex-A53 & 4x1.5 GHz Cortex-A53), PowerVR GE8320\nRAM: 2 GB | Storage: 32 GB\nRear Camera: \"13 MP, f/2.0, 26mm (wide), 1/3.1\"\", 1.12?m, PDAF 2 MP, f/2.4, (macro)LED flash\" | Front camera: 5 MP, f/2.2, 27mm (wide), 1.12?m\nConnectivity: Wi-Fi 802.11 b/g/n, hotspot, Bluetooth 5.0, A2DP, LE, USB Type-C 2.0, USB On-The-Go, GPS with A-GPS, GLONASS, GALILEO 3.5mm jack\nSensors: Fingerprint (rear-mounted), accelerometer, proximity\nBattery: Li-Ion 5000 mAh\n1 Year Brand Warranty', 0, 1),
(33, 2, 'Samsung Galaxy M31', 30000, 28999, 5, '33.jpg', 'Samsung Galaxy M31 Mobile [6GB RAM - 128GB ROM] Black', 'Samsung Galaxy M31 [6GB RAM - 128GB ROM]\nDisplay 6.40-inch (1080x2340)\nProcessor\nSamsung Exynos 9611\nFront Camera 32MP \nRear Camera 64MP + 8MP + 5MP + 5MP\nRAM 6 GB\nStorage 128GB\nBattery Capacity 6000mAh\nOS Android 10', 0, 1),
(34, 2, 'Black Shark 3', 95000, 93565, 5, '34.jpg', 'Black Shark 3 [ 5G Gaming Phone, 12GB RAM, 256GB ROM, \"Sandwich\" Liquid Cooling System, 90Hz Refresh Rate, 65W Dual Battery Hyper charge]', 'Black Shark 3 5G // Gaming trigger ON\nDynamic RGB Light\n5G Fast & Stable connection\n90Hz Refresh Rate\nFront Facing Dual Speaker\nPowerful Qualcomm Snapdragon 865\n12GB LPDDR5 RAM\n256GB UFS 3.0 Storage\nRevolutionary Sandwich Cooling System\n4720mAh Battery - 65Watt Super Fast Hyper Charge // magnetic charging port\n3.5mm Headphone Jack\n64MP Triple rear camera\nBrand: Black Shark\nScreen Size (inches): 6.1 - 6.5 Inch\nBody Type: Glass\nNumber Of Cameras: 3\nProtection: Glass\nYear:2020\nPhone Type:Smartphone\nFast Charging:Yes\nWireless Charging: Not Specified', 0, 1),
(35, 2, 'Huawei Mobile Y7p ', 21000, 19990, 5, '35.jpg', 'Huawei Mobile Y7p [ 4 GB RAM, 64 GB ROM ] With Huawei Mobile Services, Explore it on Huawei App Gallery and Petal Search Black', 'OS: Android 9.0 (Pie), EMUI 9, no Google Play Services\nGSM / HSPA / LTE, Hybrid Dual SIM (Nano-SIM, dual stand-by)\nBody Dimension: 159.8 x 76.1 x 8.1 mm (6.29 x 3.00 x 0.32 in), Weight: 176 g (6.21 oz), Build: Glass front, plastic back, plastic frame\nDisplay: 6.39 inches, IPS LCD, 720 x 1560 pixels, 19.5:9 ratio (~269 ppi density)\nKirin 710F (12 nm), Octa-core (4x2.2 GHz Cortex-A73 & 4x1.7 GHz Cortex-A53), GPU: Mali-G51 MP4\n4GB RAM, Storage: 64GB, microSDXC (uses shared SIM slot)\nFront Camera: 8 MP, f/2.0, Rearcamera: \"48 MP, f/1.8, 27mm (wide) + 8 MP, f/2.4, (ultrawide) + 2 MP, f/2.4, (depth)\"\nConnectivity: Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot, Bluetooth 5.0, A-GPS, GLONASS, GALILEO, BDS, microUSB 2.0, 3.5mm jack\nSensors: Fingerprint (rear-mounted), accelerometer, proximity, compass\nBattery: Li-Po 4000 mAh, non-removable', 0, 1),
(36, 2, 'oneplus smartphone', 78999, 75839, 5, '36.jpg', 'oneplus smartphone (8GB Ram 128GB Storage)', 'Brand: Oneplus \nRear quad camera setup having 48MP main camera with Sony IMX586 sensor, 16MP ultra wide angle Lends, 5MP macro lens, 2MP monochrome lens | 16MP front camera with Sony IMX471 sensor\n16.63 centimeters (6.55 inch) 120Hz fluid AMOLED capacitive touchscreen with 2400 x 1080 pixels resolution, 402 ppi pixel density\nOxygenOS based on Android v11 operating system with 2.86GHz Qualcomm Snapdragon 865TM with Adreno 650 GPU quad core processor\nMemory, Storage & SIM: 8GB RAM | 128GB internal memory expandable up to 128GB | Dual SIM (nano+nano) dual-standby (5G+4G)\n4500mAH lithium-polymer battery\n120 Hz fluid Amoled display, Qualcomm Snapdragon 865, Warp Charge 65 , OxygenOS based on Android 11, Adreno 650 GPU\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase', 0, 1),
(37, 2, 'SAMSUNG Galaxy S21', 111000, 109999, 5, '37.jpg', 'SAMSUNG Galaxy S21 ( 256 GB, 8 GB RAM)', 'Brand: Samsung\n8 GB RAM | 256 GB ROM\n15.75 cm (6.2 inch) Full HD+ Display\n64MP + 12MP + 12MP | 10MP Front Camera\n4000 mAh Lithium-ion Battery\nExynos 2100 Processor\n1 Year Manufacturer Warranty', 1, 1),
(38, 2, 'Samsung Galaxy Z Fold 2', 252000, 249999, 5, '38.jpg', 'Samsung Galaxy Z Fold 2 (F9 16GB/256GB)', 'Brand: SAMSUNG\nOperating system:  Android\nMemory storage capacity :  16GB /256 GB\nProduct dimensions : 6.8 x 6 x 2.6 inches\nRefined 2-in-1 Design - A revolutionary new mobile experience with expansive on-demand viewing, seamless interactivity, and cinematic displays; folded, it\'s a cell phone - unfolded, it\'s a tablet\nAdaptive Flexible Mode: Capture hands-free photos and videos from any angle, and control Android apps using both halves of the large screen; preview in one half and video chat, record, browse, edit and more on the other screen\nProductivity and Gaming: The latest Galaxy cell phone offers seamless hardware and software integration, so you can multitask while using multiple apps; Enjoy wireless DeX productivity, allowing you to use one monitor or TV as a second to show for play, work and more\nPower: Advanced processor and impressive 12GB RAM give you fast and powerful performance for smooth multitasking and low lag gaming, and 256GB internal storage gives your cell phone the space to store it all\n5G Connectivity - Get next-level power for everything you love to do with Galaxy Z Fold 5G; share more, play harder, experiment more and never miss a beat', 0, 1),
(39, 2, 'OnePlus 9', 104999, 100799, 5, '39.jpg', 'OnePlus 9 ( 12GB RAM, 256GB Storage)', 'Brand: Oneplus\nRear Triple Camera Co-Developed by Hasselblad, 48 MP Main camera, 50 MP Ultra Wide Angle Camera with Free Form Lens, 2 MP Monochorme Lens. Also comes with a 16 MP Front Camera\nQualcomm Snapdragon 888 Processor with Adreno 660 GPU\n6.55 Inches Fluid AMOLED Display with 120Hz refresh rate\nOnePlus Oxygen OS based on Andriod 11\nComes with 4500 mAh Battery with 65W Wired Charging\nHands-Free access to Alexa: Alexa on your phone lets you make phone calls, open apps, control smart home devices, access the library of Alexa skills, and more using just your voice while on-the-go. Download the Alexa app and complete hands-free setup to get started. Just ask - and Alexa will respond instantly\nWarranty: 1 year ', 0, 1),
(40, 2, 'OPPO F15', 60000, 58000, 5, '40.jpg', 'OPPO F15 6.53inch 8GB Ram 128GB Rom 48mp+8mp+2mp+2mp Rear 16mp Front Camera', 'Display 6.40-inch (1080?2400)\nProcessorMediaTek Helio P70\nFront Camera 16MP\nRear Camera 48MP + 8MP + 2MP + 2MP\nRAM 8GB\nStorage 128GB\nBattery Capacity4000mAh\nOSAndroid', 0, 1),
(41, 2, 'OnePlus Nord 5G', 63999, 51439, 5, '41.jpg', 'OnePlus Nord 5G (12GB RAM, 256GB Storage)', 'Brand:Oneplus \n48MP+8MP+5MP+2MP quad rear camera with 1080P Video at 30/60 fps, 4k 30fps | 32MP+8MP front dual camera with 4K video capture at 30/60 fps and 1080 video capture at 30/60 fps\n6.44-inch 90Hz fluid Amoled display with 2400 x 1080 pixels resolution | 408ppi\nMemory, Storage & SIM: 12GB RAM | 256GB internal memory | Dual SIM (nano+nano) | OnePlus Nord currently support dual 4G SIM Cards or a Single 5G SIM. 5G+4G support will be available via OTA update at a future date\nOxygenOS based on Android 10 operating system with 2.4GHz Kryo 475 Prime + 2.2GHz Kryo 475 Gold + 6x1.8GHz Kryo 475 Silver Qualcomm Snapdragon 765G 5G mobile platform octa core processor, Adreno 620 GPU\n4115mAH lithium-ion battery | In-Display fingerprint sensor\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\nCorning Gorilla Glass 5 | 12GB GB LPDDR4X, 256GB UFS 2.1', 0, 1),
(42, 2, 'Nokia 105 ', 2899, 2300, 5, '42.jpg', 'Nokia 105 Single Sim (2019) 4Th Edition', 'Model Number: NOKIA105\nType:Keypad Phone\nDisplay Type: TFT,65K colors\nDisplay Size:1.77 inches, 9.7 cm2(~16.6% screen-to-body ratio)\nDisplay Resolution:120 x 160 pixels, 4:3 ratio (~113 ppi density)\nSim: Single Sim\nCamera:No\nEarphone Jack: 3.5mm Jack\nLoudspeaker:Yes\nInternal Memory:4MB, 4MB RAM\nExternal Memory:No\nBluetooth: No\nRadio: FM Radio\nUSB Port: Micro USB 2.0 (for charging only)\nBattery Capacity: 800mAh (Removable Li-Ion)', 0, 1),
(43, 2, 'Sony Xperia 10 III Lite', 49000, 48300, 5, '43.jpg', 'Sony Xperia 10 III Lite', 'Sony Xperia 10 III Lite mobile was launched on 21st August 2021. The phone comes with a 6.00-inch touchscreen display with a resolution of 1080x2520 pixels and an aspect ratio of 21:9. Sony Xperia 10 III Lite is powered by an octa-core Qualcomm Snapdragon 690 processor. It comes with 6GB of RAM. The Sony Xperia 10 III Lite runs Android 11 and is powered by a 4500mAh battery.\n\nAs far as the cameras are concerned, the Sony Xperia 10 III Lite on the rear packs a triple camera setup featuring a 12-megapixel primary camera with an f/1.8 aperture; an 8-megapixel camera with an f/2.4 aperture, and an 8-megapixel camera with an f/2.2 aperture. It has a single front camera setup for selfies, featuring an 8-megapixel sensor with an f/2.0 aperture.', 0, 1),
(44, 2, 'Iphone 13 Pro', 153000, 153000, 5, '44.jpg', 'Iphone 13 Pro', 'In the last decade smartphone industry has grown a lot in the market of electronics. Companies Like (Redmi, Samsung, Apple, Realme, Oneplus) took it to the another level. It is the most loved & used gadgets around the globe. And this pandemic has made everyone use it on regular basis. It has consumer\'s from different age levels (from a new born baby to the old age). Different person use it for different purposes, Mostly it was used for phone calls but with the evolution of technology now it offers many features. It provides camera with high Megapixels, storage with big space (external memory card slot), Display\'s with higher resolutions & bigger screen (better video experience), Powerful processor, Long lasting battery, Quick charging features etc. makes it most used & loved gadget. Many manufacturer from different country (China, USA, South Korea, Japan, India) always try to produce better phones with their knowledge. Smartphone companies always try to minimize the price to get better result in term of sale. Smartphones cameras are evolving day by day, most people choose smartphone over DSLR cameras for easy click and good result and the front cameras that makes easier to take selfies with the help of HDR technology. The company\'s are upgrading their phones every new model. Mobile phones now supports games with high graphics which is super cool. A lot of people loves gaming in smartphone. Power ful Processors allow the smartphone to give good experience to users. Big Storage capacity provide long screen-time to users. Nowadays most companies adapted the fast charging technology with the regular charger which helps users to charge their phone faster. Mobile phone\'s speakers are good for listening music too.', 0, 1),
(45, 2, 'Iphone 12 pro Max', 185900, 179900, 5, '45.jpg', 'Iphone 12 pro Max', 'Body: Textured matte glass back, Stainless steel frame, 228 grams\n\nDimensions: 6.33H x 3.07W x 0.29-inches\n\nDisplay: 6.7-inch (2778 ? 1284 pixels) OLED Super Retina XDR display, 458ppi, Ceramic Shield protection\n\nChipset: Six-core A14 Bionic 64-bit processor, 16-core Neural Engine\n\nStorage: 128\n\nOperating System: iOS 14\n\nSIM: Dual SIM (nano + eSIM)\n\nBack Camera: Triple:\n? Ultra-wide: 12MP f/2.4, 120? FOV, 5-elements lens, 13mm focal length\n? Wide: 12MP f/1.6, 7-elements lens, 26mm focal length, 1.7?m pixels, Sensor-shift OIS\n? Telephoto: 12MP 6-elements lens, OIS, f/2.2, 65mm focal length\n? LiDAR scanner for AR workloads, night portraits, etc.\n\nFront Camera: 12MP TrueDepth camera with f/2.2 aperture\n\nSecurity: TrueDepth camera for FaceID facial recognition\n\nConnectivity: 5G (sub-6GHz and mmWave), Gigabit LTE with 4?4 MIMO and LAA, 802.11ax Wi?Fi 6 with 2?2 MIMO, Bluetooth 5.0, NFC, GPS with GLONASS, GLONASS, Galileo, QZSS, and Beidou, Ultra-Wideband chip\n\nOther features: Water and dust-resistant (IP68), Stereo speakers\n\nBattery: 3687mAh; 20W fast charging, 7.5W Qi Wireless Charging; 15W MagSafe Wireless Charger (No charger included in the box)', 1, 1),
(46, 1, 'Lavalier Wireless Microphone Mic', 25999, 11899, 5, '46.jpg', 'Boya By-Wm4 Universal Lavalier Wireless Microphone Mic With Real-Time Monitor For Iphone/Smartphone/Ipad/Tablet/Dslr', 'BOYA BY-WM4 is a compact wireless microphone system, providing reliable and trouble-free performance for Smartphone holders\nIt can work with Smartphone, iPad, Tablet, DSLR camera, Camcorder, Audio recorder, PC and others audio/video devices\nAlso work for DSLR, Small recorder, Audio Recorder, PC, etc.\nUp to 15m (49ft) operation range\nPower requirements: 1.5V DC, ie. AA size battery (not included)\nAudio input connector: 3.5mm mini jack\nClear recording sound\nCompatiable with smartphones, DSLR cameras, Consumer Camcorders, PCs etc.\nLight and compact for easy carrying\nOmnidirectional lavalier microphone\nHard case included\nStandard camera shoe mount and clip included\nPower requirements: 1.5V DC, ie. AA size battery (not included)\nAudio input connector: 3.5mm mini jack\nOperation range: 15m (49ft.', 0, 1),
(47, 1, 'Wireless Charger Pad', 2000, 1499, 5, '47.jpg', 'LDNIO AW001 Super - Thin 10W Wireless Charger Pad,Fast Charge Built-in Bedside Lamp for Mobile Desktop Base Compatible for Samsung Compatible for iPhone', 'Heat-dissipation design, auto cut off power when excess termperature. Pure copper coil, wireless charging,\nNew generation LD-wireless chip, compatible with all phones that support wireless charging in the market. Charging even with phone shell, can charge for both Compatible for android mobile and Compatible for iPhone.\nWhite with red color, simple and fashion, white color matches interior design.\n10W output for fast charging, its output power depends on input power.\nLED beside lamp, the built-in LED can be regarded as bedside lamp, wireless charger with lamp, warm and soft LED ligh gently company with your every evening.', 0, 1),
(48, 1, '3 USB EU Travel Charger', 1650, 1650, 5, '48.jpg', 'BASEUS Brand Mirror Charging Monitoring Intelligent Digital Display 3 USB EU Travel Charger 3.4A For iPhone Samsung Mobile Phone', 'Mirror Lake Intelligent Digital display travel charger\nSing port up to 2.4A large current\nHigh-power charging no queue and multi device charging and saves time\nMini portable body and easy to storage\nSupport mobile phone flat panel power bank and for Apple/Samsung/Huawei/Mi\nSafety protection from the inside out\nCharging process starts multiple protections at the same time to ensure safety without damaging the phone', 0, 1),
(49, 1, 'Stylus Pen ', 499, 100, 5, '49.jpg', 'Stylus Pen Red Universal Touch Screen Capacitive Stylus for Kindle Touch ipad iPhone 6/6s 6Plus 6s Plus S5 S6 S7 Edge', 'No more big fingers    :  A stylus has a better touch point than the tip of your finger giving better accuracy to little touch focuses like keys on the console. No more big finger troubles.\n Anti -scratch tip:   Liberrway stylus tip was made of soft, and scratch resistant rubber. Fingerprint resistant and anti-stick screen tip, great for drawing writing etc. We have update the tip and stylus, tip will not come off and stylus will not scratch the screen any more. If you still have question about it, please contact us anytime.\n Easy to carry  :  It is very light and compact. Clip design is great for clipping in your pocket, ipad, diary, etc.\n Share them to your friends - Get 10 of stylus with an unbeatable price instead of high price apple pencil or samsung pencil. You can share this stylus pen to your friends or family.\n 1 years warranty ! :   This stylus fits for all kinds of touch screen, like iPhone 4S 5S 6/6s 6Plus 6s Plus/ iPad Samsung S7 S7 Edge S6 Edge Plus S5 Note 2 3 4 5/ Kindle 2/3/4/ Kindle Fire.', 0, 1),
(50, 1, 'Stand Holder/ Tripod', 699, 199, 5, '50.jpg', 'Stand Holder/ Tripod ( for Mobile Phone OPPO,VIVO,MI,LAVA,HUWAWEI,SAMSUNG,REALME,IPHONE )', 'Stable & Reliable :Offering reliable stability, this mini tripod from mStick keeps your camera in place-no more stacking books or precarious setups. The mini tripod makes it easy to take timed shots (so you can be in the photo, too) and higher resolution pics (no need for a steady hand).\nJust The Right Angle :The tripod\'s 1/4-inch screw ensures secure mounting of the camera or other imaging device (not included), while its mini ball head allows for 90-degree tilt. Get just the right angle in one smooth move; simply turn and tighten.\nOptimal Height:Extend the legs-from 12.2cm-17.2cm Approx -to tailor the height of the tripod as needed. The mini tripod\'s three sturdy legs angle outward for maximum stability and feature rubber feet for skid-proof placement on any surface.\nLightweight Your On The Go Buddy:Thanks to its small size and lightweight design, the mini tripod comes in handy when traveling. When not in use, the mini tripod\'s legs close together for compact storage. Whether it\'s business travel, outdoor adventures, or family trips, the AmazonBasics mini tripod makes for a must-have, take-along accessory.', 0, 1),
(51, 1, 'Apple MFi Certified Dual Lightning iPhone Splitter', 1500, 1399, 5, '51.jpg', 'Apple MFi Certified Dual Lightning iPhone Splitter,2 in 1 Dual Lightning Headphone Jack Audio + Charge Cable Compatible for iPhone 11/11 Pro/XS/XR/X 8 7,iPad,Sync Data + Music Control', 'Quality Guarantee: - The adapter uses high-quality ABS material, the latest version of the chip for manufacturing. Exquisite and compact appearance.Recommended gifts to family and friends.\nHI-RES Audio and DAC Chip : Supports up to 24-bit / 48 kHz audio output. In addition, it not only supports music loading and listening, but also remote controls and microphones. Audio and loading are synchronized\nHIGH QUALITY : 100% copper wire core to provide you with high speed and stable signal transmission and lossless digital sound quality. High quality aluminum alloy oxidation shell is more wear resistance and corrosion resistance, improve the anti-interference ability. Allow you to enjoy clear and faithful sound quality and fast filling experience.\nExtensive Compatibility : Suitable iPhone 7/ 7Plus / iPhone 8/ 8Plus / iPhone X/10 / iPhone Xs Max / iPhone XS / iPhone XR, compatible with iOS 10.3 / 11 / 12 or higher. It contains a decoder chip so you don\'t have to worry about system upgrades.\nMulti-function: You will be able to charge your iphone and listen to music with a headphone or earphone at the same time Our 2 in 1 Adapter support music control and phone calls', 0, 1),
(52, 1, '3.5mm Audio Jack Stereo Headphone Splitter', 250, 175, 5, '52.jpg', '3.5mm Audio Jack Stereo Headphone Splitter Cable Adapter for iPhone iPad iPod', 'Color: show as pictures (other colors available, please visit our store for more).\n1 x audio splitter cable\nBrand new, Lightweight, high quality stereo 3.5mm plug\nListen to your iPod songs with 2 different headsets\nEnable you to share or songs with your friends without sharing your earphone\nType: Non-OEM /Aftermarket items Accessory ONLY; Apple does not endorse use of these products', 0, 1),
(53, 1, 'Iphone Xs Max Adaptor', 800, 600, 5, '53.jpg', 'Iphone Xs Max Adaptor', 'Featuring an ultra-compact design\nThispower adapter offers fast, efficient charging at home, in the office or on the go.\nIt works with any Apple Watch, iPhone or iPod model.\nThis USB Power Adapter has fixed prongs for use in the United Kingdom, Ireland, Hong Kong, Singapore and Malaysia.\nCharging cable sold separately.', 0, 1),
(54, 1, 'iphone Cable', 456, 397, 5, '54.jpg', 'Joyroom Creative series iphone Cable (S-1030N1) red', 'Weight 300g 5000 times subjected height swing test\nInterface can bear 8KG weight\n2h+ aging current of 2.4A with temperature under 50?c. And 48 hours? impact test at high and low temperature to solve hot interface and shell dropping problems. \n162 tinned copper wire cores form a soft nylon braided wire 3A high current chargin', 0, 1),
(55, 1, 'AirPods Pro Wireless Charging Case ', 3499, 2999, 5, '55.jpg', 'AirPods Pro Wireless Charging Case for All Bluetooth Device Including Iphones And Android', 'For iPhone, Apple Watch, iPad, and Mac And Android Phone\nCompatible all bluetooth device\nAll-New, Lightweight, In-Ear Design\nActive Noise Cancellation\nIPX4 rated to resist sweat and water, making them ideal for sports and exercise\nInternally tapered tips conform to your ear shape while vents help equalize pressure for maximum comfort\nBluetooth 5.0 for reliable, high-quality reception\nAutomatically on, automatically connected\nOne-tap setup for your Apple devices\nVoice-enabled access to Siri\nMore than 24-hour battery life with charging case', 0, 1),
(56, 1, 'Smart Watch Men Women', 5000, 4500, 5, '56.jpg', 'F22 Smart Watch Men Women Heart Rate Monitoring IP67 proof Smartwatch Fitness for iPhone, Xiaomi, OPPO, VIVO, REDMI, SAMSUNG, REALME, TECHNO', 'Model: F22\nBluetooth Version: BT 4.0 or above\nCompatible: OS Android 4.4 or above , iOS 8.4 or above\nOperating Mode: Press Key\nproof: IP67 proof\nScreen Size: 1.3 inch\nType: IPS\nResolution: 240*240 pixels\nCapacity: 210 mAh\nStandby Time: About 30 days\nUsing time: About 5-10 days\nCharg Time: About 3-4 hours\nCharg Type: Clamp Charg\nColour:Pink\nMaterial:ABS+TPU\nPackage Contents:\n1* Smart Watch\n1* Charg Cable\n1* Instruction Manual\nOnly the above package content, other products are not included.\nNote: Light and different displays may cause the color of the item in the picture a little different from the real thing. The measurement allowed error is +/- 1-3cm.', 0, 1),
(57, 1, 'Hoco Shatterprof Anti-Spy Tempered Glasss- Iphone X/Xs', 2000, 2000, 5, '57.jpg', 'Hoco Shatterprof Anti-Spy Tempered Glasss- Iphone X/Xs', 'Brand: Hoco\nModel: Iphone X/Xs\nQuality at great price\nEnjoy using your phone whithout beings watched by others\nShatterproof edges full screen anti-spy tempered glass for iPhone X / Xs high aluminum silica glass anti-fingerprint 3D Touch support', 0, 1),
(58, 1, 'WIWU iShield Ultra Thin Hard Shell Case 13.3 pro/2020', 3600, 3499, 5, '58.jpg', 'WIWU iShield Ultra Thin Hard Shell Case 13.3 pro/2020', 'Designed for protection and style, WiWU \'s iShield is the ultimate slim-fit hardshell case for your MacBook\nThe precision-tooled case is thin, lightweight, and extremely durable to protect your computer from the unforeseen shocks of daily life\nAnti-slip rubber feet provide grip on all types of surfaces, and elevate your MacBook to keep a steady flow of air circulating underneath your device\nThe case\'s micro-clip design allows for simple, snap-on installation and easy removal in seconds iShield is surface-treated with a specialized coating to offer supreme scratch resistance and is completely compatible with WIWU\'s full line of accessories for MacBook. Brand:WiWU Series Shield Item Ultra Thin hard shell case.', 0, 1),
(59, 1, 'Pack Of 2 Waterproof Mobile Phone Pouch', 400, 299, 5, '59.jpg', 'Pack Of 2 Waterproof Mobile Phone Pouch', 'Have complete peace of mind at a rainy Season,\nHave complete peace of mind while swimming, rafting, or any other outdoor wet and wild activities this summer.\nyour phone will be protected with this waterproof case with water resistant up to 20m.\nYou no longer need to worry about', 0, 1);
INSERT INTO `products` (`id`, `categories_id`, `product_name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `status`) VALUES
(60, 1, 'Windows 10 (Home/ Edu/ Ent) Genuine Key', 999, 650, 5, '60.jpg', 'Windows 10 (Home/ Edu/ Ent) Genuine Key', 'Activate both 32bit / 64bit version\nEdition: Windows 10 Pro\nLifetime use after activation\nFull retail version x32/64\n1Key For 1Pc/User\nNo as a spare key\nCannot reuse after format.\nGenuine Full Version Download Direct From Microsoft.\n\n100% Authentic ! (LICENSED KEY)\n\nIncluded:\n\n- Genuine Microsoft Download/Install Link ISO, can be burned into DVD or thumbdrive\n\n- Product Key has never been registered\n\n- Retail version and able to register online and download updates\n\n- Support all languages\n\n- 1 key - 1PC License\n\n- License Never Expires After Activated - Once Activated, can use FOREVER!\n\n- It is not pirate or hacked version, it is 100% genuine.\n\n- No box, no cd, only download and it is permanent :)\n\nWhy Buy and download?\n\n- Easy, quick and cheaper to get the ORIGINAL product!\n\n- Safer and no shipping fee\n\n-Enjoy the same quality like the box version\n\nThis digital software and license is bought directly from Microsoft Supplier.', 0, 1),
(61, 1, 'LF609 Foldable Camera Drone', 7500, 4199, 5, '61.jpg', 'LF609 Foldable Camera Drone', '2.4Ghz 4CH Fold Drone RC Drone\nAltitude Hold\nHeadless Mode\nOne Key Return RC RTF\nMaterial: ABS Plastic\nColor: Black, White (Optional)\nTransmitter Mode: Mode 2 (left-hand throttle)\nControl Distance: about 50-80m\nQuadcopter Battery: 3.7V 650mAh Lithium Battery\nTransmitter Battery: 3 x AAA Battery (NOT Included)\nFlying Time: about 12-15 minutes\nCharging Time: about 70-90 minutes\nCamera: Photo/Video: WIFI FPV: 0.3MP HD Camera\nProduct Size: 26*20*6CM\nPackage Size: 26*22*13 CM', 0, 1),
(62, 1, 'Remax Multifunctional Desktop Stand RM-C46', 2500, 2299, 5, '62.jpg', 'Remax Multifunctional Desktop Stand RM-C46', 'Stand - mobile and tablet holder\nGood quality materials to increase durability, ease of use and convenience,\nCan tilt up to 150 elements,\nMore portable and Easy to carry,\nNo tools required.\nMade from premium material, strong and durable.\nCan adjust the height as needed.\nThe mobile holder can be retractable, support mobile phones and tablets,\nThe device in the box Stand Holder RM-C46 (Black) - REMAX', 0, 1),
(63, 1, 'Wireless Networking Printer', 38000, 32400, 5, '63.jpg', 'Brother 3 in 1 Mono Laser Automatic Duplex Wireless Networking Printer(DCP-L2540DW)', 'Brand: Brother\nProduct Name: Brother 3-in-1 Mono Laser Multi-Function Automatic Duplex Wireless Networking Printer\nModel No.: DCP-L2540DW\nCopying\nPrinting\nScanning\nMemory: 32MB\nWeight: 13.90 Kg\nCountry of Origin: Japan\nPrinting Speed: Up to 30 ppm\nDisplay: 16 characters x 2 lines\nDuplex & Wired-Wireless Printing\nDimensions: 567(W) x 517(D) x 435(H)mm\nPower: Ready :60W , Printing: 510W,Sleep: 6.6W, Deep Sleep :1.1W\nMobile Print (Brother iPrint&Scan, Air Print and Google Cloud Print)\nHigh Quality Labels with Auto-Lamination with Cost Saving and High Performance Labeller\nWith high-speed printing of up to 30 pages per minute (ppm) and multiple valuable features, you will have a printing experience like no other\nWarranty: 3 Year', 0, 1),
(64, 1, 'HDMI To HDMI Cable', 1050, 850, 5, '64.jpg', 'High Quality HDMI To HDMI Cable- 10m', 'High Quality HDMI To HDMI Cable- 10m\nHDMI-HDMI 10 Meter Cable', 0, 1),
(65, 3, 'ASUS Vivobook 15', 107990, 105990, 5, '65.jpg', 'ASUS VivoBook 15-X512JA-i7 10th Gen/8GB RAM/256GB SSD +1TB HDD/15.6? Full HD-Touch/Windows 10 Home', 'CPU : i7 10th Gen\n\nRAM : 8GB\n\nHDD : 256GB SSD + 1TB HDD\n\nScreen : 15.6?  Full HD (1920 x1080) Touch\n\nGraphic : Intel? UHD Graphics\n\nBacklit Keyboard\n\nWindows 10 Home', 0, 1),
(66, 3, 'Acer Predator Helios 300', 219990, 217990, 5, '66.jpg', 'Acer Predator Helios 300 PH315-54 i7-11th Gen/16GB RAM/512GB SSD/15.6? Full HD 144Hz/Nvidia RTX 3060 6GB Graphic/Windows 10 Home', 'CPU : i7 11th Generation\n\nRAM : 16 GB  DDR4\n\nHDD : 512 GB SSD\n\nScreen : 15.6?  Full HD 1920 x 1080 144Hz\n\nGraphic : NVIDIA? GeForce? RTX 3060 with 6 GB\n\nBacklit Keyboard RGB\n\nWindows 10 Home', 0, 1),
(67, 3, 'ASUS TUF Dash', 254990, 252990, 5, '67.jpg', 'ASUS TUF Dash F15 FX516PR i7 11th Gen/16GB RAM/1TB SSD/15.6? Full HD 240Hz/NVIDIA GeForce RTX 3070 8GB/Windows 10 Home', 'CPU : i7 11th Gen\n\nRAM : 16 GB\n\nHDD : 1TB SSD\n\nScreen : 15.6? FHD (1920*1080)  240Hz\n\nGraphic : NVIDIA GeForce RTX  3070 8GB\n\nBacklit Keyboard\n\nWindows 10 Home', 0, 1),
(68, 3, 'Acer NITRO 5', 149990, 147990, 5, '68.jpg', 'Acer NITRO 5 AN515-45-R5T9-Ryzen 7-5800H/16GB RAM/512GB SSD/15.6? Full HD 144Hz/NVIDIA? GeForce? RTX? 3050 4GB/Windows 10 Home', 'CPU : AMD Ryzen 7 5800H\n\nRAM : 16 GB\n\nHDD : 512GB SSD\n\nScreen : 15.6?  Full HD LED (1920 x 1080) 144Hz\n\nGraphic : NVIDIA? GeForce? RTX? 3050 4GB\n\nBacklit Keyboard RGB\n\nWindows 10 Home', 0, 1),
(69, 3, 'ASUS ROG STRIX', 244990, 242990, 5, '69.jpg', 'ASUS ROG STRIX G513QM-EB94 Gaming-Ryzen 9-5900HX/16GB RAM/512GB SSD/15.6? Full HD (300Hz)/NVIDIA? GeForce? RTX 3060 6GB/Windows 10 Home', 'CPU : AMD Ryzen 9-5900HX\n\nRAM : 16 GB\n\nHDD : 512GB SSD\n\nScreen : 15.6? Full HD (1920*1080) 300 Hz\n\nGraphic : NVIDIA GeForce RTX  3060 6GB\n\nBacklit Keyboard RGB\n\nWindows 10 Home', 0, 1),
(70, 3, 'Lenovo IdeaPad Gaming', 119990, 117990, 5, '70.jpg', 'Lenovo IdeaPad Gaming 3 15ARH05 Ryzen5-4600H/8GB RAM/256GB SSD+ 1TB HDD/15.6? Full HD 120Hz/NVIDIA? GeForce? GTX 1650Ti 4GB/Windows 10 Home', 'CPU : Ryzen 5-4600H\n\nRAM : 8GB DDR 4\n\nHDD : 256GB SSD + 1TB HDD\n\nScreen : 15.6? FHD (1920 x 1080) antiglare 120Hz\n\nGraphic :  NVIDIA? GeForce? GTX 1650Ti 4GB GDDR6\n\nBacklit Keyboard\n\nWindows 10 Home', 0, 1),
(71, 3, 'ASUS TUF 516PE', 164990, 162990, 5, '71.jpg', 'ASUS TUF 516PE i7 11th Gen/8GB RAM/512GB SSD/15.6? Full HD 144Hz/NVIDIA GeForce RTX 3050Ti 4GB/Windows 10 Home', 'CPU : i7 11th Gen\n\nRAM : 8GB\n\nHDD : 512GB SSD\n\nScreen : 15.6? FHD (1920*1080)  144Hz\n\nGraphic : NVIDIA GeForce RTX  3050Ti 4GB\n\nBacklit Keyboard\n\nWindows 10 Home', 0, 1),
(72, 3, 'ASUS TUF FX506LH', 114990, 112990, 5, '72.jpg', 'ASUS TUF FX506LH i5-10300H/8GB RAM/512GB SSD/15.6? Full HD 144Hz/NVIDIA GeForce GTX 1650 4GB', 'CPU : i5 10th Gen\n\nRAM : 8 GB\n\nHDD : 512GB SSD\n\nScreen : 15.6? FHD (1920*1080) 144 Hz\n\nGraphic : NVIDIA GeForce GTX 1650 4GB\n\nRGB Backlit Keyboard', 0, 1),
(73, 3, 'Dell G15', 155990, 153990, 5, '73.jpg', 'Dell G15- Ryzen7-5800H/8GB RAM/512GB SSD/15.6? Full HD/NVIDIA? GeForce? RTX 3050Ti with 4GB/Windows 11 Home', 'CPU : Ryzen 7-5800H\n\nRAM : 8 GB\n\nHDD : 512GB SSD\n\nScreen : 15.6 inch Full HD (1920 x 1080) 120Hz\n\nGraphic : NVIDIA? GeForce? RTX 3050Ti with 4GB\n\nBacklit Keyboard\n\nWindows 11 Home', 0, 1),
(74, 3, 'HP Victus 16-d0023dx Gaming', 119990, 117990, 5, '74.jpg', 'HP Victus 16-d0023dx Gaming- i5-11400H/8GB RAM/256GB SSD/16.1? Full HD/ NVIDIA RTX 3050 4GB/Windows 11 Home', 'CPU : i5-11400H\n\nRAM : 8 GB DDR4\n\nHDD : 256GB SSD\n\nScreen : 16.1? diagonal, FHD (1920 x 1080) IPS\n\nGraphic  : NVIDIA? GeForce RTX? 3050 (4 GB )\n\nBacklit Keyboard\n\nWindows 11 Home 64', 0, 1),
(75, 3, 'LEGION 5 Pro', 310000, 308000, 5, '75.jpg', 'LEGION 5 Pro 16ACH6H-Ryzen7-5800H/32GB RAM/2TB SSD/16? WQXGA (2560?1600) 165Hz/NVIDIA? GeForce RTX? 3070 8GB/Windows 11 Home', 'CPU : AMD? Ryzen? 7 5800H\r\n\r\nRAM : 32 GB\r\n\r\nHDD : 2x 1TB SSD (2TB)\r\n\r\nScreen : 16.0inch WQXGA (2560?1600) IPS 165Hz\r\n\r\nGraphic : NVIDIA GeForce RTX 3070 8GB\r\n\r\nBacklit Keyboard RGB\r\n\r\nWindows 11 Home', 0, 1),
(76, 3, 'LEGION 5 Ryzen 5-4600H', 150000, 148000, 5, '76.jpg', 'LEGION 5 Ryzen 5-4600H/8GB RAM/256GB SSD + 1TB HDD/15.6? Full HD 120Hz/Nvidia GTX 1650Ti ( 4 GB )/Windows 10 Home', 'CPU : AMD Ryzen 5-4600H\n\nRAM : 8 GB\n\nHDD : 256GB SSD + 1TB HDD\n\nScreen : 15.6? FHD 1920 x 1080 120Hz\n\nGraphic : Nvidia GTX 1650Ti ( 4 GB ) Graphic\n\nBacklit Keyboard\n\nWindows10 Home', 0, 1),
(77, 3, 'LEGION 5-Ryzen7-5800H', 215000, 213000, 5, '77.jpg', 'LEGION 5-Ryzen7-5800H/16GB RAM/1TB SSD/15.6? Full HD 165Hz/Nvidia RTX 3060 6GB Graphic/Windows 11 Pro', 'CPU : AMD? Ryzen? 7 5800H\n\nRAM : 16GB\n\nHDD : 1TB SSD\n\nScreen : 15.6? Full HD (1920 x 1080) IPS 165Hz\n\nGraphic : NVIDIA? GeForce RTX? 3060 6GB\n\nBacklit Keyboard RGB\n\nWindows11 Pro', 1, 1),
(78, 3, 'MSI GF63 Thin 10SCXR ', 99990, 97990, 5, '78.jpg', 'MSI GF63 Thin 10SCXR i5 10th Gen/8GB RAM/256GB SSD/15.6? Full HD/NVIDIA? GeForce? GTX 1650 Max-Q 4G/Windows 10 Home', 'CPU : i5 10th Generation\n\nRAM : 8GB DDR 4\n\nHDD : 256GB SSD\n\nScreen : 15.6? Full HD (1920 x 1080) IPS 60Hz\n\nGraphic : NVIDIA? GeForce? GTX 1650 Max-Q 4G\n\nBacklit Keyboard\n\nWindows 10 Home', 0, 1),
(79, 3, 'Razer Blade 15 Gaming', 209990, 207990, 5, '79.jpg', 'Razer Blade 15 Gaming i7-10750H/16GB RAM/256GB SSD/15.6? Full-HD 120Hz/Nvidia GTX 1660Ti 6GB/Windows 10 Home', 'CPU : i7-10750H 10th GEN\n\nRAM : 16 GB\n\nHDD : 256GB SSD\n\nScreen : 15.6? FHD 1920 x 1080 120Hz\n\nGraphic : Nvidia GTX 1660Ti ( 6 GB ) Graphic\n\nBacklit Keyboard\n\nWindows10 Home', 0, 1),
(80, 3, 'Asus ROG Zephyrus', 227777, 225777, 5, '80.jpg', 'ROG Zephyrus G15/Windows 10 Pro gaming/Ultraslim 1.9kg chassis/AMD Ryzen? 9 5900HS CPU/GeForce RTX? 3080 GPU/QHD 165Hz/3ms', 'CPU: Up to Intel Core i7-11375H\n\nGraphics: Up to NVIDIA GeForce RTX 3070\n\nRAM: Up to 16GB DDR4-3200\n\nScreen: Up to 15.6-inch WQHD anti-glare 165Hz IPS-level display with Adaptive Sync\n\nStorage: Up to 1TB SSD', 0, 1),
(81, 3, 'MSI Modern 15 A10M', 110000, 108000, 5, '81.jpg', 'MSI Modern 15 A4SX Ryzen 5 4500U / AMD Radeon Graphics / 8GB RAM / 512GB SSD / 15.6\" FHD Display', 'CPU: 10th Gen Intel Core i5-10210U 1.60GHz Processor (upto 4.2 GHz, 6MB Cache, 4-Cores)\n                                                                                                                                                                                                                                                                                         OS           Windows 10 Home\nDisplay        15.6-inch Full-HD (1920 x 1080 pixels), IPS-Level\nGraphics        Intel UHD Integrated Graphics,\nMemory Type        8GB DDR4-2666MHz Memory Type\nDIMM Slot        DDR4-2666MHz\n2 Slots\nMax 64GB\nSSD        512GB SSD\nHDD        No', 0, 1),
(82, 3, 'HP Pavilion Power 15 ', 115000, 113000, 5, '82.jpg', 'HP Pavilion Power 15 2020 i5 10300H / GTX 1650 / 8GB RAM / 256GB SSD / 15.6\" FHD display', 'CPU: 4000-series AMD Ryzen 5 4500U Processor\nOS        Windows 10 Home\nDisplay        15.6-inch IPS display; Full-HD (1920 x 1080 pixels) resolution\nType        Ultrabook\nGraphics        AMD Radeon Graphics\nMemory Type        8GB DDR4-3200 Memory Type\n2 Slot Number of SO-DIMM Slot\nMax 64GB Max Capacity\nSSD        512GB SSD', 0, 1),
(83, 3, 'Dell G5', 118000, 116000, 5, '83.jpg', 'Dell G5 2021 G5510 i5 10th Gen / GTX 1650 / 8GB RAM / 256GB SSD / 15.6\" 120Hz FHD Display', 'CPU: 10th Generation Intel Core i5-10200H (8MB Cache, up to 4.1 GHz, 4 cores)\nRAM        8GB, DDR4, 2933MHz; up to 32GB (additional memory sold separately)\nGraphics        NVIDIA GeForce GTX 1650 4GB GDDR6\nDisplay        \n15.6-inch IPS display; 120Hz refresh rate; Full-HD (1920 x 1080 pixels) resolution; 250 nits brightness; Anti- Glare panel; LED-Backlit display with Narrow Bezels\nType        \nBudget gaming laptop\nConnections        1 SuperSpeed USB 2.0 port\n1 SuperSpeed USB 2.0 with       PowerShare\n1 SuperSpeed USB 3.2 Gen 1     port\n1 HDMI 2.0 port\nNetworking        802.11ac + Bluetooth 5.0, Dual Band 2.4&5 GHz, MU-MIMO/160Mhz, 2x2\nStorage        256GB SSD', 0, 1),
(84, 3, 'Lenovo Yoga Slim 7', 125000, 123000, 5, '84.jpg', 'Lenovo Yoga Slim 7 15ITL05 i5 11th Gen / 16GB RAM / 512GB SSD / 15.6\" FHD display', 'Processor: Intel Core i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)\nGraphics	\nIntegrated Intel Iris Xe Graphics\nChipset	\nIntel SoC Platform\nMemory	\n16GB Soldered DDR4-3200\nMemory Slots	\nMemory soldered to systemboard, no slots, dual-channel\nMax Memory	\n16GB soldered memory, not upgradable\nStorage	\n512GB SSD M.2 2280 PCIe 3.0x4 NVMe\nStorage Support	\nOne drive, up to 1TB M.2 2280 SSD\nCard Reader	\nSD Card Reader', 0, 1),
(85, 3, 'Dell G3 G3500', 125000, 123000, 5, '85.jpg', 'Dell G3 G3500 i5 10th Gen / NVIDIA GTX 1650TI / 8GB RAM / 512GB SSD / 15.6\" 120Hz FHD Display', 'CPU: 10th Generation Intel Core i5-10300H quad-core Processor\nRAM        8GB, DDR4, 2666MHz; up to 32GB (additional memory sold separately)\nGraphics        NVIDIA? GeForce? GTX 1650TI with 4GB GDDR5 graphics memory\nDisplay        15.6-inch FHD (1920 x 1080 pixels); IPS Panel 120Hz\nConnections        1. Standard SD card | 2. USB 2.0 | 3. Wedge lock slot | 4. Power-in | 5. USB-C DisplayPort Alt-Mode for 1650 and above | 6. HDMI | 7. SuperSpeed USB 3.1 | 8. RJ45 | 9. Headphone/Mic\nNetworking        802.11ac + Bluetooth 5.0, Dual Band 2.4 & 5GHz, MU-MIMO/160Mhz, 2x2\nStorage        512GB SSD', 0, 1),
(86, 3, 'ASUS ROG Strix G531G ', 140000, 138000, 5, '86.jpg', 'ASUS ROG Strix G531G/9th gen i7-9750H/8 GB RAM/50 Watt-hour battery/One Zone RGB lighting', 'Processor: Hexa-core 9th gen i7-9750H processor, Base-Clock @ 2.6 GHz, Turbo Boost Clock up to 4.5 GHz\nGPU: Nvidia GeForce GTX 1650, 4 GB VRAM, GDDR5\nRAM: 8 GB DDR4 @ 2666 MHz (Max 32 GB), Dual-slot\nStorage: 512 GB PCIe Gen-3 NVMe SSD\nPorts: 3 x USB 3.1 Gen 2 Type-A, 1x HDMI, 1x RJ-45 Ethernet, 1x MiniDisplay display port, audio port\nConnectivity: Gigabit LAN + Intel? 802.11ac (2?2) Gigabit Wi-Fi with Rangeboost support + Bluetooth 5                                                              Design: Plastic body, with a dual-tone matte aluminum finish, 2.4 kg Battery: 50 Watt-hour battery\nOS: Windows 10 Home                                                                                                                                                                                                               \nDisplay: 15.6? Full HD (1920 x 1080), IPS LCD panel, 60Hz refresh rate, 60% sRGB', 0, 1),
(87, 3, 'Dell Alienware M15 R3', 310000, 308000, 5, '87.jpg', 'Dell Alienware M15 R3 i7 10th Gen / RTX 2070 SUPER / 16GB RAM / 512GB SSD / 15.6\" FHD 300Hz Display', 'CPU: 10th Generation Intel Core i7-10750H\nOperating System        Windows 10\nScreen        15.6\" Full-HD (1920 x 1080 pixels) 300Hz refresh rate, 3ms response time, 300-nits brightness, 100% sRGB color gamut\nMemory        16GB DDR4 3200Mhz\nStorage        512GB SSD\nGraphics Card        NVIDIA GeForce RTX 2070 SUPER with 8GB GDDR6 VRAM\nAudio        4-Way (Woofer/Tweeter) Stereo Speaker Design\nIntroduces Discrete Smart Amp Woofer technology\n Delivers 2.5x bass improvement over the previous generation\n Delivers 2x treble improvement over the previous generation\n Delivers 30% loudness improvement over the previous generation for full-range performance\nDimensions (W x D x H)        Height (rear): 0.768\" (19.5 mm)\nHeight (peak): 0.807\" (20.5 mm) with OLED or 144Hz displays [ 0.783\" (19.9 mm) for the 300Hz display]\nHeight (front): 0.807\" (20.5 mm) with OLED or 144Hz displays [0.704\" (17.9 mm) for the 300Hz display]\n\nDepth: 10.87\" (276.2 mm) with OLED Display\nDepth: 10.86\" (276 mm) with Non-OLED Display\n\nWidth: 14.19\" (360.3 mm)\nWeight        2.11Kg', 0, 1),
(88, 3, 'Acer Predator Triton 300', 199000, 197000, 5, '88.jpg', 'Acer Predator Triton 300 2020 i7 10TH GEN / RTX 2060 / 15.6\" FHD 144Hz / 16GB RAM/ 512GB SSD', 'CPU: Intel 10th Generation Intel Core i7-10750H 6-Core Processor (Up to 5. 0GHz)\nProcessor Core        Hexa-core (6 Core)\nGraphics        NVIDIA GeForce RTX 2060 Graphics with 6GB of dedicated GDDR6 VRAM\nMemory        16GB DDR4-2933MHz\nDisplay        15.6 inches Full HD (1920 x 1080) Widescreen LED backlit IPS Display (144Hz Refresh Rate, 3ms Overdrive Response Time, 300nit Brightness and 72 percentage NTSC)\nConnections        4-Zone RGB Backlit Keyboard | Wireless: Killer Double Shot Pro Wireless-AX 1650i 802. 11ax WiFi 6 | LAN: Killer Ethernet E2600 10/100/1000 Gigabit Ethernet LAN | DTS X: Ultra Audio | 4th Gen All-Metal AeroBlade 3D Fan\nNetworking        Integrated 802.11 b/g/n or 802.11 ac (WiDi)\nBuilt-in Bluetooth? V4.0\nStorage        512GB SSD\nSizeheight x width x depth         14.3\" x 10\" x 0.78\" inches\nBattery        59 Watt Hours , 4-cell Li-ion  Battery Pack', 0, 1),
(89, 3, 'Acer Predator Triton 500 ', 265000, 263000, 5, '89.jpg', 'Acer Predator Triton 500 2020 i7 10TH GEN / RTX 2070 / 15.6\" FHD 144Hz / 16GB RAM/ 512GB SSD', 'CPU: Intel Core i7-10875H (8C/16T, 2.3GHz with boost up to 5.1GHz)\nProcessor Core        Hexa-core (8 Core)\nGraphics        NVIDIA GeForce RTX 2070 Graphics with 8GB of dedicated GDDR6 VRAM\nMemory        16GB DDR4-2933MHz\nDisplay        15. 6\" Full HD (1920 x 1080) widescreen LED-backlit IPS display with NVIDIA G-SYNC technology | 144Hz Refresh Rate | 3ms Overdrive Response Time | 300nit Brightness | 100% sRGB\nConnections        1x USB 3.1 Type-C (Thunderbolt 3, DisplayPort)\n3x USB 3.2 Type-A\n1x HDMI 2.0\n1x mini DisplayPort 1.4\n1x 3.5mm headphone jack\nNetworking        Integrated 802.11 b/g/n or 802.11 ac (WiDi)\nBuilt-in Bluetooth? V4.0\nStorage        512GB SSD\nSize height x width x depth         14.1\" x 10\" x 0.70\"\nBattery        84 Watt-Hours, 4-cell Li-ion  Battery Pack\nKeyboard        Per-Key RGB Keyboard\nWeight        4.63 lb', 0, 1),
(90, 3, 'MSI GP65 Leopard 10SDK', 195000, 193000, 5, '90.jpg', 'MSI GP65 Leopard 10SDK i7 10TH GEN / GTX 1660TI / 15.6\" 144Hz FHD / 512GB SSD / 16 GB RAM', 'CPU: 10th Generation Intel Core i7 10750H\nOS	Windows 10 Home\nDisplay	15.6-inch Full-HD (1920 x 1080 Pixels), 144Hz IPS Level\nChipset	Intel HM470\nGraphics	\nGeForce GTX 1660TI 6GB GDDR6\n\nMemory Type	DDR4 16GB 2666Mhz\nDIMM Slot	DDR4-2666\n2 Slots\nMax 64GB\nSSD	512GB SSD \nHDD	Optional\nOptical Drive	NONE\nWebcam	HD type (30fps@720p)\nKeyboard	Per-Key RGB Backlight Keyboard', 0, 1);

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
(79, 13, 1, 'Apple MacBook Air', 4, '', 1, '2022-01-29 07:35:05'),
(80, 51, 1, 'Apple MFi Certified Dual Lightning iPhone Splitter', 3, '', 1, '2022-01-29 06:55:52'),
(82, 55, 1, 'AirPods Pro Wireless Charging Case ', 3, '', 1, '2022-01-29 10:53:47'),
(83, 57, 1, 'Hoco Shatterprof Anti-Spy Tempered Glasss- Iphone X/Xs', 2, '', 1, '2022-01-29 10:54:12'),
(84, 53, 1, 'Iphone Xs Max Adaptor', 4, '', 1, '2022-01-29 10:54:27'),
(85, 47, 1, 'Wireless Charger Pad', 4, '', 1, '2022-01-29 10:54:48'),
(86, 45, 1, 'Iphone 12 pro Max', 5, '', 1, '2022-01-29 10:55:02'),
(87, 13, 2, 'Apple MacBook Air', 4, '', 1, '2022-01-29 10:56:13'),
(88, 54, 2, 'iphone Cable', 3, '', 1, '2022-01-29 10:56:41'),
(90, 62, 2, 'Remax Multifunctional Desktop Stand RM-C46', 4, '', 1, '2022-01-29 10:58:25'),
(91, 89, 3, 'Acer Predator Triton 500 ', 5, '', 1, '2022-01-29 10:58:51'),
(92, 34, 3, 'Black Shark 3', 4, '', 1, '2022-01-29 10:59:16'),
(93, 38, 3, 'Samsung Galaxy Z Fold 2', 5, '', 1, '2022-01-29 10:59:40'),
(94, 56, 3, 'Smart Watch Men Women', 3, '', 1, '2022-01-29 11:00:04'),
(95, 52, 3, '3.5mm Audio Jack Stereo Headphone Splitter', 3, '', 1, '2022-01-29 11:00:26'),
(96, 49, 3, 'Stylus Pen ', 4, '', 1, '2022-01-29 11:00:37'),
(97, 48, 3, '3 USB EU Travel Charger', 3, '', 1, '2022-01-29 11:01:00'),
(98, 6, 4, 'Dell Vostro 5471', 3, '', 1, '2022-01-29 11:09:09'),
(99, 43, 4, 'Sony Xperia 10 III Lite', 4, '', 1, '2022-01-29 11:09:24'),
(100, 61, 4, 'LF609 Foldable Camera Drone', 4, '', 1, '2022-01-29 11:10:14'),
(101, 50, 4, 'Stand Holder/ Tripod', 4, '', 1, '2022-01-29 11:10:31'),
(102, 46, 4, 'Lavalier Wireless Microphone Mic', 3, '', 1, '2022-01-29 11:10:41'),
(103, 89, 4, 'Acer Predator Triton 500 ', 4, '', 1, '2022-01-29 11:11:14'),
(104, 6, 5, 'Dell Vostro 5471', 4, '', 1, '2022-01-29 11:12:49'),
(105, 37, 5, 'SAMSUNG Galaxy S21', 5, '', 1, '2022-01-29 11:13:12'),
(106, 48, 5, '3 USB EU Travel Charger', 3, '', 1, '2022-01-29 11:13:23'),
(107, 43, 6, 'Sony Xperia 10 III Lite', 4, '', 1, '2022-01-29 11:15:36'),
(108, 78, 7, 'MSI GF63 Thin 10SCXR ', 4, '', 1, '2022-01-29 11:16:23'),
(109, 39, 7, 'OnePlus 9', 3, '', 1, '2022-01-29 11:16:45'),
(110, 86, 8, 'ASUS ROG Strix G531G ', 3, '', 1, '2022-01-29 11:17:29'),
(111, 60, 8, 'Windows 10 (Home/ Edu/ Ent) Genuine Key', 4, '', 1, '2022-01-29 11:17:38'),
(112, 90, 1, 'MSI GP65 Leopard 10SDK', 4, 'this is goog', 1, '2022-01-31 10:16:42');

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
(1, 'user1', 'user1', 'user1@gmail.com', '9845632145', '2022-01-28 03:53:30'),
(2, 'user2', 'user2', 'user2@gmail.com', '9854652136', '2022-01-28 03:56:10'),
(3, 'user3', 'user3', 'user3@gmail.com', '9875612536', '2022-01-28 03:56:38'),
(4, 'user4', 'user4', 'user4@gmail.com', '9845762135', '2022-01-28 03:57:02'),
(5, 'user5', 'user5', 'user5@gmail.com', '9875462135', '2022-01-28 03:57:20'),
(6, 'user6', 'user6', 'user6@gmail.com', '9875641354', '2022-01-28 03:57:39'),
(7, 'user7', 'user7', 'user7@gmail.com', '9856421456', '2022-01-28 03:57:57'),
(8, 'user8', 'user8', 'user8@gmail.com', '9875461246', '2022-01-28 03:58:29'),
(9, 'user9', 'user9', 'user9@gmail.com', '9865413546', '2022-01-28 03:58:49'),
(10, 'user0', 'user0', 'user0@gmail.com', '9821456789', '2022-01-28 03:59:12');

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
(44, 14, 66, '2021-12-17 12:10:33');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87417;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
