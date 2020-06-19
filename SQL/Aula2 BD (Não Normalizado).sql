-- Aula2 BD - 18/01/2020

/*
	Estudo de Caso

	Uma empresa requer armazenar os dados de seus funcionários. Para cada funcionário
	cadastrado os dados são: nome, cpf, gênero, estado civil, salário e endereço.
	
	Caso o funcionário possua dependetes, armazenar o nome, o grau de parentesco e o telefone
	dos dependentes.

	ENTIDADES
	
	Funcionario
		nome 
		cpf 
		gênero 
		estadocivil 
		salario
		endereço
		nomeDep 
		grauParent
		telefone
		
**/

-- Excluir base de dados (CUIDADO).
DROP DATABASE aula2;

-- Criar base de dados.
CREATE DATABASE aula2;

-- Selecionar base de dados.
USE aula2;

-- Criar tabela.

-- Excluir uma tabela.
DROP TABLE funcionario;

-- PRIMARY KEY (PK) - Chave Primária. Campo de identificação de registro, não nulo e único.
-- NOT NULL - Campo obrigatório.
-- UNIQUE - Campo único, não permite valores duplicados.
CREATE TABLE funcionario(
	codFuncionario	INT			PRIMARY KEY,
	nome 			VARCHAR(40) NOT NULL,
    cpf 			CHAR(14) 	NOT NULL	UNIQUE,
    genero 			CHAR		NOT NULL,
    estadocivil		VARCHAR(20) NOT NULL,
    salario			FLOAT 		NOT NULL,
    endereco		VARCHAR(90) NOT NULL,
    nomeDep			VARCHAR(40), 
    grauParent		VARCHAR(10),
    telefone		VARCHAR(80));
	
-- Exibir tabelas existentes.
SHOW TABLES;

-- Exibir estrutura da tabela.
DESC funcionario;

-- Inserir dados na tabela.

INSERT INTO funcionario VALUES
(101, 'Bia', '123.321.321-41', 'f', 'Solteiro', 5300, 'Rua a, Bairro q, RJ', 'Beto', 'Filho', '9999-8888 / 2222-3333');

INSERT INTO funcionario VALUES
(102, 'Leo', '223.321.321-41', 'm', 'Solteiro', 4700, 'Rua s, Bairro w, SP', 'Rafa', 'Filha', '9922-8888 / 3333-5555');

INSERT INTO funcionario VALUES
(103, 'Edu', '773.321.321-41', 'm', 'Solteiro', 4700, 'Rua j, Bairro 6, RJ', 'Mila', 'Filha', '9922-8888 / 2222-5555');

INSERT INTO funcionario VALUES
(104, 'Nat', '333.321.321-41', 'f', 'Casado', 6800,   'Rua d, Bairro e, RJ', 'Beto', 'Conjuge', '9911-0022 / 3333-5555');

INSERT INTO funcionario VALUES
(105, 'Ana', '443.321.321-41', 'f', 'Casado', 7100,   'Rua f, Bairro t, MG', 'Dudu', 'Conjuge', '2200-6622 / 7777-8888');
	
SELECT * FROM funcionario;

-- Exercícios.

-- Exibir o nome, o gênero, o estado civil e a salario dos clientes ordenados pela maior salario.
SELECT nome, genero, estadoCivil, salario
	FROM funcionario 
	ORDER BY salario DESC;

-- Exibir o nome, o gênero, o estado civil e a salario dos clientes do sexo feminino em ordem alfabética.
SELECT nome, genero, estadoCivil, salario
	FROM funcionario 
	WHERE genero = 'f' ORDER BY nome;

-- Exibir o nome, o gênero, o estado civil e a salario dos clientes do sexo masculino
-- com salario superior a 5000.

UPDATE funcionario SET salario = 5100 
	WHERE codFuncionario = 102;

SELECT nome, genero, estadoCivil, salario
	FROM funcionario 
	WHERE genero = 'm' AND salario > 5000;

-- Exibir o nome, o gênero, o estado civil e a salario dos clientes com salario entre 4000 e 7000.
SELECT nome, genero, estadoCivil, salario
	FROM funcionario 
	WHERE salario >= 4000 AND salario <= 7000;
	
-- Exibir o nome, o gênero, o estado civil e a salario dos clientes solteiros
-- ou com salario inferior a 5000.
SELECT nome, genero, estadoCivil, salario
	FROM funcionario 
	WHERE estadoCivil = 'solteiro' OR salario < 5000;

-- Exibir o nome e o endereço dos clientes que residem no Rio.

-- Resultado Vazio.
SELECT nome, endereco
	FROM funcionario WHERE endereco = 'RJ';

-- Erro
SELECT nome, endereco
	FROM funcionario WHERE uf = 'RJ';
	
-- LIKE - Pesquisa em trecho textual.

SELECT nome, endereco FROM funcionario WHERE nome LIKE 'n%';
SELECT nome, endereco FROM funcionario WHERE nome LIKE '%na';
SELECT nome, endereco FROM funcionario WHERE nome LIKE '%a%';

SELECT nome, endereco 
	FROM funcionario WHERE endereco LIKE '%RJ%';

INSERT INTO funcionario VALUES
(106, 'Mel', '852.321.300-41', 'f', 'Solteiro', 3100,   'Rua l, Bairro u, ES', NULL, NULL, NULL);

INSERT INTO funcionario VALUES
(107, 'Rui', '042.321.300-41', 'm', 'Casado', 3400,   'Rua S, Bairro I, SP', NULL, 'Filho', NULL);







