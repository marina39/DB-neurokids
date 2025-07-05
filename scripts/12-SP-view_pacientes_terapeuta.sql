DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_pacientes_terapeuta`(IN id INT)
BEGIN
	DECLARE primeiro_nome VARCHAR(50);

	SELECT LOWER(SUBSTRING_INDEX(nome_profissional, ' ', 1)) INTO primeiro_nome
	FROM profissional
	WHERE id_profissional = id;
    
    SET @query_view = CONCAT(
		'CREATE OR REPLACE VIEW ', 'view_pacientes_', primeiro_nome,
        ' AS SELECT cns, nome_paciente FROM paciente AS pc 
        JOIN paciente_terapia AS pt 
        ON pc.id_paciente = pt.paciente_id
        AND pt.profissional_id = ', id,
        ' ORDER BY pc.nome_paciente'
    );
    
	 PREPARE stmt FROM @query_view;
	 EXECUTE stmt;
	 DEALLOCATE PREPARE stmt;

END$$
DELIMITER ;

