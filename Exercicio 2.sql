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