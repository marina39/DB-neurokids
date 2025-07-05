DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_terapias_paciente`(IN p_id INT)
BEGIN

	SELECT
		pc.id_paciente,
		pc.nome_paciente, 
		te.tipo_terapia, 
		pr.nome_profissional,
        ag.horario,
        ag.dia_semana
	FROM paciente AS pc
	JOIN agenda AS ag ON pc.id_paciente = ag.paciente_id
	JOIN terapia AS te ON te.id_terapia = ag.terapia_id
	LEFT JOIN profissional AS pr ON pr.id_profissional = ag.profissional_id
	WHERE pc.id_paciente = p_id
	ORDER BY ag.horario;

END$$
DELIMITER ;
