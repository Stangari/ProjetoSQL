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