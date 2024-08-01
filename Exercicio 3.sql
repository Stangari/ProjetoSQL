-- Exercício 3 --
SELECT d.NOM_DISCIPLINA AS 'Disciplina',
 p.NOME_PROFESSOR AS 'Professor',
 do.BLOCO AS 'Bloco',
 do.SALA AS 'Sala', 
	CASE do.DIA_SEMANA
		WHEN 1 THEN 'Domingo'
		WHEN 2 THEN 'Segunda-feira'
		WHEN 3 THEN 'Terça-feira'
		WHEN 4 THEN 'Quarta-feira'
		WHEN 5 THEN 'Quinta-feira'
		WHEN 6 THEN 'Sexta-feira'
		WHEN 7 THEN 'Sábado'
	END AS 'Dia Semana',
	DATE_FORMAT(do.HOR_INICIO, '%H:%i') AS 'Horário Início' ,
	DATE_FORMAT(do.HOR_FIM, '%H:%i') AS 'Horário Fim',
	a.RA AS 'RA',
    a.NOME_ALUNO AS 'Nome',
    av.NOTA_A2 AS 'Nota A2',
    av.NOTA_A1 AS 'Nota A1',
    av.NOTA_AF AS 'Nota AF',
	CASE
		WHEN (av.NOTA_A1 + av.NOTA_A2) >= 5 AND av.NOTA_AF IS NULL THEN 'APROVADO'
		WHEN (av.NOTA_A1 + av.NOTA_A2) < 4 OR av.NOTA_AF < 4 THEN 'REPROVADO'
		ELSE 'AVALIAÇÃO FINAL'
	END AS 'Situação Aluno'
FROM DISCIPLINA_OFERECIDA do
INNER JOIN DISCIPLINA d ON do.COD_DISCIPLINA = d.COD_DISCIPLINA
INNER JOIN TURMA t ON do.NUM_TURMA = t.NUM_TURMA
INNER JOIN PROFESSOR p ON do.MATRICULA = p.MATRICULA
INNER JOIN MATRICULA m ON do.NUM_TURMA = m.NUM_TURMA
INNER JOIN ALUNO a ON m.RA = a.RA
LEFT JOIN AVALIACAO av ON m.RA = av.RA AND do.NUM_DISCIPLINA_OFERECIDA = av.NUM_DISCIPLINA_OFERECIDA
WHERE t.NUM_TURMA = 1
ORDER BY a.NOME_ALUNO;