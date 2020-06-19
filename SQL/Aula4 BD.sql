-- Aula4 BD - 01/02/2020

/*
	Segunda Forma Normal (FN2).
	
	Todos os campos de uma tabela, que n�o fazem parte da chave prim�ria, devem ter
	a sua exist�ncia diretamente vinculada � Chave Prim�ria(PK) da tabela ao qual est�o contidos. 

	Em tabelas com Chave Prim�ria Composta n�o deve haver Depend�ncia Parcial, quando um campo 
	que n�o participa da PK depende apenas de parte dos campos que comp�e a PK.
	
	-------------------------------------------------------------------------------------------------
	
	Terceira Forma Normal (FN3).
	
	N�o deve haver Depend�ncia Transitiva, quando um campo que n�o participa da PK 
	depende de outro campo que tamb�m n�o participa da PK.
	
**/

/*
	Estudo de Caso.
	
	Uma empresa requer armazenar os dados de seus funcion�rios: nome, cpf, g�nero, 
	estado civil, cargo e sal�rio. Funcion�rios que exercem o mesmo cargo recebem o mesmo sal�rio.
	
	Os funcionarios podem informar o nome e telefone do c�njuge.
	
	H� ainda a necessidade de armazenar os dados dos projetos em que os funcion�rios podem
	atuar. Destes projetos os dados s�o nome, valor, data de in�cio, tempo previsto para o 
	t�rmino e porcentagem por participa��o.

	A porcentagem � aplicada ao valor do projeto, gerando um b�nus para os funcion�rios que atuam nele.

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




