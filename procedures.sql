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
	*
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
	*
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
CREATE PROCEDURE casos_data_a_data(IN data_inicio DATE, IN data_fim DATE)
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