-- Aula3 BD - 25/01/2020

/*
	Estudo de Caso
	
	Um hospital requer armazenar os dados de suas consultas. Cada consulta realizada deve 
	armazenar o nome do médico e sua especialidade; o nome, gênero e data de nascimento 
	do paciente; o diagnóstico e a data e hora do atendimento.

	Os médicos podem atender qualquer paciente várias vezes, assim como os pacientes podem 
	ser atendidos por qualquer médico várias vezes.
	
	Os pacientes podem informar o nome e o telefone de uma pessoa para contato, 
	mas isso não é obrigatório.
	
**/

DROP DATABASE aula3;
CREATE DATABASE aula3;
USE aula3;

CREATE TABLE medico (
	codMedico 	INTEGER 	PRIMARY KEY	AUTO_INCREMENT,
	nome 		VARCHAR(60)	NOT NULL,
	espec 		VARCHAR(40)	NOT NULL);

-- DATE - Armazenamento de data no formato yyyy-mm-dd.
CREATE TABLE paciente (
	codPaciente INTEGER 		PRIMARY KEY	AUTO_INCREMENT,
	nome 		VARCHAR(60)		NOT NULL,
	genero 		ENUM('f', 'm')	NOT NULL,
	dataNasc 	DATE			NOT NULL);

CREATE TABLE pessoaContato (
	codContato 	INTEGER 	PRIMARY KEY	AUTO_INCREMENT,
	nome 		VARCHAR(60)	NOT NULL,
	telefone 	VARCHAR(10)	NOT NULL,
	codPac 		INTEGER		NOT NULL	UNIQUE,
	FOREIGN KEY(codPac) REFERENCES paciente (codPaciente));

-- TIMESTAMP - Armazenamento de data e hora no formato yyyy-mm-dd hh:mm:ss.
CREATE TABLE consulta (
	codConsulta INTEGER 		PRIMARY KEY	AUTO_INCREMENT,
	cod_med 	INTEGER			NOT NULL,
	cod_pac 	INTEGER			NOT NULL,
	diagnostico VARCHAR(200)	NOT NULL,
	dataHora 	TIMESTAMP,
	FOREIGN KEY(cod_med) REFERENCES medico (codMedico),
	FOREIGN KEY(cod_pac) REFERENCES paciente (codPaciente));
	
-- Metadados (METADATA)

SHOW TABLES;

DESC medico;
DESC paciente;
DESC pessoaContato;
DESC consulta;


-- Inserir dados nas tabelas.

INSERT INTO medico VALUES(NULL, 'Bia', 'Ortopedia');
INSERT INTO medico VALUES(NULL, 'Leo', 'Cardiologia');
INSERT INTO medico VALUES(NULL, 'Nat', 'Pediatria');
INSERT INTO medico VALUES(NULL, 'Ana', 'Clinica Médica');

SELECT * FROM medico;

INSERT INTO paciente(nome, dataNasc, genero) VALUES('Beto', '1965-06-28', 'm'),
												   ('Rafa', '1978-03-05', 'f'),
												   ('Hugo', '1949-08-17', 'm'),
												   ('Duda', '1987-10-02', 'f'),
												   ('Rita', '2012-03-12', 'f'),
												   ('Mila', '1990-04-24', 'f'),
												   ('José', '1982-11-30', 'm');
		  
SELECT * FROM paciente;
									
INSERT INTO pessoaContato VALUES(NULL, 'Maria', '4444-3333', 4);
INSERT INTO pessoaContato VALUES(NULL, 'Pedro', '9999-3333', 3);
INSERT INTO pessoaContato VALUES(NULL, 'Paulo', '8888-3333', 6);

SELECT * FROM pessoaContato;

INSERT INTO consulta (codConsulta, cod_med, cod_pac, diagnostico, dataHora)
					 VALUES(NULL, 4, 7, 'Dengue', '2018-12-22 10:00'),
						   (NULL, 1, 2, 'Fratura', '2018-12-26 08:30'),
						   (NULL, 3, 5, 'Catapora', '2018-12-29 17:00'),
						   (NULL, 4, 6, 'Virose', '2019-01-03 14:00'),
						   (NULL, 4, 4, 'Infeccao', '2019-01-11 16:00'),
						   (NULL, 1, 3, 'Entorse', '2019-01-24 13:00'),
						   (NULL, 2, 1, 'Hipertensao', '2019-01-30 11:20'),
						   (NULL, 4, 2, 'Zika', '2019-02-04 17:20'),
						   (NULL, 1, 1, 'Fratura', '2019-02-09 09:00'),
						   (NULL, 4, 3, 'Gripe', '2019-02-15 15:30'),
						   (NULL, 2, 7, 'Arritmia', '2019-03-01 16:30'),
						   (NULL, 1, 2, 'Luxacao', '2019-03-08 13:00'),
						   (NULL, 4, 1, 'Pneumonia', '2019-03-14 12:00'),
						   (NULL, 3, 5, 'Gripe', '2019-03-22 16:00'),
						   (NULL, 2, 6, 'Arritmia', '2019-03-29 13:00');
						   
SELECT * FROM consulta;

-- Manipular Datas no MySQL.

-- Data atual.
SELECT CURRENT_DATE;

-- Hora atual.
SELECT CURRENT_TIME;

-- Data Hora atual.
SELECT SYSDATE();
SELECT NOW();

-- Manipular partes da data.

SELECT DAY('2018-06-24');
SELECT MONTH('2018-06-24');
SELECT YEAR('2018-06-24');

SELECT DAY(NOW()) AS Dia, 
	   MONTH(NOW()) AS Mes,
	   YEAR(NOW()) AS Ano;

-- Formatar datas.

SELECT DATE_FORMAT('2018-06-24', '%d/%m/%y') AS DataFormatada;
SELECT DATE_FORMAT('2018-06-24', '%d/%m/%Y') AS DataFormatada;

SELECT DATE_FORMAT(NOW(), '%W, %D %M %Y - %H:%i') AS DataFormatada;

SELECT nome, 
	DATE_FORMAT(dataNasc, '%d/%m/%Y') AS Nascimento
	FROM paciente;

SELECT nome, YEAR(dataNasc) AS AnoNascimento
	FROM paciente;


-- Exercícios.

-- Exibir o nome e a data de nascimento dos pacientes nascidos antes de 1980. Ordenar do mais 
-- novo pro mais velho.


-- Exibir o nome e a data de nascimento dos pacientes que fazem aniversário no mês atual.


-- Exibir o nome dos pacientes, gênero, nome e telefone do contato informado.

	
-- Exibir o nome dos médicos, suas especialidades e as datas e horários 
-- de seus atendimentos.

	
-- Exibir o nome dos médicos, suas especialidades e as datas e horários 
-- de seus atendimentos. Somente Ortopedia e Clinica Médica.


-- Exibir nome, gênero e diagnóstico dos pacientes.

	
	
-- Exibir o nome dos médicos, suas especialidades e as datas e horários 
-- de seus atendimentos. Consultas realizadas em janeiro e fevereiro de 2019.

	
-- Exibir o nome dos pacientes, genero, data de nascimento e diagnostico.
-- Somente pacientes nascidos após 1980.


-- Exibir o nome, o gênero, nascimento e idade de todos os pacientes. Caso tenha 
-- informado contato, exibir o nome e telefone do contato informado.





	

	



