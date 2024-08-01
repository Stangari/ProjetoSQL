-- Exercicio 1
SELECT PROF.NOME_PROFESSOR AS 'Professor', 
PROF.TITULACAO AS 'Titulo',
 DIC.NOM_DISCIPLINA AS 'Disciplina',
 TUR.DTA_INICIO_AULAS AS 'Início Aulas',
TUR.DTA_FIM_AULAS AS 'Fim Aulas',
COUNT(MATRI.RA) AS 'Qtde Alunos',
DP.BLOCO AS 'Bloco',
DP.SALA AS 'Sala',
CASE DP.DIA_SEMANA 
WHEN 1 THEN 'DOMINGO'
WHEN 2 THEN 'SEGUNDA'
WHEN 3 THEN 'TERÇA'
WHEN 4 THEN 'QUARTA'
WHEN 5 THEN 'QUINTA'
WHEN 6 THEN 'SEXTA'
WHEN 7 THEN 'SÁBADO'
END AS 'Dia semana' ,
DP.HOR_INICIO AS 'Horário Inicio',
 DP.HOR_FIM AS 'Horário Fim'
FROM DISCIPLINA_OFERECIDA DP
INNER JOIN PROFESSOR PROF ON DP.MATRICULA = PROF.MATRICULA
INNER JOIN DISCIPLINA DIC ON DIC.COD_DISCIPLINA = DP.COD_DISCIPLINA
INNER JOIN TURMA TUR ON TUR.NUM_TURMA = DP.NUM_TURMA
INNER JOIN MATRICULA MATRI ON TUR.NUM_TURMA = MATRI.NUM_TURMA
INNER JOIN ALUNO ALU ON ALU.RA = MATRI.RA
GROUP BY PROF.NOME_PROFESSOR, PROF.TITULACAO, DIC.NOM_DISCIPLINA,
TUR.DTA_INICIO_AULAS, TUR.DTA_FIM_AULAS, DP.DIA_SEMANA, DP.SALA, DP.BLOCO, DP.HOR_INICIO,
DP.HOR_FIM;