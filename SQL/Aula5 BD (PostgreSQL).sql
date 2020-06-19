-- Aula5 BD - 04/02/2020

/*

	Estudo de Caso
	
	Uma empresa requer controlar os dados de seus clientes.	Existem dois tipos de 
	clientes, pessoa física e pessoa jurídica.
	
	Os dados dos clientes pessoa física são: nome, email, renda, endereço, cpf e gênero.
	
	Os dados dos clientes pessoa jurídica são: nome, email, renda, endereço, cnpj e ramo. 

**/

DROP DATABASE aula5;
CREATE DATABASE aula5;
\c aula5

CREATE TABLE cliente (
	codCliente 	INTEGER 	PRIMARY KEY,
	nome 		VARCHAR(50)	NOT NULL,
	email 		VARCHAR(50)	NOT NULL,
	renda 		FLOAT		NOT NULL);

CREATE TABLE pessoaFisica (
	codCliente 	INTEGER 	PRIMARY KEY,
	cpf 		CHAR(14)	NOT NULL,
	genero 		CHAR		NOT NULL,
	FOREIGN KEY(codCliente) REFERENCES cliente (codCliente));

CREATE TABLE pessoaJuridica (
	codCliente 	INTEGER 	PRIMARY KEY,
	cnpj 		CHAR(18)	NOT NULL,
	ramo 		VARCHAR(20)	NOT NULL,
	FOREIGN KEY(codCliente) REFERENCES cliente (codCliente));

CREATE TABLE endereco (
	codEndereco INTEGER 	PRIMARY KEY,
	rua 		VARCHAR(60)	NOT NULL,
	numero 		VARCHAR(10)	NOT NULL,
	cidade 		VARCHAR(60)	NOT NULL,
	cod_cliente INTEGER		NOT NULL,
	FOREIGN KEY(cod_cliente) REFERENCES cliente (codCliente));

