-- Verificar e descartar todas as vistas existentes
DROP VIEW IF EXISTS verDetetive;
DROP VIEW IF EXISTS verCasos;
DROP VIEW IF EXISTS verSuspeitos;
DROP VIEW IF EXISTS verClientes;
DROP VIEW IF EXISTS verProvasPorCasos;
DROP VIEW IF EXISTS ClientesPorCaso;
DROP VIEW IF EXISTS ProvasPorDetetive;
DROP VIEW IF EXISTS SuspeitosPorDetetive;
DROP VIEW IF EXISTS CasosPorDetetive;
DROP VIEW IF EXISTS RelatoriosPorDetetive;
DROP VIEW IF EXISTS CasosPorCliente;
DROP VIEW IF EXISTS DetetivesPorEstadoCasos;
DROP VIEW IF EXISTS DetetivesPorClassificacao;
DROP VIEW IF EXISTS ClientesPorClassificacaoMedia;
DROP VIEW IF EXISTS CasosPorClassificacao;
DROP VIEW IF EXISTS ClientesQueMaisGastam;
DROP VIEW IF EXISTS CasosRegistadosPorIntervalo;
DROP VIEW IF EXISTS CasosFechadosPorIntervalo;
DROP VIEW IF EXISTS CasosAbertosPorIntervalo;
DROP VIEW IF EXISTS ClassificacaoDetetives;

-- Criação das vistas

-- Criação da vista verDetetive
CREATE VIEW verDetetive AS
SELECT
    ID AS DetetiveID,
    Nome AS DetetiveNome,
    Email AS DetetiveEmail,
    NumeroCasos AS NumeroCasosInvestigados,
    Classificação AS DetetiveClassificacao,
    Estado AS DetetiveEstado
FROM
    Detetive;

-- Criação da vista verCasos
CREATE VIEW verCasos AS
SELECT
    ID AS CasoID,
    DescriçãoCaso,
    Estado AS EstadoCaso,
    DataAbertura AS DataAberturaCaso,
    DataFecho AS DataFechoCaso,
    Preço AS PrecoCaso,
    Classificação AS ClassificacaoCaso,
    Cliente AS ClienteID,
    Suspeito AS SuspeitoID
FROM
    Caso;

-- Criação da vista verSuspeitos
CREATE VIEW verSuspeitos AS
SELECT
    ID AS SuspeitoID,
    Nome AS SuspeitoNome,
    Descrição AS SuspeitoDescricao
FROM
    Suspeito;

-- Criação da vista verClientes
CREATE VIEW verClientes AS
SELECT
    NIF AS ClienteNIF,
    Nome AS ClienteNome,
    Email AS ClienteEmail,
    Tipo AS ClienteTipo,
    Rua AS ClienteRua,
    Numero AS ClienteNumero,
    CodPostal AS ClienteCodPostal,
    Sexo AS ClienteSexo
FROM
    Cliente;

-- Criação da vista verProvasPorCasos
CREATE VIEW verProvasPorCasos AS
SELECT
    p.ID AS ProvaID,
    p.Descrição AS DescricaoProva,
    p.DataDescoberta AS DataDescobertaProva,
    p.Caso AS CasoID,
    c.DescriçãoCaso AS DescricaoCaso,
    p.Suspeito AS SuspeitoID,
    s.Nome AS NomeSuspeito,
    p.Detetive AS DetetiveID,
    d.Nome AS NomeDetetive
FROM
    Prova p
JOIN
    Caso c ON p.Caso = c.ID
JOIN
    Suspeito s ON p.Suspeito = s.ID
JOIN
    Detetive d ON p.Detetive = d.ID;

CREATE VIEW ClientesPorCaso AS
SELECT 
    c.ID AS CasoID,
    c.DescriçãoCaso,
    cl.NIF,
    cl.Nome,
    cl.Email,
    cl.Tipo,
    cl.Rua,
    cl.Numero,
    cl.CodPostal,
    cl.Sexo
FROM 
    Caso c
JOIN 
    Cliente cl ON c.Cliente = cl.NIF;

CREATE VIEW ProvasPorDetetive AS
SELECT 
    p.ID AS ProvaID,
    p.Descrição,
    p.DataDescoberta,
    p.Caso AS CasoID,
    c.DescriçãoCaso,
    p.Suspeito AS SuspeitoID,
    s.Nome AS SuspeitoNome,
    p.Detetive AS DetetiveID,
    d.Nome AS DetetiveNome
FROM 
    Prova p
JOIN 
    Suspeito s ON p.Suspeito = s.ID
JOIN 
    Caso c ON p.Caso = c.ID
JOIN 
    Detetive d ON p.Detetive = d.ID;

CREATE VIEW SuspeitosPorDetetive AS
SELECT 
    c.ID AS CasoID,
    c.DescriçãoCaso,
    s.ID AS SuspeitoID,
    s.Nome AS SuspeitoNome,
    s.Descrição AS SuspeitoDescrição,
    d.ID AS DetetiveID,
    d.Nome AS DetetiveNome
FROM 
    Caso c
JOIN 
    Suspeito s ON c.Suspeito = s.ID
JOIN 
    CasoDetetive cd ON c.ID = cd.IdCaso
JOIN 
    Detetive d ON cd.IdDetetive = d.ID;

CREATE VIEW CasosPorDetetive AS
SELECT 
    c.ID AS CasoID,
    c.DescriçãoCaso,
    c.Estado,
    c.DataAbertura,
    c.DataFecho,
    c.Preço,
    c.Classificação,
    d.ID AS DetetiveID,
    d.Nome AS DetetiveNome,
    cd.Responsável
FROM 
    Caso c
JOIN 
    CasoDetetive cd ON c.ID = cd.IdCaso
JOIN 
    Detetive d ON cd.IdDetetive = d.ID;

CREATE VIEW RelatoriosPorDetetive AS
SELECT 
    c.ID AS CasoID,
    c.DescriçãoRelatório,
    c.DataEscritaRelatório,
    d.ID AS DetetiveID,
    d.Nome AS DetetiveNome
FROM 
    Caso c
JOIN 
    CasoDetetive cd ON c.ID = cd.IdCaso
JOIN 
    Detetive d ON cd.IdDetetive = d.ID
WHERE 
    c.DescriçãoRelatório IS NOT NULL;

CREATE VIEW CasosPorCliente AS
SELECT 
    c.ID AS CasoID,
    c.DescriçãoCaso,
    c.Estado,
    c.DataAbertura,
    c.DataFecho,
    c.Preço,
    c.Classificação,
    cl.NIF AS ClienteID,
    cl.Nome AS ClienteNome,
    cl.Email AS ClienteEmail
FROM 
    Caso c
JOIN 
    Cliente cl ON c.Cliente = cl.NIF;

CREATE VIEW DetetivesPorEstadoCasos AS
SELECT 
    d.ID AS DetetiveID,
    d.Nome,
    d.Email,
    d.Estado,
    d.Classificação,
    COUNT(cd.IdCaso) AS NumeroCasos
FROM 
    Detetive d
LEFT JOIN 
    CasoDetetive cd ON d.ID = cd.IdDetetive
GROUP BY 
    d.ID,
    d.Nome,
    d.Email,
    d.Estado,
    d.Classificação;

CREATE VIEW DetetivesPorClassificacao AS
SELECT 
    d.ID AS DetetiveID,
    d.Nome,
    d.Email,
    d.Classificação
FROM 
    Detetive d;

CREATE VIEW ClientesPorClassificacaoMedia AS
SELECT 
    cl.NIF AS ClienteID,
    cl.Nome,
    AVG(c.Classificação) AS ClassificacaoMedia
FROM 
    Cliente cl
JOIN 
    Caso c ON cl.NIF = c.Cliente
GROUP BY 
    cl.NIF,
    cl.Nome;

CREATE VIEW CasosPorClassificacao AS
SELECT 
    c.ID AS CasoID,
    c.DescriçãoCaso,
    c.Classificação
FROM 
    Caso c;

CREATE VIEW ClientesQueMaisGastam AS
SELECT 
    cl.NIF AS ClienteID,
    cl.Nome,
    SUM(c.Preço) AS TotalGasto
FROM 
    Cliente cl
JOIN 
    Caso c ON cl.NIF = c.Cliente
GROUP BY 
    cl.NIF,
    cl.Nome
ORDER BY 
    TotalGasto DESC;

CREATE VIEW CasosRegistadosPorIntervalo AS
SELECT 
    c.ID AS CasoID,
    c.DataAbertura
FROM 
    Caso c;

CREATE VIEW CasosFechadosPorIntervalo AS
SELECT 
    c.ID AS CasoID,
    c.DataFecho
FROM 
    Caso c
WHERE 
    c.DataFecho IS NOT NULL;

CREATE VIEW CasosAbertosPorIntervalo AS
SELECT 
    c.ID AS CasoID,
    c.DataAbertura,
    c.Estado
FROM 
    Caso c
WHERE 
    c.Estado = 'Aberto';
    
CREATE VIEW ClassificacaoDetetives AS
SELECT
    ID AS DetetiveID,
    Nome AS DetetiveNome,
    Classificação AS DetetiveClassificacao
FROM
    Detetive;