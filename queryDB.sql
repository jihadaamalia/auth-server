-- user
CREATE TABLE `user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `first_login` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

  -- user_profile
  CREATE TABLE `user_profile` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `user_dob` date DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `username_id` int(5) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `city` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
   CONSTRAINT FK_user_idUser_profile FOREIGN KEY (`username_id`) REFERENCES user(`id`),
   CONSTRAINT FK_cityUser_profile FOREIGN KEY (`city`) REFERENCES regencies(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- pet
CREATE TABLE `pet` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `pet_name` varchar(50) DEFAULT NULL,
  `pet_dob` date DEFAULT NULL,
  `pet_sex` char(2) DEFAULT NULL,
  `furcolor` varchar(50) DEFAULT NULL,
  `weight` varchar(5) DEFAULT NULL,
  `breed` int(11) DEFAULT NULL,
  `pet_photo` varchar(255) DEFAULT NULL,
  `breed_cert` varchar(50) DEFAULT NULL,
  `pet_desc` text DEFAULT NULL,
  `user_id` int(5) NOT NULL,
  `breed_pref` int(11) DEFAULT NULL,
  `age_min` varchar(5) DEFAULT NULL,
  `age_max` varchar(5) DEFAULT NULL,
  `city_pref` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  CONSTRAINT FK_breedPet FOREIGN KEY (`breed`) REFERENCES breeds(`id`),
  CONSTRAINT FK_user_idPet FOREIGN KEY (`user_id`) REFERENCES user_profile(`id`),
  CONSTRAINT FK_breed_prefPet FOREIGN KEY (`breed_pref`) REFERENCES breeds(`id`),
  CONSTRAINT FK_city_prefPet FOREIGN KEY (`city_pref`) REFERENCES regencies(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- history with
CREATE TABLE `history_with` (
  `pet_m` int(5) NOT NULL ,
  `pet_f` int(5) NOT NULL ,
  `match_stat` char(1) NOT NULL,
  `match_date` date NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT FK_pet_mHistory_with FOREIGN KEY (`pet_m`) REFERENCES pet(`id`),
  CONSTRAINT FK_pet_fHistory_with FOREIGN KEY (`pet_f`) REFERENCES pet(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- like
CREATE TABLE `liked` (
  `from` int(5) NOT NULL ,
  `to` int(5) NOT NULL ,
  `like_stat` char(1) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT FK_pet_mLiked FOREIGN KEY (`from`) REFERENCES pet(`id`),
  CONSTRAINT FK_pet_fLiked FOREIGN KEY (`to`) REFERENCES pet(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- message with
CREATE TABLE `room_chat` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `member_chat` (
  `member_id` int(5) NOT NULL ,
  `room_id` int(5) NOT NULL ,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT memberidMember_chat FOREIGN KEY (`member_id`) REFERENCES pet(`id`),
  CONSTRAINT roomidRoom_chat FOREIGN KEY (`room_id`) REFERENCES room_chat(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `message_with` (
  `from` int(5) NOT NULL ,
  `image` varchar(255) DEFAULT NULL,
  `text` LONGTEXT DEFAULT NULL,
  'room_id' int(5) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fromMessage_with FOREIGN KEY (`from`) REFERENCES pet(`id`),
  CONSTRAINT roomidMessage_with FOREIGN KEY (`room_id`) REFERENCES room_chat(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




-- vacciness
CREATE TABLE `vaccines` (
  `id` int(5) NOT NULL  AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL ,
  `variant` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_variantvaccines` FOREIGN KEY (`variant`) REFERENCES `variants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- have vaccines
CREATE TABLE `have_vaccines` (
  `id_pet` int(5) NOT NULL ,
  `id_vaccine` int(5) NOT NULL ,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `FK_id_petHave_vaccines` FOREIGN KEY (`id_pet`) REFERENCES `pet` (`id`),
  CONSTRAINT `FK_id_vaccineHave_vaccines` FOREIGN KEY (`id_vaccine`) REFERENCES `vaccines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- login
CREATE TABLE `login` (
  `username_id` int(5) NOT NULL ,
  `fcm` int(5) NOT NULL ,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `username_idLogin` FOREIGN KEY (`username_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;