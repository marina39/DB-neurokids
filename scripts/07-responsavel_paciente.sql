CREATE TABLE `responsavel_paciente` (
  `paciente_id` int NOT NULL,
  `responsavel_id` int NOT NULL,
  PRIMARY KEY (`paciente_id`,`responsavel_id`),
  KEY `fk_responsavel` (`responsavel_id`),
  CONSTRAINT `fk_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `fk_responsavel` FOREIGN KEY (`responsavel_id`) REFERENCES `responsavel` (`id_responsavel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci