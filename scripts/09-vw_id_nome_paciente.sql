CREATE VIEW `vw_id_nome_paciente` AS 
SELECT `paciente`.`id_paciente`,
`paciente`.`nome_paciente`
FROM `paciente`;