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
  `mixed` varchar(2) DEFAULT NULL,
  `cross_possibility` longtext DEFAULT NULL,
  `variant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `breeds`
--
ALTER TABLE `breeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_variantBreed` (`variant`);

ALTER TABLE `breeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

ALTER TABLE `breeds`
  ADD CONSTRAINT `FK_variantBreed` FOREIGN KEY (`variant`) REFERENCES `variants` (`id`);
COMMIT;

ALTER TABLE `breeds` AUTO_INCREMENT=1

INSERT INTO breeds values ('', 'Affenpinscher','small','','','1'),('', 'Afghan Hound','large','','','1'),('', 'Airedale Terrier','medium','','','1'),('', 'Akita','large','','','1'),('', 'Alaskan Klee Kai','small','','','1'),('', 'Alaskan Malamute','large','','','1'),('', 'American Bulldog','large','','','1'),('', 'American English Coonhound','medium','','','1'),('', 'American Eskimo Dog','small','','','1'),('', 'American Foxhound','medium','','','1'),('', 'American Pit Bull Terrier','medium','','','1'),('', 'American Staffordshire Terrier','medium','','','1'),('', 'American Water Spaniel','medium','','','1'),('', 'Anatolian Shepherd Dog','large','','','1'),('', 'Appenzeller Sennenhunde','medium','','','1'),('', 'Australian Cattle Dog','medium','','','1'),('', 'Australian Shepherd','medium','','','1'),('', 'Australian Terrier','small','','','1'),('', 'Azawakh','medium','','','1'),('', 'Barbet','medium','','','1'),('', 'Basenji','small','','','1'),('', 'Basset Hound','small','','','1'),('', 'Beagle','small','','','1'),('', 'Bearded Collie','medium','','','1'),('', 'Bedlington Terrier','medium','','','1'),('', 'Belgian Malinois','large','','','1'),('', 'Belgian Sheepdog','large','','','1'),('', 'Belgian Tervuren','large','','','1'),('', 'Berger Picard','large','','','1'),('', 'Bernedoodle','medium','1','','1'),('', 'Bernese Mountain Dog','large','','','1'),('', 'Bichon Frise','small','','','1'),('', 'Black Mouth Cur','large','','','1'),('', 'Black Russian Terrier','large','','','1'),('', 'Black and Tan Coonhound','medium','','','1'),('', 'Bloodhound','large','','','1'),('', 'Bluetick Coonhound','medium','','','1'),('', 'Boerboel','large','','','1'),('', 'Bolognese','small','','','1'),('', 'Border Collie','medium','','','1'),('', 'Border Terrier','small','','','1'),('', 'Borzoi','large','','','1'),('', 'Boston Terrier','small','','','1'),('', 'Bouvier des Flandres','large','','','1'),('', 'Boxer','medium','','','1'),('', 'Boykin Spaniel','medium','','','1'),('', 'Bracco Italiano','large','','','1'),('', 'Briard','large','','','1'),('', 'Brittany','medium','','','1'),('', 'Brussels Griffon','small','','','1'),('', 'Bull Terrier','small','','','1'),('', 'Bulldog','small','','','1'),('', 'Bullmastiff','large','','','1'),('', 'Cairn Terrier','small','','','1'),('', 'Canaan Dog','medium','','','1'),('', 'Cane Corso','large','','','1'),('', 'Cardigan Welsh Corgi','small','','','1'),('', 'Catahoula Leopard Dog','large','','','1'),('', 'Caucasian Shepherd Dog','large','','','1'),('', 'Cavalier King Charles Spaniel','small','','','1'),('', 'Cesky Terrier','small','','','1'),('', 'Chesapeake Bay Retriever','medium','','','1'),('', 'Chihuahua','small','','','1'),('', 'Chinese Crested','small','','','1'),('', 'Chinese Shar-Pei','medium','','','1'),('', 'Chinook','large','','','1'),('', 'Chow Chow','large','','','1'),('', 'Clumber Spaniel','medium','','','1'),('', 'Cockapoo','small','1','','1'),('', 'Cocker Spaniel','small','','','1'),('', 'Collie','medium','','','1'),('', 'Coton de Tulear','small','','','1'),('', 'Curly-Coated Retriever','medium','','','1'),('', 'Dachshund','small','','','1'),('', 'Dalmatian','medium','','','1'),('', 'Dandie Dinmont Terrier','small','','','1'),('', 'Doberman Pinscher','large','','','1'),('', 'Dogo Argentino','large','','','1'),('', 'Dogue de Bordeaux','large','','','1'),('', 'Dutch Shepherd','medium','','','1'),('', 'English Cocker Spaniel','small','','','1'),('', 'English Foxhound','medium','','','1'),('', 'English Setter','medium','','','1'),('', 'English Springer Spaniel','medium','','','1'),('', 'English Toy Spaniel','small','','','1'),('', 'Entlebucher Mountain Dog','medium','','','1'),('', 'Field Spaniel','small','','','1'),('', 'Finnish Lapphund','medium','','','1'),('', 'Finnish Spitz','medium','','','1'),('', 'Flat-Coated Retriever','medium','','','1'),('', 'Fox Terrier','small','','','1'),('', 'French Bulldog','small','','','1'),('', 'German Pinscher','medium','','','1'),('', 'German Shepherd Dog','large','','','1'),('', 'German Shorthaired Pointer','medium','','','1'),('', 'German Wirehaired Pointer','large','','','1'),('', 'Giant Schnauzer','large','','','1'),('', 'Glen of Imaal Terrier','small','','','1'),('', 'Goldador','large','1','','1'),('', 'Golden Retriever','medium','','','1'),('', 'Goldendoodle','large','1','','1'),('', 'Gordon Setter','medium','','','1'),('', 'Great Dane','large','','','1'),('', 'Great Pyrenees','large','','','1'),('', 'Greater Swiss Mountain Dog','large','','','1'),('', 'Greyhound','large','','','1'),('', 'Harrier','medium','','','1'),('', 'Havanese','small','','','1'),('', 'Ibizan Hound','medium','','','1'),('', 'Icelandic Sheepdog','medium','','','1'),('', 'Irish Red and White Setter','medium','','','1'),('', 'Irish Setter','large','','','1'),('', 'Irish Terrier','medium','','','1'),('', 'Irish Water Spaniel','medium','','','1'),('', 'Irish Wolfhound','large','','','1'),('', 'Italian Greyhound','small','','','1'),('', 'Jack Russell Terrier','small','','','1'),('', 'Japanese Chin','small','','','1'),('', 'Keeshond','medium','','','1'),('', 'Kerry Blue Terrier','medium','','','1'),('', 'Komondor','large','','','1'),('', 'Kooikerhondje','medium','','','1'),('', 'Korean Jindo Dog','medium','','','1'),('', 'Kuvasz','large','','','1'),('', 'Labradoodle','large','1','','1'),('', 'Labrador Retriever','large','','','1'),('', 'Lakeland Terrier','small','','','1'),('', 'Lancashire Heeler','small','','','1'),('', 'Leonberger','large','','','1'),('', 'Lhasa Apso','small','','','1'),('', 'Lowchen','small','','','1'),('', 'Maltese Shih Tzu','small','1','','1'),('', 'Maltese','small','','','1'),('', 'Maltipoo','small','1','','1'),('', 'Manchester Terrier','small','','','1'),('', 'Mastiff','large','','','1'),('', 'Miniature Pinscher','small','','','1'),('', 'Miniature Schnauzer','small','','','1'),('', 'Mutt','medium','1','','1'),('', 'Neapolitan Mastiff','large','','','1'),('', 'Newfoundland','large','','','1'),('', 'Norfolk Terrier','small','','','1'),('', 'Norwegian Buhund','medium','','','1'),('', 'Norwegian Elkhound','medium','','','1'),('', 'Norwegian Lundehund','medium','','','1'),('', 'Norwich Terrier','small','','','1'),('', 'Nova Scotia Duck Tolling Retriever','medium','','','1'),('', 'Old English Sheepdog','large','','','1'),('', 'Otterhound','large','','','1'),('', 'Papillon','small','','','1'),('', 'Peekapoo','small','1','','1'),('', 'Pekingese','small','','','1'),('', 'Pembroke Welsh Corgi','small','','','1'),('', 'Petit Basset Griffon Vendeen','small','','','1'),('', 'Pharaoh Hound','medium','','','1'),('', 'Plott','medium','','','1'),('', 'Pocket Beagle','small','','','1'),('', 'Pointer','medium','','','1'),('', 'Polish Lowland Sheepdog','medium','','','1'),('', 'Pomeranian','small','','','1'),('', 'Pomsky','small','1','','1'),('', 'Poodle','large','','','1'),('', 'Portuguese Water Dog','medium','','','1'),('', 'Pug','small','','','1'),('', 'Puggle','small','','','1'),('', 'Puli','medium','','','1'),('', 'Pyrenean Shepherd','small','','','1'),('', 'Rat Terrier','small','','','1'),('', 'Redbone Coonhound','medium','','','1'),('', 'Rhodesian Ridgeback','large','','','1'),('', 'Rottweiler','medium','','','1'),('', 'Saint Bernard','large','','','1'),('', 'Saluki','large','','','1'),('', 'Samoyed','medium','','','1'),('', 'Schipperke','small','','','1'),('', 'Schnoodle','large','','','1'),('', 'Scottish Deerhound','large','1','','1'),('', 'Scottish Terrier','small','','','1'),('', 'Sealyham Terrier','small','','','1'),('', 'Shetland Sheepdog','small','','','1'),('', 'Shiba Inu','small','','','1'),('', 'Shih Tzu','small','','','1'),('', 'Siberian Husky','medium','','','1'),('', 'Silky Terrier','small','','','1'),('', 'Skye Terrier','small','','','1'),('', 'Sloughi','large','','','1'),('', 'Small Munsterlander Pointer','medium','','','1'),('', 'Soft Coated Wheaten Terrier','medium','','','1'),('', 'Stabyhoun','medium','','','1'),('', 'Staffordshire Bull Terrier','small','','','1'),('', 'Standard Schnauzer','medium','','','1'),('', 'Sussex Spaniel','small','','','1'),('', 'Swedish Vallhund','medium','','','1'),('', 'Tibetan Mastiff','large','','','1'),('', 'Tibetan Spaniel','small','','','1'),('', 'Tibetan Terrier','small','','','1'),('', 'Toy Fox Terrier','small','','','1'),('', 'Treeing Tennessee Brindle','medium','','','1'),('', 'Treeing Walker Coonhound','large','','','1'),('', 'Vizsla','medium','','','1'),('', 'Weimaraner','large','','','1'),('', 'Welsh Springer Spaniel','medium','','','1'),('', 'Welsh Terrier','small','','','1'),('', 'West Highland White Terrier','small','','','1'),('', 'Whippet','medium','','','1'),('', 'Wirehaired Pointing Griffon','medium','','','1'),('', 'Xoloitzcuintli','medium','','','1'),('', 'Yorkipoo','small','1','','1'),('', 'Yorkshire Terrier','small','','','1')

INSERT INTO breeds values ('', 'Abyssinian','','','','2'),('', 'American Curl Longhair','','','','2'),('', 'American Curl Shorthair','','','','2'),('', 'Balinese','','','','2'),('', 'Bengal','','','','2'),('', 'British Longhair','','','','2'),('', 'British Shorthair','','','','2'),('', 'Burmese','','','','2'),('', 'Burmilla','','','','2'),('', 'Chartreux','','','','2'),('', 'Cornish Rex','','','','2'),('', 'Cymric','','','','2'),('', 'Devon Rex','','','','2'),('', 'Don Sphynx','','','','2'),('', 'Egyptian Mau','','','','2'),('', 'European','','','','2'),('', 'Exotic','','','','2'),('', 'German Rex','','','','2'),('', 'Japanese Bobtail','','','','2'),('', 'Korat','','','','2'),('', 'Kurilean Bobtail Longhair','','','','2'),('', 'Kurilean Bobtail Shorthair','','','','2'),('', 'LaPerm Longhair','','','','2'),('', 'LaPerm Shorthair','','','','2'),('', 'Maine Coon','','','','2'),('', 'Manx','','','','2'),('', 'Neva Masquerade','','','','2'),('', 'Norwegian Forest Cat','','','','2'),('', 'Ocicat','','','','2'),('', 'Oriental Longhair','','','','2'),('', 'Oriental Shorthair','','','','2'),('', 'Persian','','','','2'),('', 'Peterbald','','','','2'),('', 'Ragdoll','','','','2'),('', 'Russian Blue','','','','2'),('', 'Sacred Birman','','','','2'),('', 'Selkirk Rex Longhair','','','','2'),('', 'Selkirk Rex Shorthair','','','','2'),('', 'Siamese','','','','2'),('', 'Siberian','','','','2'),('', 'Singapura','','','','2'),('', 'Snowshoe','','','','2'),('', 'Sokoke','','','','2'),('', 'Somali','','','','2'),('', 'Sphynx','','','','2'),('', 'Thai','','','','2'),('', 'Turkish Angora','','','','2'),('', 'Turkish Van','','','','2')

