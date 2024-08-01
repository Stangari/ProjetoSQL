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

-- Exercício 2 --
SELECT 
    D.NOM_DISCIPLINA AS 'Disciplina', 
    P.NOME_PROFESSOR AS 'Professor', 
	DO.BLOCO AS 'Bloco',
    DO.SALA AS 'Sala',
    CASE DIA_SEMANA 
        WHEN 1 THEN 'Domingo'
        WHEN 2 THEN 'Segunda-feira'
        WHEN 3 THEN 'Terça-feira'
        WHEN 4 THEN 'Quarta-feira'
        WHEN 5 THEN 'Quinta-feira'
        WHEN 6 THEN 'Sexta-feira'
        WHEN 7 THEN 'Sábado'
    END AS 'Dia Semana', 
    DO.HOR_INICIO AS 'Horário Início', 
    DO.HOR_FIM AS 'Horário Fim', 
    A.RA AS 'RA', 
    A.NOME_ALUNO AS 'Nome' 
FROM 
    DISCIPLINA_OFERECIDA DO 
    JOIN DISCIPLINA D ON DO.COD_DISCIPLINA = D.COD_DISCIPLINA 
    JOIN PROFESSOR P ON DO.MATRICULA = P.MATRICULA 
    JOIN TURMA T ON DO.NUM_TURMA = T.NUM_TURMA 
    JOIN MATRICULA M ON T.NUM_TURMA = M.NUM_TURMA 
    JOIN ALUNO A ON M.RA = A.RA

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

-- Exercício 4 --
SELECT 
    DIS.NOM_DISCIPLINA AS 'Disciplina',
    PROF.NOME_PROFESSOR AS 'Professor',
    PROF.TITULACAO AS 'Título',
    DO.BLOCO AS 'Bloco',
    DO.SALA AS 'Sala',
    DO.HOR_INICIO AS 'Horário Início',
    DO.HOR_FIM AS 'Horário Fim',
    COUNT(M.RA) AS 'Matriculados',
    COUNT(M.DTA_CANCELAMENTO_MATRICULA) AS 'Matrículas Canceladas',
    SUM(CASE WHEN (AV.NOTA_A1+AV.NOTA_A2)/2 >= 5 THEN 1 ELSE 0 END) AS 'Aprovados Direto',
    ROUND((SUM(CASE WHEN (AV.NOTA_A1+AV.NOTA_A2)/2 >= 5 THEN 1 ELSE 0 END) / COUNT(M.RA)) * 100, 2) AS '% Aprovados Direto',
    SUM(CASE WHEN (AV.NOTA_A1+AV.NOTA_A2)/2 < 5 AND AV.NOTA_AF IS NULL THEN 1 ELSE 0 END) AS 'Reprovados Direto',
    ROUND((SUM(CASE WHEN (AV.NOTA_A1+AV.NOTA_A2)/2 < 5 AND AV.NOTA_AF IS NULL THEN 1 ELSE 0 END) / COUNT(M.RA)) * 100, 2) AS '% Reprovados Direto',
    SUM(CASE WHEN AV.NOTA_AF IS NOT NULL THEN 1 ELSE 0 END) AS 'Alunos AF',
    ROUND((SUM(CASE WHEN AV.NOTA_AF IS NOT NULL THEN 1 ELSE 0 END) / COUNT(M.RA)) * 100, 2) AS '% Alunos AF',
    SUM(CASE WHEN AV.NOTA_AF >= 5 THEN 1 ELSE 0 END) AS 'Aprovados AF',
    ROUND((SUM(CASE WHEN AV.NOTA_AF >= 5 THEN 1 ELSE 0 END) / SUM(CASE WHEN AV.NOTA_AF IS NOT NULL THEN 1 ELSE 0 END)) * 100, 2) AS '% Aprovados AF',
    SUM(CASE WHEN AV.NOTA_AF < 5 AND AV.NOTA_AF IS NOT NULL THEN 1 ELSE 0 END) AS 'Reprovados AF',
    ROUND((SUM(CASE WHEN AV.NOTA_AF < 5 AND AV.NOTA_AF IS NOT NULL THEN 1 ELSE 0 END) / SUM(CASE WHEN AV.NOTA_AF IS NOT NULL THEN 1 ELSE 0 END)) * 100, 2) AS '% Reprovados AF'
FROM 
    TURMA T
    INNER JOIN MATRICULA M ON T.NUM_TURMA = M.NUM_TURMA
    INNER JOIN DISCIPLINA_OFERECIDA DO ON T.NUM_TURMA = DO.NUM_TURMA
    INNER JOIN DISCIPLINA DIS ON DO.COD_DISCIPLINA = DIS.COD_DISCIPLINA
    INNER JOIN PROFESSOR PROF ON DO.MATRICULA = PROF.MATRICULA
    LEFT JOIN AVALIACAO AV ON M.RA = AV.RA AND DO.NUM_DISCIPLINA_OFERECIDA = AV.NUM_DISCIPLINA_OFERECIDA
GROUP BY 
    DIS.NOM_DISCIPLINA,
    PROF.NOME_PROFESSOR,
    PROF.TITULACAO,
    DO.SALA,
    DO.BLOCO,
    DO.DIA_SEMANA,
    DO.HOR_INICIO,
    DO.HOR_FIM