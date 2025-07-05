CREATE TABLE `contato_responsavel` (
  `id_contato` int NOT NULL AUTO_INCREMENT,
  `responsavel_id` int NOT NULL,
  `contato` varchar(100) NOT NULL,
  `tipo_contato` enum('whatsapp','celular','residencial','trabalho','e-mail') DEFAULT NULL,
  PRIMARY KEY (`id_contato`),
  KEY `fk_contato_responsavel` (`responsavel_id`),
  CONSTRAINT `fk_contato_responsavel` FOREIGN KEY (`responsavel_id`) REFERENCES `responsavel` (`id_responsavel`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci