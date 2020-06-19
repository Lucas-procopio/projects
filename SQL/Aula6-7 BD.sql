-- Aula7 BD - 14/03/2020

DROP DATABASE aula7;
CREATE DATABASE aula7;
\c aula7

CREATE TABLE aluno (
	matricula 	INTEGER 	PRIMARY KEY,
	nome 		VARCHAR(50)	NOT NULL,
	email 		VARCHAR(50)	NOT NULL,
	genero 		CHAR		CHECK(genero = 'f' OR genero = 'm')	NOT NULL,
	dataNasc 	DATE		NOT NULL);

CREATE TABLE responsavel (
	codResponsavel 	INTEGER 	PRIMARY KEY,
	nome 			VARCHAR(50)	NOT NULL,
	cpf 			CHAR(14)	NOT NULL	UNIQUE,
	matricula 		INTEGER		NOT NULL	UNIQUE,
	FOREIGN KEY(matricula) REFERENCES aluno (matricula));

CREATE TABLE professor (
	codProfessor 	INTEGER 	PRIMARY KEY,
	nome 			VARCHAR(50)	NOT NULL,
	titulacao 		VARCHAR(40)	NOT NULL);

CREATE TABLE disciplina (
	codDisciplina 	INTEGER 	PRIMARY KEY,
	nome 			VARCHAR(60)	NOT NULL,
	cargaHr 		INTEGER		NOT NULL,
	cod_prof 		INTEGER,
	FOREIGN KEY(cod_prof) REFERENCES professor (codProfessor));

CREATE TABLE notas (
	anoLetivo 		INTEGER,
	cod_disc 		INTEGER,
	mat_aluno 		INTEGER,
	nota1 			FLOAT,
	nota2 			FLOAT,
	nota3 			FLOAT,
	PRIMARY KEY(anoLetivo, cod_disc, mat_aluno),
	FOREIGN KEY(cod_disc) REFERENCES disciplina (codDisciplina),
	FOREIGN KEY(mat_aluno) REFERENCES aluno (matricula));

-- Criar Sequências.

CREATE SEQUENCE seqaluno;
CREATE SEQUENCE seqresp START WITH 1010 INCREMENT BY 10;
CREATE SEQUENCE seqprof START WITH 101;
CREATE SEQUENCE seqdisc;

-- Exibir objetos da base de dados.
\d

-- Exibir estrutura das tabelas.
\d aluno
\d responsavel
\d professor
\d disciplina
\d notas


-- Inserir dados nas tabelas.

INSERT INTO aluno VALUES(NEXTVAL('seqaluno'), 'Leo', 'leo@uol.com', 'm', '1994-06-17'),
						(NEXTVAL('seqaluno'), 'Ana', 'ana@uol.com', 'f', '1998-03-29'),
						(NEXTVAL('seqaluno'), 'Bia', 'bia@aol.com', 'f', '1995-10-06'),
						(NEXTVAL('seqaluno'), 'Edu', 'edu@uol.com', 'm', '1990-08-21'),
						(NEXTVAL('seqaluno'), 'Nat', 'nat@uol.com', 'f', '1989-11-05'),
						(NEXTVAL('seqaluno'), 'Mel', 'mel@aol.com', 'f', '1985-04-30'),
						(NEXTVAL('seqaluno'), 'Rui', 'rui@uol.com', 'm', '1991-10-09');
						
SELECT * FROM aluno;

INSERT INTO responsavel VALUES(NEXTVAL('seqresp'), 'Pedro', '233.123.321-05', 5);
INSERT INTO responsavel VALUES(NEXTVAL('seqresp'), 'Maria', '444.123.321-16', 2);
INSERT INTO responsavel VALUES(NEXTVAL('seqresp'), 'Paulo', '064.123.321-41', 1);
INSERT INTO responsavel VALUES(NEXTVAL('seqresp'), 'Bruna', '124.123.321-27', 4);

SELECT * FROM responsavel;

INSERT INTO professor(codProfessor, nome, titulacao)
					  VALUES(NEXTVAL('seqprof'), 'Beto', 'Doutorado'),
							(NEXTVAL('seqprof'), 'Rafa', 'Pos Graduacao'),
							(NEXTVAL('seqprof'), 'Duda', 'Mestrado'),
							(NEXTVAL('seqprof'), 'Cadu', 'Graduacao');
							
SELECT * FROM professor;

ALTER TABLE disciplina ALTER COLUMN cod_prof DROP NOT NULL;

DELETE FROM notas;
DELETE FROM disciplina;

ALTER SEQUENCE seqdisc RESTART;

INSERT INTO disciplina VALUES (NEXTVAL('seqdisc'), 'Logica', 32, 104);
INSERT INTO disciplina VALUES (NEXTVAL('seqdisc'), 'BD', 32, 101);
INSERT INTO disciplina VALUES (NEXTVAL('seqdisc'), 'PHP', 60, 102);
INSERT INTO disciplina VALUES (NEXTVAL('seqdisc'), 'SQL Server', 32, 102);
INSERT INTO disciplina VALUES (NEXTVAL('seqdisc'), 'BI', 40, 101);
INSERT INTO disciplina VALUES (NEXTVAL('seqdisc'), 'UML', 20, NULL);
INSERT INTO disciplina VALUES (NEXTVAL('seqdisc'), 'Oracle', 32, 101);

SELECT * FROM disciplina;

INSERT INTO notas VALUES (2018, 3, 2);

SELECT * FROM notas;

UPDATE notas SET nota1 = 6.5
	WHERE mat_aluno = 2 AND cod_disc = 3
	AND anoLetivo = 2018;

UPDATE notas SET nota2 = 7
	WHERE mat_aluno = 2 AND cod_disc = 3
	AND anoLetivo = 2018;
	
UPDATE notas SET nota3 = 5
	WHERE mat_aluno = 2 AND cod_disc = 3
	AND anoLetivo = 2018;

/*
UPDATE notas SET nota1 = 6.5, nota2 = 7, nota3 = 5
	WHERE mat_aluno = 2 AND cod_disc = 3
	AND anoLetivo = 2018;
**/

SELECT * FROM notas;


INSERT INTO notas VALUES (2018, 6, 4, 8, 7.5, 5);
INSERT INTO notas VALUES (2018, 2, 3, 4, 9.5, 7);
INSERT INTO notas VALUES (2018, 7, 1, 5, 7, 6);
INSERT INTO notas VALUES (2018, 3, 6, 4, 9, 6);
INSERT INTO notas VALUES (2018, 1, 3, 7, 6, 6);
INSERT INTO notas VALUES (2018, 2, 2, 3, 5, 7);
INSERT INTO notas VALUES (2019, 5, 4, 8, 7, 4);
INSERT INTO notas VALUES (2019, 3, 1, 6, 6, 8);
INSERT INTO notas VALUES (2019, 5, 2, 7, 4, 6);
INSERT INTO notas VALUES (2019, 7, 6, 8, 7, 5);
INSERT INTO notas VALUES (2019, 1, 3, 6, 5, 5);
INSERT INTO notas VALUES (2019, 2, 2, 5, 8, 7);
INSERT INTO notas VALUES (2019, 3, 5, 5, 5.5, 5);
INSERT INTO notas VALUES (2019, 4, 1, 7, 8.5, 6);
INSERT INTO notas VALUES (2019, 6, 2, 6.5, 8.5, 8);
INSERT INTO notas VALUES (2019, 5, 3, 5.5, 5, 8);

SELECT * FROM notas;

-- Pesquisas

SELECT nome, 
	TO_CHAR(dataNasc, 'dd/mm/yyyy') AS Nascimento
	FROM aluno;

SELECT nome, 
	TO_CHAR(dataNasc, 'dd/mm/yyyy') AS Nascimento,
	AGE(dataNasc) AS Idade
	FROM aluno;
	
SELECT nome, 
	TO_CHAR(dataNasc, 'dd/mm/yyyy') AS Nascimento,
	DATE_PART('YEAR', dataNasc) AS AnoNascimento
	FROM aluno;

SELECT nome, 
	TO_CHAR(dataNasc, 'dd/mm/yyyy') AS Nascimento,
	DATE_PART('YEAR', AGE(dataNasc)) AS Idade
	FROM aluno;
	
SELECT p.nome AS Professor, titulacao,
	d.nome AS Disciplina, cargaHr
	FROM professor p INNER JOIN disciplina d
	ON codProfessor = cod_prof;

SELECT p.nome AS Professor, titulacao,
	d.nome AS Disciplina, cargaHr
	FROM professor p LEFT JOIN disciplina d
	ON codProfessor = cod_prof;

SELECT p.nome AS Professor, titulacao,
	d.nome AS Disciplina, cargaHr
	FROM professor p LEFT JOIN disciplina d
	ON codProfessor = cod_prof
	WHERE cod_prof IS NULL;
	
SELECT p.nome AS Professor, titulacao,
	d.nome AS Disciplina, cargaHr
	FROM professor p RIGHT JOIN disciplina d
	ON codProfessor = cod_prof;
	
SELECT p.nome AS Professor, titulacao,
	d.nome AS Disciplina, cargaHr
	FROM professor p RIGHT JOIN disciplina d
	ON codProfessor = cod_prof
	WHERE cod_prof IS NULL;

SELECT p.nome AS Professor, titulacao,
	d.nome AS Disciplina, cargaHr
	FROM professor p FULL JOIN disciplina d
	ON codProfessor = cod_prof

-- Pesquisas com mais de 2 tabelas.

SELECT anoLetivo, d.nome AS Disciplina, cargahr,
	a.nome AS Aluno, nota1, nota2, nota3
	FROM aluno a 
	INNER JOIN notas ON matricula = mat_aluno
	INNER JOIN disciplina d ON codDisciplina = cod_disc;

SELECT AVG(nota1) FROM notas;	

SELECT anoLetivo, d.nome AS Disciplina, cargahr,
	a.nome AS Aluno, nota1, nota2, nota3,
	(nota1 + nota2 + nota3) / 3 AS Media
	FROM aluno a 
	INNER JOIN notas ON matricula = mat_aluno
	INNER JOIN disciplina d ON codDisciplina = cod_disc;

SELECT anoLetivo, p.nome AS Professor, d.nome AS Disciplina,
	a.nome AS Aluno, nota1, nota2, nota3,
	(nota1 + nota2 + nota3) / 3 AS Media
	FROM aluno a 
	INNER JOIN notas ON matricula = mat_aluno
	INNER JOIN disciplina d ON codDisciplina = cod_disc
	LEFT JOIN professor p ON codProfessor = cod_prof;

-- Criar uma VIEW.

CREATE VIEW relMedias AS 
	SELECT anoLetivo, p.nome AS Professor, d.nome AS Disciplina,
	a.nome AS Aluno, nota1, nota2, nota3,
	(nota1 + nota2 + nota3) / 3 AS Media
	FROM aluno a 
	INNER JOIN notas ON matricula = mat_aluno
	INNER JOIN disciplina d ON codDisciplina = cod_disc
	LEFT JOIN professor p ON codProfessor = cod_prof;

SELECT * FROM relMedias;

SELECT anoLetivo, professor, disciplina, aluno,
	TO_CHAR(media, '99d99') AS media
	FROM relMedias;

SELECT anoLetivo, disciplina, aluno,
	TO_CHAR(media, '99d99') AS media,
	CASE 
		WHEN media >= 7 THEN 'Aprovado'
		WHEN media BETWEEN 6 AND 7 THEN 'Recuperacao'
		ELSE 'Reprovado'
	END AS Situacao
	FROM relMedias;

CREATE VIEW relSituacao AS
	SELECT anoLetivo, disciplina, aluno,
	TO_CHAR(media, '99d99') AS media,
	CASE 
		WHEN media >= 7 THEN 'Aprovado'
		WHEN media BETWEEN 6 AND 7 THEN 'Recuperacao'
		ELSE 'Reprovado'
	END AS Situacao
	FROM relMedias;

	
-- Exportar dados para arquivos.

\copy aluno TO C:/bancodedados/alunos.txt

\copy aluno TO C:/bancodedados/alunos.csv DELIMITER ';'

\copy (SELECT * FROM relSituacao) TO C:/bancodedados/SituacaoAlunos.csv DELIMITER ';' CSV HEADER

-- Criar cópia da tabela sem os dados.

CREATE TABLE copiaAluno(LIKE aluno);

\d copiaAluno
SELECT * FROM copiaAluno;

-- Importar dados de um arquivo.

\copy copiaAluno FROM C:/bancodedados/alunos.txt

SELECT * FROM copiaAluno;

-- SCHEMA - Partições de uma base de dados.

\d

-- Schema Atual.
SHOW SEARCH_PATH;

-- Criar um schema.
CREATE SCHEMA rh;

-- Criar tabela em um schema.
-- SERIAL - Campo inteiro com criação de sequência implícita.
CREATE TABLE rh.funcionario(
	codigo	 	SERIAL 		PRIMARY KEY,
	nome 		VARCHAR(50)	NOT NULL,
	genero 		CHAR		NOT NULL,
	salario		FLOAT		NOT NULL);

-- Selecionar schema.
SET SEARCH_PATH TO rh;

\d
\d funcionario

INSERT INTO funcionario(nome, genero, salario) VALUES('Beto', 'm', 4500),
													 ('Rafa', 'f', 4500),
													 ('Duda', 'f', 4500),
													 ('Cadu', 'm', 4500),
													 ('Rui', 'm', 4500);
						
SELECT * FROM funcionario;

SELECT * FROM public.aluno;

-- UNION e UNION ALL

SELECT nome FROM funcionario
UNION 
SELECT nome FROM public.aluno;

SELECT nome FROM funcionario
UNION ALL
SELECT nome FROM public.aluno;

SELECT nome, genero, salario FROM funcionario
UNION 
SELECT nome, genero, matricula FROM public.aluno;

SELECT nome, genero, salario FROM funcionario
UNION 
SELECT nome, genero, 0 FROM public.aluno;

SELECT nome, genero, salario, 'Funcionario' AS Tipo FROM funcionario
UNION 
SELECT nome, genero, 0, 'Aluno' FROM public.aluno;

SELECT nome, genero, TO_CHAR(salario, '99999d99') AS salario, 
	'Funcionario' AS Tipo FROM funcionario
UNION 
SELECT nome, genero, '---', 'Aluno' FROM public.aluno;

-- Restrição de CHECK
ALTER TABLE funcionario ADD CONSTRAINT CHK_salario CHECK(salario >= 1000 AND salario <= 20000);

-- TRIGGER (Gatilho) - Bloco de programação executado a partir de uma transação.

-- 1- Criar a função que será executada.
CREATE FUNCTION verifReducSal()
	RETURNS TRIGGER AS $$
	BEGIN
	
		IF NEW.salario < OLD.salario THEN
			RAISE NOTICE 'Salario atual: %', OLD.salario;
			RAISE EXCEPTION 'Salario nao pode ser reduzido.';
		END IF;
	
		RETURN NEW;
	
	END;
$$
LANGUAGE PLPGSQL;	

	
-- 2- Criar a trigger e definir quando a função será executada.
CREATE TRIGGER tgverifReducSal
	BEFORE UPDATE ON funcionario
	FOR EACH ROW
	EXECUTE PROCEDURE verifReducSal();
	
UPDATE funcionario SET salario = 2000 WHERE codigo = 3;

SELECT * FROM funcionario;

UPDATE funcionario SET salario = 6000 WHERE codigo = 3;

SELECT * FROM funcionario;


