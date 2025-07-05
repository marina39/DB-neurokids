CREATE TABLE `profissional` (
  `id_profissional` int NOT NULL AUTO_INCREMENT,
  `nome_profissional` varchar(100) NOT NULL,
  `terapia_id` int DEFAULT NULL,
  PRIMARY KEY (`id_profissional`),
  KEY `fk_terapia` (`terapia_id`),
  CONSTRAINT `fk_terapia` FOREIGN KEY (`terapia_id`) REFERENCES `terapia` (`id_terapia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci