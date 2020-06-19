-- Aula1 BD - 25/01/2020

-- Selecionar a base de dados criada na aula anterior.
USE aula2;

-- Exibir tabelas existentes.
SHOW TABLES;

-- Exibir estrutura das tabelas.
DESC funcionario;
DESC dependente;
DESC endereco;


-- Inserir dados nas tabelas.

INSERT INTO funcionario VALUES(NULL, 'Bia', '123.321.312-43', 'f', 'Solteiro', 6000);
INSERT INTO funcionario VALUES(NULL, 'Edu', '223.321.312-48', 'm', 'Solteiro', 4500);
INSERT INTO funcionario VALUES(NULL, 'Leo', '333.321.312-42', 'm', 'Casado', 6700);
INSERT INTO funcionario VALUES(NULL, 'Nat', '443.321.312-49', 'f', 'Casado', 7200);
INSERT INTO funcionario VALUES(NULL, 'Ana', '553.321.312-45', 'f', 'Solteiro', 5100);

SELECT * FROM funcionario;

INSERT INTO endereco VALUES(NULL, 'Rua a', '126', 'Bairro q', 'Cidade z', 'RJ', 5);
INSERT INTO endereco VALUES(NULL, 'Rua s', '261', 'Bairro w', 'Cidade x', 'RJ', 2);
INSERT INTO endereco VALUES(NULL, 'Rua d', '231', 'Bairro e', 'Cidade c', 'SP', 4);
INSERT INTO endereco VALUES(NULL, 'Rua f', '842', 'Bairro r', 'Cidade v', 'RJ', 1);
INSERT INTO endereco VALUES(NULL, 'Rua g', '632', 'Bairro t', 'Cidade b', 'MG', 3);

SELECT * FROM endereco;


INSERT INTO dependente VALUES(NULL, 'Beto', 'Filho', '3333-7779', 2),
							 (NULL, 'Rafa', 'Filha', '2222-7778', 2),
							 (NULL, 'Duda', 'Filha', '5555-7776', 3),
							 (NULL, 'Cadu', 'Filho', '8888-7771', 3),
							 (NULL, 'Mila', 'Filha', '6666-7772', 1),
							 (NULL, 'Hugo', 'Filho', '4444-7774', 5),
							 (NULL, 'Cadu', 'Conjuge', '7777-4343', 5),
							 (NULL, 'Rita', 'Conjuge', '2222-1212', 3);

SELECT * FROM dependente;

-- Exerc�cios

-- Exibir nome, g�nero e sal�rio dos funcion�rios do sexo feminino com sal�rio 
-- igual ou superior a 6000.
SELECT nome, genero, salario
	FROM funcionario 
	WHERE genero = 'f' AND salario >= 6000;

-- Exibir nome, g�nero e sal�rio dos funcion�rios com sal�rio entre 6000 e 7000.
-- Ordenar pelo maior sal�rio
SELECT nome, genero, salario
	FROM funcionario 
	WHERE salario >= 6000 AND salario <= 7000
	ORDER BY salario DESC;

SELECT nome, genero, salario
	FROM funcionario 
	WHERE salario BETWEEN 6000 AND 7000
	ORDER BY salario DESC;
	
-- Exibir nome e grau de parentesco dos dependentes. Somente filhos e filhas.
SELECT nome, grauParent
	FROM dependente
	WHERE grauParent = 'Filho' OR grauParent = 'Filha';
	
SELECT nome, grauParent
	FROM dependente
	WHERE grauParent IN('Filho', 'Filha');
	
-- Exibir os endere�os de funcion�rios do Rio e de S�o Paulo.
SELECT * FROM endereco
	WHERE uf = 'RJ' OR uf = 'SP';
	
SELECT * FROM endereco
	WHERE uf IN('RJ', 'SP');

-- Exibir os endere�os de funcion�rios que n�o s�o do Rio e de S�o Paulo.
SELECT * FROM endereco
	WHERE uf <> 'RJ' AND uf <> 'SP';

SELECT * FROM endereco
	WHERE uf NOT IN('RJ', 'SP');
	
-- Exibir os endere�os de funcion�rios do Rio e da cidade "Cidade z".
SELECT * FROM endereco
	WHERE uf = 'RJ' AND cidade = 'Cidade z';

-- Pesquisas em 2 tabelas (sintax defasada).
	
SELECT nome, rua, numero, bairro
	FROM funcionario, endereco
	WHERE codFuncionario = codFunc;
	
SELECT codFuncionario, nome, 
	codEndereco, rua, numero, bairro, codFunc
	FROM funcionario, endereco
	WHERE codFuncionario = codFunc;	
	
SELECT nome, rua, numero, bairro
	FROM funcionario, endereco
	WHERE codFuncionario = codFunc
	AND uf = 'RJ';	
	
SELECT funcionario.nome, estadoCivil, 
	dependente.nome, grauParent
	FROM funcionario, dependente
	WHERE codFuncionario = cod_func;
	
-- ALIAS - Alterar o r�tulo de colunas e tabelas.

SELECT funcionario.nome AS NomeFunc, estadoCivil, 
	dependente.nome AS NomeDep, grauParent AS Parentesco
	FROM funcionario, dependente
	WHERE codFuncionario = cod_func;
	
SELECT f.nome AS NomeFunc, estadoCivil, 
	d.nome AS NomeDep, grauParent AS Parentesco
	FROM funcionario f, dependente d
	WHERE codFuncionario = cod_func;

-- Pesquisas em 2 tabelas usando JOIN.

SELECT nome, rua, numero, bairro
	FROM funcionario INNER JOIN endereco
	ON codFuncionario = codFunc;

SELECT nome, rua, numero, bairro
	FROM funcionario INNER JOIN endereco
	ON codFuncionario = codFunc
	WHERE uf = 'RJ';	

SELECT nome, rua, numero, bairro
	FROM funcionario INNER JOIN endereco
	ON codFuncionario = codFunc
	WHERE uf = 'RJ'
	ORDER BY nome;

SELECT funcionario.nome AS NomeFunc, estadoCivil, 
	dependente.nome AS NomeDep, grauParent AS Parentesco
	FROM funcionario INNER JOIN dependente
	ON codFuncionario = cod_func;
	
SELECT f.nome AS NomeFunc, estadoCivil, 
	d.nome AS NomeDep, grauParent AS Parentesco
	FROM funcionario f INNER JOIN dependente d
	ON codFuncionario = cod_func;	
	
-- LEFT / RIGHT JOIN

SELECT funcionario.nome, estadoCivil, 
	dependente.nome, grauParent
	FROM funcionario LEFT JOIN dependente
	ON codFuncionario = cod_func;
	
SELECT funcionario.nome, estadoCivil, 
	dependente.nome, grauParent
	FROM dependente RIGHT JOIN funcionario
	ON codFuncionario = cod_func;	
	

	
	
	
	
	
	
	
