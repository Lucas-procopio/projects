-- Aula1 BD - 11/01/2020

/*
	Estruturas básicas do banco de dados.
	
	Bases de Dados (DATABASE) - Estrutura utilizada para organização dos 
								objetos do servidor de banco de dados.
								
	Tabelas (TABLE) - Estrutura composta por campos e chaves onde os dados
					  são efetivamente armazenados.

**/

-- Exibir bases de dados.
SHOW DATABASES;

-- Excluir base de dados (CUIDADO).
DROP DATABASE aula1;

-- Criar base de dados.
CREATE DATABASE aula1;

-- Selecionar a base de dados.
USE aula1;

-- Criar tabela.
CREATE TABLE produto(
	nome 	VARCHAR(40), 
	fabric 	VARCHAR(30), 
	qtd 	INT, 
	preco 	FLOAT);
	
-- Exibir tabelas existentes.
SHOW TABLES;

-- Exibir a estrutura da tabela.
DESC produto;
DESCRIBE produto;

-- Inserir dados na tabela.

INSERT INTO produto VALUES('Notebook', 'Dell', 2, 2400);

INSERT INTO produto VALUES('Monitor', 'LG', 4, 510.5);
INSERT INTO produto VALUES('Impressora', 'HP', 3, 490.9);
INSERT INTO produto VALUES('Smartphone', 'Sony', 2, 2100);
INSERT INTO produto VALUES('Computador', 'Dell', 1, 1800);
INSERT INTO produto VALUES('Projetor', 'Epson', 1, 2370);
INSERT INTO produto VALUES('Camera', 'Sony', 2, 970);

-- Pesquisar dados armazenados na tabela.

SELECT nome, qtd, preco FROM produto;

SELECT fabric, nome, preco FROM produto;

SELECT nome, fabric, qtd, preco FROM produto;
-- mesmo que
SELECT * FROM produto;

-- ORDER BY - Alterar a ordem de exibição das linhas de resultado.

SELECT nome, preco 
	FROM produto ORDER BY nome;
	
SELECT nome, qtd 
	FROM produto ORDER BY qtd;

SELECT nome, qtd, preco 
	FROM produto ORDER BY preco ASC;

SELECT nome, qtd, preco 
	FROM produto ORDER BY preco DESC;

SELECT fabric, nome, preco 
	FROM produto ORDER BY fabric, nome;

SELECT fabric, nome, preco 
	FROM produto ORDER BY fabric, preco;

-- LIMIT - Limitar a quantidade de linhas exeibidas.

SELECT * FROM produto LIMIT 5;

SELECT * FROM produto
	ORDER BY preco LIMIT 3;	
	
SELECT * FROM produto
	ORDER BY preco DESC LIMIT 3;

-- WHERE (Filtros) - Condicionar a exibição de um registro no resultado da pesquisa.

SELECT nome, qtd, preco 
	FROM produto WHERE nome = 'Monitor';

SELECT nome, qtd, preco 
	FROM produto WHERE qtd > 2;

SELECT nome, qtd, preco 
	FROM produto WHERE qtd >= 2;
	
SELECT nome, qtd, preco 
	FROM produto WHERE preco < 1000;
	
SELECT * FROM produto
	WHERE fabric <> 'Dell'
	ORDER BY nome;
	
-- Operadores Lógicos (AND e OR)

SELECT * FROM produto
	WHERE fabric = 'Dell' AND preco < 2000;
	
SELECT * FROM produto
	WHERE fabric = 'Dell' OR preco < 2000;

SELECT * FROM produto
	WHERE fabric = 'Dell' OR fabric = 'Sony';
	
SELECT * FROM produto
	WHERE (fabric = 'Dell' OR fabric = 'Sony') AND preco < 2000;	

-- Falhas de integridade da tabela criada.

INSERT INTO produto VALUES('Projetor', 'Epson', 1, 2370);
INSERT INTO produto VALUES(NULL, 'LG', 1, NULL);

SELECT * FROM produto;

-- Alterar dados dos registros da tabela.

UPDATE produto SET nome = 'TV' WHERE fabric = 'LG' AND qtd = 1;

UPDATE produto SET preco = 1900 WHERE nome = 'TV';

SELECT * FROM produto;

-- Excluir registros da tabela.

DELETE FROM produto WHERE nome = 'Projetor';

SELECT * FROM produto;


