#user_profile
CREATE TABLE `user_profile` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `user_dob` date NOT NULL,
  `sex` char(2) DEFAULT NULL,
  `country` int(5) NOT NULL,
  `province` int(5) NOT NULL,
  `city` int(5) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `photo` longblob,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#user
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` int(5) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`username`),
  CONSTRAINT FK_userUser_profile FOREIGN KEY (`user_id`) REFERENCES user_profile(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#pet
CREATE TABLE `pet` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pet_dob` date NOT NULL,
  `pet_sex` char(2) NOT NULL,
  `variant` int(5) NOT NULL,
  `furcolor` varchar(50) DEFAULT NULL,
  `weight_num` varchar(5) NOT NULL,
  `weight_scale` varchar(50) NOT NULL,
  `breed` varchar(50) NOT NULL,
  `pet_desc` text,
  `pet_photo` longblob,
  `kind` int NOT NULL, #1=dog 2=cat
  `user_id` int(5) NOT NULL,
  `variant_pref` varchar(50) DEFAULT NULL, #variant bisa lebih dari 1 dan bentuknya array yang di stringify
  `age_min` varchar(5) DEFAULT NULL,
  `age_max` varchar(5) DEFAULT NULL,
  `city_pref` varchar(50) DEFAULT NULL,#city bisa lebih dari 1 dan bentuknya array yang di stringify
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  CONSTRAINT FK_user_profilePet FOREIGN KEY (`user_id`) REFERENCES user_profile(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#history with
CREATE TABLE `history_with` (
  `pet_m` int(5) NOT NULL ,
  `pet_f` int(5) NOT NULL ,
  `match_stat` int(1) NOT NULL,
  `match_date` date NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  FOREIGN KEY (`pet_m`) REFERENCES pet(`id`),
  FOREIGN KEY (`pet_f`) REFERENCES pet(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#matched with
CREATE TABLE `matched_with` (
  `pet_m` int(5) NOT NULL ,
  `pet_f` int(5) NOT NULL ,
  `like_stat` int(1) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  FOREIGN KEY (`pet_m`) REFERENCES pet(`id`),
  FOREIGN KEY (`pet_f`) REFERENCES pet(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#TABLE SOURCE
#province
#city
#variant
#????