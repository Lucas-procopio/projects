-- Aula2 BD - 18/01/2020

/*
	Primeira Forma Normal - FN1
x	
	Todos os campos de uma tabela devem ser atômicos(indivísivel). Os valores 
	armazenados nos campos devem possibilitar uma pesquisa direta.
	
	Campo Composto e Campo Multivalorado devem ser evitados.
	
	Campo Composto -> Endereco (Rio Branco, 185, Centro, Rio de Janeiro, RJ)
	Campo Multivalorado -> Telefone (4444-6666 / 3333-1111)

	--------------------------------------------------------------------------------
	
	Segunda Forma Normal - FN2
	
	Em uma tabela todos os campos devem ter a sua existência dependendo diretamente
	da chave primária desta tabela.
	
**/

/*
	Estudo de Caso

	Uma empresa requer armazenar os dados de seus funcionários. Para cada funcionário
	cadastrado os dados são: nome, cpf, gênero, estado civil, salário e endereço.
	
	Caso o funcionário possua dependetes, armazenar o nome, o grau de parentesco e o telefone
	dos dependentes.

	ENTIDADES
	
	Funcionario				Endereco			Dependente
		nome 					rua					nome
		cpf 					numero              grauParent
		genero 					bairro              telefone
		estadocivil 			cidade
		salario					uf

		
**/

-- Usar a base de dados criada anteriormente.
USE aula2;

-- Excluir a tabela criada anteriormente.
DROP TABLE funcionario;

-- Criar as tabelas.
-- AUTO_INCREMENT - Geração automática de valores sequênciais.
CREATE TABLE funcionario (
	codFuncionario 	INTEGER 	PRIMARY KEY	AUTO_INCREMENT,
	nome 			VARCHAR(40)	NOT NULL,
	cpf 			CHAR(14)	NOT NULL	UNIQUE,
	genero 			CHAR		NOT NULL,
	estadoCivil 	VARCHAR(10)	NOT NULL,
	salario 		FLOAT		NOT NULL);

/*
	Declaração de Chave Estrangeira.

	FOREIGN KEY(cod_func) - Determinar o campo cod_func como chave estrangeira.
	REFERENCES funcionario (codFuncionario) - Definir que a chave estrangeira faz referência
											  ao campo codFuncionairo da tabela funcionario.
	
**/
	
CREATE TABLE dependente (
	codDependente 	INTEGER 	PRIMARY KEY	AUTO_INCREMENT,
	nome 			VARCHAR(40)	NOT NULL,
	grauParent 		VARCHAR(10)	NOT NULL,
	telefone 		VARCHAR(10)	NOT NULL,
	cod_func 		INTEGER		NOT NULL,
	FOREIGN KEY(cod_func) REFERENCES funcionario (codFuncionario));

CREATE TABLE endereco (
	codEndereco INTEGER 	PRIMARY KEY	AUTO_INCREMENT,
	rua 		VARCHAR(60)	NOT NULL,
	numero 		VARCHAR(10)	NOT NULL,
	bairro 		VARCHAR(60)	NOT NULL,
	cidade 		VARCHAR(60)	NOT NULL,
	uf 			CHAR(2)		NOT NULL,
	codFunc 	INTEGER		NOT NULL	UNIQUE,
	FOREIGN KEY(codFunc) REFERENCES funcionario (codFuncionario));

-- Exibir tabelas existentes.
SHOW TABLES;

-- Exibir estrutura das tabelas.
DESC funcionario;
DESC dependente;
DESC endereco;



