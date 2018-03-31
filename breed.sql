-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 29 Mar 2018 pada 19.39
-- Versi Server: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_match`
--

-- --------------------------------------------------------
CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `variants` (`id`, `name`) VALUES
  (1, 'Dog'),
  (2, 'Cat');

--
-- Struktur dari tabel `breeds`
--

CREATE TABLE `breeds` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `size` varchar(10) DEFAULT NULL,
  `variant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `breeds`
--

INSERT INTO `breeds` (`id`, `name`, `size`, `variant`) VALUES
(1, 'Affenpinscher', 'small', 1),
(2, 'Alaskan Klee Kai', 'small', 1),
(3, 'American Eskimo Dog', 'small', 1),
(4, 'Australian Terrier', 'small', 1),
(5, 'Basenji', 'small', 1),
(6, 'Basset Hound', 'small', 1),
(7, 'Beagle', 'small', 1),
(8, 'Bichon Frise', 'small', 1),
(9, 'Bolognese', 'small', 1),
(10, 'Border Terrier', 'small', 1),
(11, 'Boston Terrier', 'small', 1),
(12, 'Brussels Griffon', 'small', 1),
(13, 'Bull Terrier', 'small', 1),
(14, 'Bulldog', 'small', 1),
(15, 'Cairn Terrier', 'small', 1),
(16, 'Cardigan Welsh Corgi', 'small', 1),
(17, 'Cavalier King Charles Spaniel', 'small', 1),
(18, 'Cesky Terrier', 'small', 1),
(19, 'Chihuahua', 'small', 1),
(20, 'Chinese Crested', 'small', 1),
(21, 'Cockapoo', 'small', 1),
(22, 'Cocker Spaniel', 'small', 1),
(23, 'Coton de Tulear', 'small', 1),
(24, 'Dachshund', 'small', 1),
(25, 'Dandie Dinmont Terrier', 'small', 1),
(26, 'English Cocker Spaniel', 'small', 1),
(27, 'English Toy Spaniel', 'small', 1),
(28, 'Field Spaniel', 'small', 1),
(29, 'Fox Terrier', 'small', 1),
(30, 'French Bulldog', 'small', 1),
(31, 'Glen of Imaal Terrier', 'small', 1),
(32, 'Havanese', 'small', 1),
(33, 'Italian Greyhound', 'small', 1),
(34, 'Jack Russell Terrier', 'small', 1),
(35, 'Japanese Chin', 'small', 1),
(36, 'Lakeland Terrier', 'small', 1),
(37, 'Lancashire Heeler', 'small', 1),
(38, 'Lhasa Apso', 'small', 1),
(39, 'Lowchen', 'small', 1),
(40, 'Maltese', 'small', 1),
(41, 'Maltese Shih Tzu', 'small', 1),
(42, 'Maltipoo', 'small', 1),
(43, 'Manchester Terrier', 'small', 1),
(44, 'Miniature Pinscher', 'small', 1),
(45, 'Miniature Schnauzer', 'small', 1),
(46, 'Norfolk Terrier', 'small', 1),
(47, 'Norwich Terrier', 'small', 1),
(48, 'Papillon', 'small', 1),
(49, 'Peekapoo', 'small', 1),
(50, 'Pekingese', 'small', 1),
(51, 'Pembroke Welsh Corgi', 'small', 1),
(52, 'Petit Basset Griffon Vendeen', 'small', 1),
(53, 'Pocket Beagle', 'small', 1),
(54, 'Pomeranian', 'small', 1),
(55, 'Pomsky', 'small', 1),
(56, 'Pug', 'small', 1),
(57, 'Puggle', 'small', 1),
(58, 'Pyrenean Shepherd', 'small', 1),
(59, 'Rat Terrier', 'small', 1),
(60, 'Schipperke', 'small', 1),
(61, 'Scottish Terrier', 'small', 1),
(62, 'Sealyham Terrier', 'small', 1),
(63, 'Shetland Sheepdog', 'small', 1),
(64, 'Shiba Inu', 'small', 1),
(65, 'Shih Tzu', 'small', 1),
(66, 'Silky Terrier', 'small', 1),
(67, 'Skye Terrier', 'small', 1),
(68, 'Staffordshire Bull Terrier', 'small', 1),
(69, 'Sussex Spaniel', 'small', 1),
(70, 'Tibetan Spaniel', 'small', 1),
(71, 'Tibetan Terrier', 'small', 1),
(72, 'Toy Fox Terrier', 'small', 1),
(73, 'Welsh Terrier', 'small', 1),
(74, 'West Highland White Terrier', 'small', 1),
(75, 'Yorkipoo', 'small', 1),
(76, 'Yorkshire Terrier', 'small', 1),
(77, 'Airedale Terrier', 'medium', 1),
(78, 'American English Coonhound', 'medium', 1),
(79, 'American Foxhound', 'medium', 1),
(80, 'American Pit Bull Terrier', 'medium', 1),
(81, 'American Staffordshire Terrier', 'medium', 1),
(82, 'American Water Spaniel', 'medium', 1),
(83, 'Appenzeller Sennenhunde', 'medium', 1),
(84, 'Australian Cattle Dog', 'medium', 1),
(85, 'Australian Shepherd', 'medium', 1),
(86, 'Azawakh', 'medium', 1),
(87, 'Barbet', 'medium', 1),
(88, 'Bearded Collie', 'medium', 1),
(89, 'Bedlington Terrier', 'medium', 1),
(90, 'Bernedoodle', 'medium', 1),
(91, 'Black and Tan Coonhound', 'medium', 1),
(92, 'Bluetick Coonhound', 'medium', 1),
(93, 'Border Collie', 'medium', 1),
(94, 'Boxer', 'medium', 1),
(95, 'Boykin Spaniel', 'medium', 1),
(96, 'Brittany', 'medium', 1),
(97, 'Canaan Dog', 'medium', 1),
(98, 'Chesapeake Bay Retriever', 'medium', 1),
(99, 'Chinese Shar-Pei', 'medium', 1),
(100, 'Clumber Spaniel', 'medium', 1),
(101, 'Collie', 'medium', 1),
(102, 'Curly-Coated Retriever', 'medium', 1),
(103, 'Dalmatian', 'medium', 1),
(104, 'Dutch Shepherd', 'medium', 1),
(105, 'English Foxhound', 'medium', 1),
(106, 'English Setter', 'medium', 1),
(107, 'English Springer Spaniel', 'medium', 1),
(108, 'Entlebucher Mountain Dog', 'medium', 1),
(109, 'Finnish Lapphund', 'medium', 1),
(110, 'Finnish Spitz', 'medium', 1),
(111, 'Flat-Coated Retriever', 'medium', 1),
(112, 'German Pinscher', 'medium', 1),
(113, 'German Shorthaired Pointer', 'medium', 1),
(114, 'Golden Retriever', 'medium', 1),
(115, 'Gordon Setter', 'medium', 1),
(116, 'Harrier', 'medium', 1),
(117, 'Ibizan Hound', 'medium', 1),
(118, 'Icelandic Sheepdog', 'medium', 1),
(119, 'Irish Red and White Setter', 'medium', 1),
(120, 'Irish Terrier', 'medium', 1),
(121, 'Irish Water Spaniel', 'medium', 1),
(122, 'Keeshond', 'medium', 1),
(123, 'Kerry Blue Terrier', 'medium', 1),
(124, 'Kooikerhondje', 'medium', 1),
(125, 'Korean Jindo Dog', 'medium', 1),
(126, 'Mutt', 'medium', 1),
(127, 'Norwegian Buhund', 'medium', 1),
(128, 'Norwegian Elkhound', 'medium', 1),
(129, 'Norwegian Lundehund', 'medium', 1),
(130, 'Nova Scotia Duck Tolling Retri', 'medium', 1),
(131, 'Pharaoh Hound', 'medium', 1),
(132, 'Plott', 'medium', 1),
(133, 'Pointer', 'medium', 1),
(134, 'Polish Lowland Sheepdog', 'medium', 1),
(135, 'Portuguese Water Dog', 'medium', 1),
(136, 'Puli', 'medium', 1),
(137, 'Redbone Coonhound', 'medium', 1),
(138, 'Rottweiler', 'medium', 1),
(139, 'Samoyed', 'medium', 1),
(140, 'Siberian Husky', 'medium', 1),
(141, 'Small Munsterlander Pointer', 'medium', 1),
(142, 'Soft Coated Wheaten Terrier', 'medium', 1),
(143, 'Stabyhoun', 'medium', 1),
(144, 'Standard Schnauzer', 'medium', 1),
(145, 'Swedish Vallhund', 'medium', 1),
(146, 'Treeing Tennessee Brindle', 'medium', 1),
(147, 'Vizsla', 'medium', 1),
(148, 'Welsh Springer Spaniel', 'medium', 1),
(149, 'Whippet', 'medium', 1),
(150, 'Wirehaired Pointing Griffon', 'medium', 1),
(151, 'Xoloitzcuintli', 'medium', 1),
(152, 'Afghan Hound', 'large', 1),
(153, 'Akita', 'large', 1),
(154, 'Alaskan Malamute', 'large', 1),
(155, 'American Bulldog', 'large', 1),
(156, 'Anatolian Shepherd Dog', 'large', 1),
(157, 'Belgian Malinois', 'large', 1),
(158, 'Belgian Sheepdog', 'large', 1),
(159, 'Belgian Tervuren', 'large', 1),
(160, 'Berger Picard', 'large', 1),
(161, 'Bernese Mountain Dog', 'large', 1),
(162, 'Black Mouth Cur', 'large', 1),
(163, 'Black Russian Terrier', 'large', 1),
(164, 'Bloodhound', 'large', 1),
(165, 'Boerboel', 'large', 1),
(166, 'Borzoi', 'large', 1),
(167, 'Bouvier des Flandres', 'large', 1),
(168, 'Bracco Italiano', 'large', 1),
(169, 'Briard', 'large', 1),
(170, 'Bullmastiff', 'large', 1),
(171, 'Cane Corso', 'large', 1),
(172, 'Catahoula Leopard Dog', 'large', 1),
(173, 'Caucasian Shepherd Dog', 'large', 1),
(174, 'Chinook', 'large', 1),
(175, 'Chow Chow', 'large', 1),
(176, 'Doberman Pinscher', 'large', 1),
(177, 'Dogo Argentino', 'large', 1),
(178, 'Dogue de Bordeaux', 'large', 1),
(179, 'German Shepherd Dog', 'large', 1),
(180, 'German Wirehaired Pointer', 'large', 1),
(181, 'Giant Schnauzer', 'large', 1),
(182, 'Goldador', 'large', 1),
(183, 'Goldendoodle', 'large', 1),
(184, 'Great Dane', 'large', 1),
(185, 'Great Pyrenees', 'large', 1),
(186, 'Greater Swiss Mountain Dog', 'large', 1),
(187, 'Greyhound', 'large', 1),
(188, 'Irish Setter', 'large', 1),
(189, 'Irish Wolfhound', 'large', 1),
(190, 'Komondor', 'large', 1),
(191, 'Kuvasz', 'large', 1),
(192, 'Labradoodle', 'large', 1),
(193, 'Labrador Retriever', 'large', 1),
(194, 'Leonberger', 'large', 1),
(195, 'Mastiff', 'large', 1),
(196, 'Neapolitan Mastiff', 'large', 1),
(197, 'Newfoundland', 'large', 1),
(198, 'Old English Sheepdog', 'large', 1),
(199, 'Otterhound', 'large', 1),
(200, 'Poodle', 'large', 1),
(201, 'Rhodesian Ridgeback', 'large', 1),
(202, 'Saint Bernard', 'large', 1),
(203, 'Saluki', 'large', 1),
(204, 'Schnoodle', 'large', 1),
(205, 'Scottish Deerhound', 'large', 1),
(206, 'Sloughi', 'large', 1),
(207, 'Tibetan Mastiff', 'large', 1),
(208, 'Treeing Walker Coonhound', 'large', 1),
(209, 'Weimaraner', 'large', 1),
(210, 'Abyssinian', '', 2),
(211, 'American Bobtail', '', 2),
(212, 'American Curl', '', 2),
(213, 'American Shorthair', '', 2),
(214, 'American Wirehair', '', 2),
(215, 'Balinese', '', 2),
(216, 'Bengal Cats', '', 2),
(217, 'Birman', '', 2),
(218, 'Bombay', '', 2),
(219, 'British Shorthair', '', 2),
(220, 'Burmese', '', 2),
(221, 'Burmilla', '', 2),
(222, 'Chartreux', '', 2),
(223, 'Chinese Li Hua', '', 2),
(224, 'Colorpoint Shorthair', '', 2),
(225, 'Cornish Rex', '', 2),
(226, 'Cymric', '', 2),
(227, 'Devon Rex', '', 2),
(228, 'Egyptian Mau', '', 2),
(229, 'European Burmese', '', 2),
(230, 'Exotic', '', 2),
(231, 'Havana Brown', '', 2),
(232, 'Himalayan', '', 2),
(233, 'Japanese Bobtail', '', 2),
(234, 'Javanese', '', 2),
(235, 'Korat', '', 2),
(236, 'LaPerm', '', 2),
(237, 'Maine Coon', '', 2),
(238, 'Manx', '', 2),
(239, 'Nebelung', '', 2),
(240, 'Norwegian Forest', '', 2),
(241, 'Ocicat', '', 2),
(242, 'Oriental', '', 2),
(243, 'Persian', '', 2),
(244, 'Pixie-Bob', '', 2),
(245, 'Ragamuffin', '', 2),
(246, 'Ragdoll Cats', '', 2),
(247, 'Russian Blue', '', 2),
(248, 'Savannah', '', 2),
(249, 'Scottish Fold', '', 2),
(250, 'Selkirk Rex', '', 2),
(251, 'Siamese Cat', '', 2),
(252, 'Siberian', '', 2),
(253, 'Singapura', '', 2),
(254, 'Snowshoe', '', 2),
(255, 'Somali', '', 2),
(256, 'Sphynx', '', 2),
(257, 'Tonkinese', '', 2),
(258, 'Turkish Angora', '', 2),
(259, 'Turkish Van', '', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `breeds`
--
ALTER TABLE `breeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_variantBreed` (`variant`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `breeds`
--
ALTER TABLE `breeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `breeds`
--
ALTER TABLE `breeds`
  ADD CONSTRAINT `FK_variantBreed` FOREIGN KEY (`variant`) REFERENCES `variants` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
