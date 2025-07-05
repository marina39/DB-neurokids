CREATE TABLE `agenda` (
  `id_agenda` int NOT NULL AUTO_INCREMENT,
  `paciente_id` int NOT NULL,
  `terapia_id` int DEFAULT NULL,
  `profissional_id` int DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `dia_semana` varchar(20) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `motivo_fim` enum('Alta','Sem profissional') DEFAULT NULL,
  PRIMARY KEY (`id_agenda`),
  KEY `fk_atendimento_paciente` (`paciente_id`),
  KEY `fk_marcacao_terapia` (`terapia_id`),
  KEY `fk_marcacao_profissional` (`profissional_id`),
  CONSTRAINT `fk_atendimento_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `fk_marcacao_profissional` FOREIGN KEY (`profissional_id`) REFERENCES `profissional` (`id_profissional`),
  CONSTRAINT `fk_marcacao_terapia` FOREIGN KEY (`terapia_id`) REFERENCES `terapia` (`id_terapia`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci