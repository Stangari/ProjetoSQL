-- Criação das Turmas
INSERT INTO TURMA(NUM_TURMA, DTA_INICIO_AULAS, DTA_FIM_AULAS) VALUES
(1, '2022-08-01', '2022-12-20'),
(2, '2023-02-13', '2023-06-30');

-- Criação dos Alunos para a Turma A
INSERT INTO ALUNO(RA, NOME_ALUNO, SEXO_ALUNO) VALUES
(1, 'João', 'M'),
(2, 'Maria', 'F'),
(3, 'Pedro', 'M'),
(4, 'Ana', 'F'),
(5, 'Lucas', 'M'),
(6, 'Paula', 'F'),
(7, 'Diego', 'M'),
(8, 'Sofia', 'F'),
(9, 'Gustavo', 'M'),
(10, 'Carla', 'F');

-- Criação dos Alunos para a Turma B
INSERT INTO ALUNO(RA, NOME_ALUNO, SEXO_ALUNO) VALUES
(11, 'Rafael', 'M'),
(12, 'Fernanda', 'F'),
(13, 'Thiago', 'M'),
(14, 'Julia', 'F'),
(15, 'Vinicius', 'M'),
(16, 'Mariana', 'F'),
(17, 'Rodrigo', 'M'),
(18, 'Bianca', 'F'),
(19, 'Renato', 'M'),
(20, 'Amanda', 'F');

-- Criação dos Professores
INSERT INTO PROFESSOR(MATRICULA, NOME_PROFESSOR, TITULACAO, SEXO_PROFESSOR) VALUES
(1, 'Carlos', 'Doutor', 'M'),
(2, 'Ana', 'Doutora', 'F'),
(3, 'Bruno', 'Mestre', 'M'),
(4, 'Patricia', 'Mestre', 'F');

-- Criação das Disciplinas
INSERT INTO DISCIPLINA(COD_DISCIPLINA, NOM_DISCIPLINA, CARGA_HORARIA) VALUES
(1, 'Matemática', 60),
(2, 'Física', 60),
(3, 'Química', 60),
(4, 'Biologia', 60);

-- Inserindo as matriculas na turma A
INSERT INTO MATRICULA(NUM_MATRICULA, DTA_MATRICULA, DTA_CANCELAMENTO_MATRICULA, NUM_TURMA, RA)
VALUES
(1, '2022-08-01', NULL, 1, 1),
(2, '2022-08-01', NULL, 1, 2),
(3, '2022-08-01', NULL, 1, 3),
(4, '2022-08-01', NULL, 1, 4),
(5, '2022-08-01', NULL, 1, 5),
(6, '2022-08-01', NULL, 1, 6),
(7, '2022-08-01', NULL, 1, 7),
(8, '2022-08-01', NULL, 1, 8),
(9, '2022-08-01', NULL, 1, 9),
(10, '2022-08-01', NULL, 1, 10);

-- Inserindo as matriculas na turma B
INSERT INTO MATRICULA(NUM_MATRICULA, DTA_MATRICULA, DTA_CANCELAMENTO_MATRICULA, NUM_TURMA, RA)
VALUES
(11, '2023-02-13', NULL, 2, 11),
(12, '2023-02-13', NULL, 2, 12),
(13, '2023-02-13', NULL, 2, 13),
(14, '2023-02-13', NULL, 2, 14),
(15, '2023-02-13', NULL, 2, 15),
(16, '2023-02-13', NULL, 2, 16),
(17, '2023-02-13', NULL, 2, 17),
(18, '2023-02-13', NULL, 2, 18),
(19, '2023-02-13', NULL, 2, 19),
(20, '2023-02-13', NULL, 2, 20);

-- Inserção das disciplinas 
INSERT INTO DISCIPLINA_OFERECIDA (NUM_DISCIPLINA_OFERECIDA, SALA, BLOCO, DIA_SEMANA, HOR_INICIO
,HOR_FIM, NUM_TURMA, COD_DISCIPLINA, MATRICULA)
VALUES 
(1,'Sala 1','Bloco 1', 2, '08:30:00', '12:00:00', 1, 1, 4),
(2,'Sala 1','Bloco 1', 2, '08:30:00', '12:00:00', 1, 2, 3),
(3,'Sala 1','Bloco 1', 3, '08:30:00', '12:00:00', 1, 3, 2),
(4,'Sala 1','Bloco 1', 4, '08:30:00', '12:00:00', 1, 4, 1),
(5,'Sala 1','Bloco 1', 4, '08:30:00', '12:00:00', 2, 1, 4),
(6,'Sala 1','Bloco 1', 5, '08:30:00', '12:00:00', 2, 2, 3),
(7,'Sala 1','Bloco 1', 6, '08:30:00', '12:00:00', 2, 3, 2),
(8,'Sala 1','Bloco 1', 6, '08:30:00', '12:00:00', 2, 4, 1)
;

-- Inserção das notas das avaliações da turma A 
INSERT INTO AVALIACAO (SEQ_AVALIACAO_ALUNO, NOTA_A2, NOTA_A1, NOTA_AF, RA,
NUM_DISCIPLINA_OFERECIDA)
VALUES 
(1, 0.00 ,0.00 , NULL , 1 , 1),
(2, 5.00 ,5.00 , NULL , 2 , 1),
(3, 5.00 ,5.00 , NULL , 3 , 1),
(4, 5.00 ,5.00 , NULL , 4 , 1),
(5, 5.00 ,5.00 , NULL , 5 , 1),
(6, 2.00 ,3.00 , 1.00 , 6 , 1),
(7, 2.00 ,3.00 , 2.00 , 7 , 1),
(8, 2.00 ,3.00 , 5.00 , 8 , 1),
(9, 2.00 ,3.00 , 5.00 , 9 , 1),
(10, 2.00 ,3.00 , 5.00 , 10 , 1) 
;

-- Inserção das notas das avaliações da turma B 
INSERT INTO AVALIACAO (SEQ_AVALIACAO_ALUNO, NOTA_A2, NOTA_A1, NOTA_AF, RA,
NUM_DISCIPLINA_OFERECIDA)
VALUES 
(11, 0.00 ,0.00 , NULL , 1 , 4),
(12, 5.00 ,5.00 , NULL , 2 , 4),
(13, 5.00 ,5.00 , NULL , 3 , 4),
(14, 5.00 ,5.00 , NULL , 4 , 4),
(15, 5.00 ,5.00 , NULL , 5 , 4),
(16, 2.00 ,3.00 , NULL , 6 , 4),
(17, 2.00 ,3.00 , NULL , 7 , 4),
(18, 2.00 ,3.00 , NULL , 8 , 4),
(19, 2.00 ,3.00 , NULL , 9 , 4),
(20, 2.00 ,3.00 , NULL , 10 ,4) 
;