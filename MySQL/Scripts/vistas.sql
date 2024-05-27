-- Verificar e descartar todas as vistas existentes
DROP VIEW IF EXISTS verDetetive;
DROP VIEW IF EXISTS verCasos;
DROP VIEW IF EXISTS verSuspeitos;
DROP VIEW IF EXISTS verClientes;
DROP VIEW IF EXISTS verProvas;

-- Criação das vistas

-- View para listar detetives e seus casos associados
CREATE VIEW verDetetive AS
SELECT 
    ID, 
    Nome, 
    Email, 
    NumeroCasos, 
    Classificação, 
    Estado
FROM 
    Detetive;

-- View para listar casos e seus clientes associados
CREATE VIEW verCasos AS
SELECT 
    Caso.ID, 
    Caso.Estado, 
    Caso.DescriçãoCaso, 
    Caso.DataAbertura, 
    Caso.DataFecho, 
    Caso.Preço, 
    Caso.Classificação, 
    Caso.DataEscritaRelatório, 
    Caso.DescriçãoRelatório, 
    Cliente.Nome AS ClienteNome, 
    Cliente.Email AS ClienteEmail,
    Cliente.Tipo AS ClienteTipo,
    Cliente.Rua AS ClienteRua,
    Cliente.Numero AS ClienteNumero,
    Cliente.CodPostal AS ClienteCodPostal,
    Cliente.Sexo AS ClienteSexo
FROM 
    Caso
JOIN 
    Cliente ON Caso.Cliente = Cliente.NIF;

-- View para listar suspeitos
CREATE VIEW verSuspeitos AS
SELECT 
    Caso.ID AS CasoID, 
    Caso.DescriçãoCaso AS CasoDescricao, 
    Suspeito.ID AS SuspeitoID, 
    Suspeito.Nome AS SuspeitoNome, 
    Suspeito.Descrição AS SuspeitoDescricao
FROM 
    Caso
JOIN 
    Suspeito ON Caso.Suspeito = Suspeito.ID;

-- View para listar todos os clientes
CREATE VIEW verClientes AS
SELECT 
    NIF, 
    Nome, 
    Email, 
    Tipo, 
    Rua, 
    Classificação, 
    Preço, 
    Numero, 
    CodPostal, 
    Sexo
FROM 
    Cliente;

-- View para listar provas
CREATE VIEW verProvas AS
SELECT 
    p.ID AS ProvaID,
    p.Descrição AS ProvaDescrição,
    c.ID AS CasoID,
    c.DescriçãoCaso AS CasoDescrição,
    d.ID AS DetetiveID,
    d.Nome AS DetetiveNome,
    s.ID AS SuspeitoID,
    s.Nome AS SuspeitoNome
FROM 
    Prova p
JOIN 
    Caso c ON p.Caso = c.ID
JOIN 
    Detetive d ON p.Detetive = d.ID
JOIN 
    Suspeito s ON p.Suspeito = s.ID;