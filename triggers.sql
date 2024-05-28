DELIMITER $$
CREATE TRIGGER atualizar_cliente_gasto
AFTER INSERT ON Caso
FOR EACH ROW
BEGIN
    UPDATE Cliente
    SET Gasto = Gasto + NEW.Preço
    WHERE NIF = NEW.Cliente;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER atualizar_cliente_classificacao
AFTER UPDATE ON Caso
FOR EACH ROW
BEGIN
    DECLARE avg_classificacao DECIMAL(4,2);
    
    SELECT AVG(Classificação) INTO avg_classificacao
    FROM Caso
    WHERE Cliente = NEW.Cliente
    AND Estado = 2;

    UPDATE Cliente
    SET Classificação = avg_classificacao
    WHERE NIF = NEW.Cliente;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER update_detetive_classificacao
AFTER UPDATE ON Caso
FOR EACH ROW
BEGIN
    DECLARE avg_classificacao DECIMAL(4,2);
    DECLARE detetive_id INT;
    
    -- Get the detective ID associated with the updated case
    SELECT IdDetetive INTO detetive_id
    FROM CasoDetetive
    WHERE IdCaso = NEW.ID;
    
    -- Calculate the average classification of cases associated with the detective
    SELECT AVG(c.Classificação) INTO avg_classificacao
    FROM Caso c
    JOIN CasoDetetive cd ON c.ID = cd.IdCaso
    WHERE cd.IdDetetive = detetive_id
    AND c.Estado = 2;

    -- Update the Detective's Classificação with the calculated average
    UPDATE Detetive
    SET Classificação = avg_classificacao
    WHERE ID = detetive_id;
END$$
DELIMITER 

DELIMITER $$
CREATE TRIGGER incrementar_numero_casos
AFTER INSERT ON CasoDetetive
FOR EACH ROW
BEGIN
    UPDATE Detetive
    SET NumeroCasos = NumeroCasos + 1
    WHERE ID = NEW.IdDetetive;
END$$
DELIMITER 

DROP TRIGGER IF EXISTS update_detetive_classificacao;
DROP TRIGGER IF EXISTS incrementar_numero_casos;

