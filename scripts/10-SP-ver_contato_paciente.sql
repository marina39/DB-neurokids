DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_contato_paciente`(IN p_id INT)
BEGIN

SELECT 
	pc.nome_paciente,  
    re.nome_responsavel, 
    cr.contato
FROM paciente AS pc
JOIN responsavel_paciente AS rp ON pc.id_paciente = rp.paciente_id
JOIN responsavel AS re ON re.id_responsavel = rp.responsavel_id
LEFT JOIN contato_responsavel as cr ON re.id_responsavel = cr.responsavel_id
WHERE pc.id_paciente = p_id
	AND cr.tipo_contato = 'Celular';

END$$
DELIMITER ;
