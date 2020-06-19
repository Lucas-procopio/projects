-- Aula4 BD - 01/02/2020

-- Selecionar a base de dados criada na aula anterior.
USE aula3;

-- Exibir tabelas
SHOW TABLES;

-- Pesquisas
SELECT * FROM medico;
SELECT * FROM paciente;
SELECT * FROM pessoaContato;
SELECT * FROM consulta;

-- Exercícios (JOINs e Datas Formatadas).

-- Exibir o nome e a data de nascimento dos pacientes nascidos antes de 1980. Ordenar do mais 
-- novo pro mais velho.
SELECT nome, dataNasc
	FROM paciente WHERE dataNasc < '1980-01-01'
	ORDER BY dataNasc DESC;

SELECT nome, 
	DATE_FORMAT(dataNasc, '%d/%m/%Y') AS Nascimento
	FROM paciente WHERE dataNasc < '1980-01-01'
	ORDER BY dataNasc DESC;
	
SELECT nome, 
	DATE_FORMAT(dataNasc, '%d/%m/%Y') AS Nascimento
	FROM paciente WHERE YEAR(dataNasc) < 1980
	ORDER BY dataNasc DESC;
	
-- Exibir o nome e a data de nascimento dos pacientes que fazem aniversário no mês atual.
SELECT nome, 
	DATE_FORMAT(dataNasc, '%d/%m/%Y') AS Nascimento
	FROM paciente 
	WHERE MONTH(dataNasc) = MONTH(NOW());

-- Exibir o nome dos pacientes, gênero, nome e telefone do contato informado.
SELECT paciente.nome, genero, 
	pessoaContato.nome, telefone
	FROM paciente INNER JOIN pessoaContato
	ON codPaciente = codPac;
	
SELECT p.nome AS NomePaciente, genero, 
	pc.nome AS NomeContato, telefone
	FROM paciente p INNER JOIN pessoaContato pc
	ON codPaciente = codPac;
	
-- Exibir o nome dos médicos, suas especialidades e as datas e horários 
-- de seus atendimentos.
SELECT nome, espec, dataHora
	FROM medico INNER JOIN consulta
	ON codMedico = cod_med;

SELECT nome, espec, 
	DATE_FORMAT(dataHora, '%d/%m/%Y - %H:%i') AS Atendimento
	FROM medico INNER JOIN consulta
	ON codMedico = cod_med;
	
-- Exibir o nome dos médicos, suas especialidades e as datas e horários 
-- de seus atendimentos. Somente Ortopedia e Clinica Médica.
SELECT nome, espec, 
	DATE_FORMAT(dataHora, '%d/%m/%Y - %H:%i') AS Atendimento
	FROM medico INNER JOIN consulta
	ON codMedico = cod_med
	WHERE espec = 'Ortopedia' OR espec = 'clinica medica';

SELECT nome, espec, 
	DATE_FORMAT(dataHora, '%d/%m/%Y') AS DataAtendimento,
	DATE_FORMAT(dataHora, '%H:%i') AS HoraAtendimento
	FROM medico INNER JOIN consulta
	ON codMedico = cod_med
	WHERE espec IN('Ortopedia', 'clinica medica');
	
-- Exibir nome, gênero e diagnóstico dos pacientes.
SELECT nome, genero, diagnostico
	FROM paciente INNER JOIN consulta
	ON codPaciente = cod_pac;
	
-- Exibir o nome dos médicos, suas especialidades e as datas e horários 
-- de seus atendimentos. Consultas realizadas em janeiro e fevereiro de 2019.
SELECT nome, espec, 
	DATE_FORMAT(dataHora, '%d/%m/%Y - %H:%i') AS Atendimento
	FROM medico INNER JOIN consulta
	ON codMedico = cod_med
	WHERE dataHora >= '2019-01-01' AND dataHora <= '2019-02-28';

SELECT nome, espec, 
	DATE_FORMAT(dataHora, '%d/%m/%Y - %H:%i') AS Atendimento
	FROM medico INNER JOIN consulta
	ON codMedico = cod_med
	WHERE YEAR(dataHora) = 2019 AND MONTH(dataHora) IN(01, 02);
	
-- Exibir o nome dos pacientes, genero, data de nascimento e diagnostico.
-- Somente pacientes nascidos após 1980.
SELECT nome, genero,
	DATE_FORMAT(dataNasc, '%d/%m/%Y') AS Nascimento,
	diagnostico
	FROM paciente INNER JOIN consulta
	ON codPaciente = cod_pac
	WHERE YEAR(dataHora) > 1980;

-- Exibir o nome, o gênero, nascimento e idade de todos os pacientes. Caso tenha 
-- informado contato, exibir o nome e telefone do contato informado.

SELECT *
	FROM paciente LEFT JOIN pessoaContato
	ON codPaciente = codPac;

SELECT p.nome AS nomePaciente, genero,
	DATE_FORMAT(dataNasc, '%d/%m/%Y') AS Nascimento,
	pc.nome AS NomeContato, telefone
	FROM paciente p LEFT JOIN pessoaContato pc
	ON codPaciente = codPac;
	
SELECT nome, dataNasc, DATEDIFF(NOW(), dataNasc) AS Dias FROM paciente;

SELECT nome, dataNasc, 
	TRUNCATE(DATEDIFF(NOW(), dataNasc)/365.25, 0) AS Idade
	FROM paciente;
	
SELECT p.nome AS nomePaciente, genero,
	DATE_FORMAT(dataNasc, '%d/%m/%Y') AS Nascimento,
	TRUNCATE(DATEDIFF(NOW(), dataNasc)/365.25, 0) AS Idade,
	pc.nome AS NomeContato, telefone
	FROM paciente p LEFT JOIN pessoaContato pc
	ON codPaciente = codPac;

---------------------------------------------------------------------
	
-- Pesquisas em mais de 2 tabelas.

SELECT  medico.nome, paciente.nome, diagnostico
	FROM medico 
	INNER JOIN consulta ON codMedico = cod_med
	INNER JOIN paciente ON codPaciente = cod_pac;

SELECT m.nome AS NomeMedico, espec, 
	p.nome AS nomePaciente, genero,
	DATE_FORMAT(dataNasc, '%d/%m/%Y') AS Nascimento,
	TRUNCATE(DATEDIFF(NOW(), dataNasc)/365.25, 0) AS Idade,
	DATE_FORMAT(dataHora, '%d/%m/%Y - %H:%i') AS Atendimento,
	diagnostico
	FROM medico m
	INNER JOIN consulta ON codMedico = cod_med
	INNER JOIN paciente p ON codPaciente = cod_pac;

-- VIEW - Armazenar uma pesquisa(QUERY).

CREATE VIEW relAtendimento AS
	SELECT m.nome AS NomeMedico, espec, 
	p.nome AS nomePaciente, genero,
	DATE_FORMAT(dataNasc, '%d/%m/%Y') AS Nascimento,
	TRUNCATE(DATEDIFF(NOW(), dataNasc)/365.25, 0) AS Idade,
	TRUNCATE(DATEDIFF(dataHora, dataNasc)/365.25, 0) AS IdadeConsulta,
	DATE_FORMAT(dataHora, '%d/%m/%Y') AS DataAtendimento,
	DATE_FORMAT(dataHora, '%H:%i') AS HoraAtendimento,
	diagnostico
	FROM medico m
	INNER JOIN consulta ON codMedico = cod_med
	INNER JOIN paciente p ON codPaciente = cod_pac;

SELECT * FROM relAtendimento;

SELECT NomeMedico, nomePaciente, 
	idade, diagnostico 
	FROM relAtendimento;


