CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `nome_paciente` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `cns` varchar(18) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `endereco_id` int DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `fk_endereco` (`endereco_id`),
  CONSTRAINT `fk_endereco` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci