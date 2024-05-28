DELIMITER $$
CREATE PROCEDURE dados_cliente_do_caso(IN IDdocaso INT)
BEGIN
SELECT 
	*
FROM 
	cliente
    INNER JOIN caso ON cliente.NIF = caso.Cliente
WHERE
	caso.ID = IDdocaso;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE dados_prova_do_caso(IN IDdocaso INT)
BEGIN
SELECT 
	*
FROM 
	prova
    INNER JOIN caso ON prova.ID = caso.ID
WHERE
	caso.ID = IDdocaso;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE dados_suspeito_do_caso(IN IDdocaso INT)
BEGIN
SELECT 
	*
FROM 
	prova
    INNER JOIN suspeito ON prova.ID = suspeito.ID
WHERE
	caso.ID = IDdocaso;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE casos_do_detetive(IN IDdetetive INT)
BEGIN
SELECT 
	*
FROM 
	caso
    INNER JOIN casodetetive ON caso.ID = casodetetive.IdCaso
    INNER JOIN detetive ON casodetetive.IdDetetive = detetive.ID
WHERE
	detetive.ID = IdDetetive;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE relatorios_do_detetive(IN IDdetetive INT)
BEGIN
SELECT 
	DescriçãoRelatório
FROM 
	caso
WHERE
	Estado = 2; 
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE casos_do_cliente(IN NIFcliente INT)
BEGIN
SELECT 
	*
FROM 
	caso
    INNER JOIN cliente ON caso.Cliente = cliente.NIF
WHERE
	cliente.NIF = NIFcliente; 
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE detetives_estado_casos(IN numero_casos INT, IN estado INT)
BEGIN
SELECT 
	*
FROM 
	detetive
WHERE
	NumeroCasos >= numero_casos AND Estado = estado; 
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE casos_classificacao()
BEGIN
SELECT 
	caso.ID,
    caso.Classificação
FROM 
	caso 
ORDER BY
	Classificação;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE detetives_classificacao()
BEGIN
SELECT 
	detetive.Nome,
    detetive.Classificação
FROM 
	detetive 
ORDER BY
	Classificação;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE casos_data_a_data(IN data_inicio DATE, IN data_fim DATE)
BEGIN
SELECT 
	COUNT(*) AS row_count
FROM 
	caso
WHERE
	DataAbertura BETWEEN data_inicio AND data_fim;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE casos_data_a_data_fecho(IN data_inicio DATE, IN data_fim DATE)
BEGIN
SELECT 
	COUNT(*) AS row_count
FROM 
	caso
WHERE
	(DataFecho BETWEEN data_inicio AND data_fim)
    AND
    (Estado = 1);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE maiores_clientes(IN numero_clientes INT)
BEGIN
SELECT 
	cliente.Nome,
    cliente.Gasto
FROM 
	cliente
ORDER BY gasto DESC
LIMIT numero_clientes;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE clientes_classificacao()
BEGIN
SELECT 
	cliente.Nome,
    cliente.Classificação
FROM 
	cliente
ORDER BY
	Classificação;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE adicionar_cliente(IN NIF INT ,
    IN Nome VARCHAR(64),
    IN Email VARCHAR(45),
    IN Tipo ENUM ('Singular', 'Coletivo'),
    IN Rua VARCHAR(45),
	IN Classificação DECIMAL(4,2),
    IN Gasto DECIMAL(7,2),
    IN Numero CHAR(5),
	IN CodPostal CHAR(12),
    IN Sexo ENUM('M', 'F', 'ND'))
BEGIN
INSERT INTO cliente VALUES (Nome,Email,Tipo,Rua,Classificação,Gasto,Numero,CodPostal,Sexo);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE adicionar_cliente_telefone(IN Cliente INT,IN Telefone VARCHAR(15))
BEGIN
INSERT INTO clientetelefone VALUES (Cliente,Telefone);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE adicionar_suspeito(IN Nome VARCHAR(64),IN Descrição TEXT)
BEGIN
INSERT INTO suspeito(Nome,Descrição) VALUES (Nome,Descrição);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE adicionar_caso(
    IN Estado ENUM ('Aberto', 'Fechado'),
    IN DescriçãoCaso TEXT,
	IN DataAbertura DATETIME,
    IN DataFecho DATETIME,
    IN Preço DECIMAL(7,2),
    IN Classificação DECIMAL(4,2),
    IN DataEscritaRelatório DATETIME,
    IN DescriçãoRelatório TEXT,
    IN Cliente INT,
    IN Suspeito INT)
BEGIN
INSERT INTO suspeito(Estado,DescriçãoCaso,DataAbertura,DataFecho,Preço,Classificação,DataEscritaRelatório,DescriçãoRelatório,Cliente,Suspeito) VALUES (Estado,DescriçãoCaso,DataAbertura,DataFecho,Preço,Classificação,DataEscritaRelatório,DescriçãoRelatório,Cliente,Suspeito);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE adicionar_detetive(IN Nome VARCHAR(64),
    IN Email VARCHAR(45),
    IN NumeroCasos INT,
    IN Classificação DECIMAL(4,2),
    IN Estado ENUM('Ativo', 'Inativo'))
BEGIN
INSERT INTO suspeito(Nome,Email,NumeroCasos,Classificação,Estado) VALUES (Nome,Email,NumeroCasos,Classificação,Estado);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE adicionar_detetive_telefone(IN Telefone VARCHAR(15),
    IN Detetive INT)
BEGIN
INSERT INTO suspeito(Telefone,Detetive) VALUES (Telefone,Detetive);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE adicionar_detetive_caso(IN IdDetetive INT,
    IN IdCaso INT,
    IN Responsável TINYINT)
BEGIN
INSERT INTO suspeito(IdDetetive,IdCaso,Responsável) VALUES (IdDetetive,IdCaso,Responsável);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE adicionar_detetive_caso(IN IdDetetive INT,
    IN IdCaso INT,
    IN Responsável TINYINT)
BEGIN
INSERT INTO suspeito(IdDetetive,IdCaso,Responsável) VALUES (IdDetetive,IdCaso,Responsável);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE adicionar_prova(
    IN Descrição TEXT,
    IN DataDescoberta DATETIME,
    IN Suspeito INT,
    IN Caso INT,
    IN Detetive INT)
BEGIN
INSERT INTO suspeito(Descrição,DataDescoberta,Suspeito,Caso,Detetive) VALUES (Descrição,DataDescoberta,Suspeito,Caso,Detetive);
END $$
DELIMITER ;



