----------- VACCINE V1 ------------------------


INSERT INTO `vaccines`(`name`, `variant`, `added_at`) VALUES ('Rabies', 2, CURRENT_TIMESTAMP()), ('Feline Distemper', 2, CURRENT_TIMESTAMP()), ('Feline Herpesvirus', 2, CURRENT_TIMESTAMP()), ('Calicivirus', 2, CURRENT_TIMESTAMP()), ('Feline Leukemia Virus (FeLV)', 2, CURRENT_TIMESTAMP()), ('Bordetella', 2, CURRENT_TIMESTAMP());

INSERT INTO `vaccines`(`name`, `variant`, `added_at`) VALUES ('Rabies 1-year', 1, CURRENT_TIMESTAMP()), ('Rabies 3-year', 1, CURRENT_TIMESTAMP()), ('Distemper', 1, CURRENT_TIMESTAMP()), ('Parvovirus', 1, CURRENT_TIMESTAMP()), ('Adenovirus, type 1', 1, CURRENT_TIMESTAMP()), ('Adenovirus, type 2', 1, CURRENT_TIMESTAMP()), ('Parainfluenza', 1, CURRENT_TIMESTAMP()), ('Bordetella bronchiseptica ', 1, CURRENT_TIMESTAMP()), ('Lyme disease', 1, CURRENT_TIMESTAMP()), ('Leptospirosis', 1, CURRENT_TIMESTAMP()),  ('Canine influenza', 1, CURRENT_TIMESTAMP());

----------- VACCINE V2 ------------------------




-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20 Mei 2018 pada 19.22
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
-- Database: `pet_match2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `vaccines`
--

CREATE TABLE `vaccines` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `variant` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `vaccines`
--

INSERT INTO `vaccines` (`id`, `name`, `variant`) VALUES
(1, 'DP', 1),
(2, 'DHLPI', 1),
(3, 'DHLPII+R', 1),
(4, 'Rabies', 1),
(5, 'PiBr', 1),
(6, 'canine coronavirus', 1),
(7, 'canine adenovirus-1', 1),
(8, 'canine adenovirus-2', 1),
(9, 'feline panleukopenia', 2),
(10, 'feline viral rhinotracheitis', 2),
(11, 'feline calcivirus disease', 2),
(12, 'Chlamydia', 2),
(13, 'Rabies', 2),
(14, 'feline herpesvirus', 2),
(15, 'feline leukemia virus', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vaccines`
--
ALTER TABLE `vaccines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_variantvaccines` (`variant`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vaccines`
--
ALTER TABLE `vaccines`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `vaccines`
--
ALTER TABLE `vaccines`
  ADD CONSTRAINT `FK_variantvaccines` FOREIGN KEY (`variant`) REFERENCES `variants` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
