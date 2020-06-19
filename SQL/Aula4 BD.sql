-- Aula4 BD - 01/02/2020

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

DROP DATABASE aula4;
		CREATE DATABASE aula4;
USE aula4;

CREATE TABLE funcionario (
	codFuncionario 	INTEGER 		PRIMARY KEY	AUTO_INCREMENT,
	nome 			VARCHAR(60)		NOT NULL,
	cpf 			CHAR(14)		NOT NULL,
	genero 			ENUM('f', 'm')	NOT NULL,
	estadoCivil 	VARCHAR(10)		NOT NULL);

-- DEC(8, 2) - 999999.99
CREATE TABLE cargo (
	codCargo 	INTEGER 	PRIMARY KEY	AUTO_INCREMENT,
	titulo 		VARCHAR(40)	NOT NULL,
	salario 	DEC(8, 2)	NOT NULL);
	
CREATE TABLE conjuge (
	codConjuge 	INTEGER 	PRIMARY KEY	AUTO_INCREMENT,
	nome 		VARCHAR(60)	NOT NULL,
	telefone 	VARCHAR(10)	NOT NULL,
	cod_func 	INTEGER		NOT NULL,
	FOREIGN KEY(cod_func) REFERENCES funcionario (codFuncionario));

CREATE TABLE projeto (
	codProjeto 	INTEGER 		AUTO_INCREMENT,
	nome 		VARCHAR(80)		NOT NULL,
	valor 		DECIMAL(10, 2)	NOT NULL,
	dataInicio 	DATE			NOT NULL,
	tempoPrev 	INTEGER			NOT NULL,
	porcentPart FLOAT			NOT NULL,
	PRIMARY KEY(codProjeto));

CREATE TABLE alocado (
	cod_func 	INTEGER	NOT NULL,
	cod_proj 	INTEGER	NOT NULL,
	PRIMARY KEY(cod_func, cod_proj),
	FOREIGN KEY(cod_func) REFERENCES funcionario (codFuncionario),
	FOREIGN KEY(cod_proj) REFERENCES projeto (codProjeto));

-- Exibir tabelas.
SHOW TABLES;




