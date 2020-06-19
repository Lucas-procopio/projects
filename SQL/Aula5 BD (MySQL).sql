-- Aula5 BD (continuação aula4) - 04/02/2020

/*
	Segunda Forma Normal (FN2).
	
	Todos os campos de uma tabela, que não fazem parte da chave primária, devem ter
	a sua existência diretamente vinculada à Chave Primária(PK) da tabela ao qual estão contidos. 

	Em tabelas com Chave Primária Composta não deve haver Dependência Parcial, quando um campo 
	que não participa da PK depende apenas de parte dos campos que compõe a PK.
	
	-------------------------------------------------------------------------------------------------
	
	Terceira Forma Normal (FN3).
	
	Não deve haver Dependência Transitiva, quando um campo que não participa da PK 
	depende de outro campo que também não participa da PK.
	
**/

/*
	Estudo de Caso.
	
	Uma empresa requer armazenar os dados de seus funcionários: nome, cpf, gênero, 
	estado civil, cargo e salário. Funcionários que exercem o mesmo cargo recebem o mesmo salário.
	
	Os funcionarios podem informar o nome e telefone do cônjuge.
	
	Há ainda a necessidade de armazenar os dados dos projetos em que os funcionários podem
	atuar. Destes projetos os dados são nome, valor, data de início, tempo previsto para o 
	término e porcentagem por participação.

	A porcentagem é aplicada ao valor do projeto, gerando um bônus para os funcionários que atuam nele.

**/

DROP DATABASE aula5;
CREATE DATABASE aula5;
USE aula5;

CREATE TABLE funcionario (
	codFuncionario 	INTEGER 		PRIMARY KEY	AUTO_INCREMENT,
	nome 			VARCHAR(60)		NOT NULL,
	cpf 			CHAR(14)		NOT NULL,
	genero 			ENUM('f', 'm')	NOT NULL,
	estadoCivil 	VARCHAR(10)		NOT NULL);
	
CREATE TABLE conjuge (
	codConjuge 	INTEGER 	PRIMARY KEY	AUTO_INCREMENT,
	nome 		VARCHAR(60)	NOT NULL,
	telefone 	VARCHAR(10)	NOT NULL,
	codFunc 	INTEGER		NOT NULL,
	FOREIGN KEY(codFunc) REFERENCES funcionario (codFuncionario));
	
CREATE TABLE cargo (
	codCargo 	INTEGER 	PRIMARY KEY	AUTO_INCREMENT,
	titulo 		VARCHAR(40)	NOT NULL,
	salario 	DEC(8, 2)	NOT NULL);
	
CREATE TABLE projeto (
	codProjeto 	INTEGER 		AUTO_INCREMENT,
	nome 		VARCHAR(60)		NOT NULL,
	valor 		DECIMAL(10, 2)	NOT NULL,
	dataInicio 	DATE			NOT NULL,
	tempPrev 	INTEGER			NOT NULL,
	porcentPart FLOAT			NOT NULL,
	PRIMARY KEY(codProjeto));
	
CREATE TABLE alocado (
	cod_proj 	INTEGER		NOT NULL,
	cod_func 	INTEGER		NOT NULL,
	PRIMARY KEY(cod_proj, cod_func),
	FOREIGN KEY(cod_proj) REFERENCES projeto (codProjeto),
	FOREIGN KEY(cod_func) REFERENCES funcionario (codFuncionario));

-- Exibir as tabelas.
SHOW TABLES;

-- Exibir estrutura das tabelas.
DESC funcionario;
DESC conjuge;
DESC cargo;
DESC projeto;
DESC alocado;

-- Alterações na estrutura das tabelas.

-- Adicionar uma caluna.
ALTER TABLE funcionario ADD COLUMN cod_cargo INT NOT NULL;

-- Adicionar uma restrição(CONSTRAINT) de Chave Estrangeira.
ALTER TABLE funcionario ADD CONSTRAINT FK_cargo 
	FOREIGN KEY(cod_cargo) REFERENCES cargo(codCargo);

-- Adicionar uma restrição(CONSTRAINT) de campo único.
ALTER TABLE funcionario ADD CONSTRAINT UNQ_cpf UNIQUE(cpf);

ALTER TABLE conjuge ADD CONSTRAINT UNQ_codFunc UNIQUE(codFunc);

DESC funcionario;
DESC conjuge;

-- Inserir dados nas tabelas.

INSERT INTO cargo(titulo, salario) VALUES('Estagio', 1400),
										 ('Junior', 3350),
										 ('Pleno', 6100),
										 ('Senior', 9800),
										 ('Gerente', 13000);
										 
SELECT * FROM cargo;

INSERT INTO funcionario VALUES(NULL, 'Bia', '123.312.312-21', 'f', 'Solteiro', 4),
							  (NULL, 'Leo', '132.312.312-17', 'm', 'Casado', 3),
							  (NULL, 'Ana', '045.312.312-05', 'f', 'Casado', 1),
							  (NULL, 'Mel', '221.312.312-15', 'f', 'Solteiro', 1),
							  (NULL, 'Edu', '034.312.312-38', 'm', 'Solteiro', 2),
							  (NULL, 'Rui', '441.312.312-06', 'm', 'Solteiro', 1),
							  (NULL, 'Nat', '934.312.312-17', 'f', 'Solteiro', 2);

SELECT * FROM funcionario;
							  
INSERT INTO conjuge VALUES(NULL, 'Beto', '2333-4222', 3),
						  (NULL, 'Duda', '5333-4221', 2);
						  
SELECT * FROM conjuge;

INSERT INTO projeto
	VALUES(NULL, 'E-Commerce', 230000, '2019-08-14', 170, 1),
		  (NULL, 'Gestão Hospitalar', 420000, '2019-10-10', 225, 0.5);

SELECT * FROM projeto;

INSERT INTO alocado(cod_proj, cod_func) VALUES(2, 5), (1, 3), (1, 2), (2, 6), (2, 7), (1, 1), (2, 4);

SELECT * FROM alocado;

-- Pesquisas.

SELECT nome, titulo, salario
	FROM cargo INNER JOIN funcionario
	ON codCargo = cod_cargo;

SELECT nome, titulo, salario
	FROM cargo LEFT JOIN funcionario
	ON codCargo = cod_cargo;

SELECT f.nome AS NomeFunc, 
	c.nome AS NomeConjuge, telefone
	FROM funcionario f LEFT JOIN conjuge c
	ON codFuncionario = codFunc;
	
SELECT f.nome AS NomeFunc, 
	c.nome AS NomeConjuge, telefone
	FROM funcionario f LEFT JOIN conjuge c
	ON codFuncionario = codFunc
	WHERE codFunc IS NULL;

-- Funções de Agregação.

SELECT COUNT(nome) FROM funcionario;

SELECT COUNT(nome) AS QTD FROM projeto;
SELECT SUM(valor) AS Soma FROM projeto;
SELECT AVG(valor) AS Media FROM projeto;

SELECT MIN(salario) AS Menor FROM cargo;
SELECT MAX(salario) AS Maior FROM cargo;

SELECT COUNT(nome) AS QTD, 
	SUM(valor) AS Soma,
	AVG(valor) AS Media FROM projeto;

SELECT COUNT(nome) AS QTD, 
	SUM(salario) AS Soma,
	ROUND(AVG(salario), 2) AS Media
	FROM cargo INNER JOIN funcionario
	ON codCargo = cod_cargo;

-- GROUP BY - Cálculo da agregação agrupado pelos grupos de indivíduos dos campos.

SELECT DISTINCT genero FROM funcionario;
SELECT DISTINCT estadoCivil FROM funcionario;

SELECT genero, COUNT(nome) AS QTD 
	FROM funcionario
	GROUP BY genero;

SELECT estadoCivil, COUNT(nome) AS QTD 
	FROM funcionario
	GROUP BY estadoCivil;

SELECT titulo, COUNT(nome) AS QTD
	FROM cargo INNER JOIN funcionario
	ON codCargo = cod_cargo
	GROUP BY titulo;

SELECT genero, COUNT(nome) AS QTD, 
	SUM(salario) AS Soma,
	ROUND(AVG(salario), 2) AS Media
	FROM cargo INNER JOIN funcionario
	ON codCargo = cod_cargo
	GROUP BY genero;

-- Agrupamento por mais de 1 campo.
SELECT genero, estadoCivil, COUNT(nome) AS QTD 
	FROM funcionario
	GROUP BY genero, estadoCivil;

SELECT genero, estadoCivil, COUNT(nome) AS QTD 
	FROM funcionario
	GROUP BY genero, estadoCivil WITH ROLLUP;

-- WHERE e HAVING

SELECT titulo, COUNT(nome) AS QTD
	FROM cargo INNER JOIN funcionario
	ON codCargo = cod_cargo
	WHERE titulo IN('Junior', 'Pleno')
	GROUP BY titulo;

SELECT titulo, COUNT(nome) AS QTD
	FROM cargo INNER JOIN funcionario
	ON codCargo = cod_cargo
	GROUP BY titulo HAVING COUNT(nome) >= 2;

SELECT titulo, COUNT(nome) AS QTD
	FROM cargo INNER JOIN funcionario
	ON codCargo = cod_cargo
	WHERE titulo IN('Junior', 'Pleno', 'Senior')
	GROUP BY titulo HAVING COUNT(nome) = 1
	ORDER BY titulo DESC;

-- SubQuery

SELECT nome, valor FROM projeto 
	WHERE valor > (SELECT AVG(valor) FROM projeto);

SELECT nome, salario
	FROM cargo INNER JOIN funcionario
	ON codCargo = cod_cargo
	WHERE salario > (SELECT AVG(salario) FROM cargo INNER JOIN funcionario
					 ON codCargo = cod_cargo);

-- Cálculos com datas.

SELECT nome, dataInicio, tempPrev,
	DATE_ADD(dataInicio, INTERVAL tempPrev DAY) AS FimPrev
	FROM projeto;

SELECT nome, 
	DATE_FORMAT(dataInicio, '%d/%m/%y') AS Inicio, tempPrev,
	DATE_FORMAT(DATE_ADD(dataInicio, INTERVAL tempPrev DAY), '%d/%m/%y') AS FimPrev
	FROM projeto;

-- VIEW

CREATE VIEW relAlocados AS
SELECT f.nome AS "Nome Func", titulo AS Cargo,
	salario, p.nome AS "Nome Projeto", valor,
	DATE_FORMAT(dataInicio, '%d/%m/%y') AS Inicio, tempPrev,
	DATE_FORMAT(DATE_ADD(dataInicio, INTERVAL tempPrev DAY), '%d/%m/%y') AS FimPrev
	FROM cargo 
	INNER JOIN funcionario f ON codCargo = cod_cargo
	INNER JOIN alocado ON codFuncionario = cod_func
	INNER JOIN projeto p ON codProjeto = cod_proj;

SELECT * FROM relAlocados;

SELECT `Nome Func`, Cargo, salario, `Nome Projeto` FROM relAlocados;

-- Exportar dados para arquivos.

SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.6/Uploads/funcionarios.txt' FROM funcionario;

SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.6/Uploads/funcionarios.csv' 
	FIELDS TERMINATED BY ';'
	LINES TERMINATED BY '\n'
FROM funcionario;

SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.6/Uploads/Alocados.csv' 
	FIELDS TERMINATED BY ';'
	LINES TERMINATED BY '\n'
FROM relAlocados;

-- Criar uma cópia da tabela sem os dados.
CREATE TABLE copiaFunc(LIKE funcionario);

DESC copiaFunc;
SELECT * FROM copiaFunc;

-- Importar os dados de arquivos.

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.6/Uploads/funcionarios.txt' INTO TABLE copiaFunc;

SELECT * FROM copiaFunc;








