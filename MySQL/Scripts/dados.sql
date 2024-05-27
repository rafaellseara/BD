-- Seleção da base de dados
USE PISTA;

-- Desativar modo de atualização segura
SET SQL_SAFE_UPDATES = 0;

-- Apagar os dados existentes
DELETE FROM Prova;
DELETE FROM CasoDetetive;
DELETE FROM Caso;
DELETE FROM DetetiveTelefone;
DELETE FROM Detetive;
DELETE FROM Suspeito;
DELETE FROM ClienteTelefone;
DELETE FROM Cliente;

-- Povoar tabela Cliente
INSERT INTO Cliente (NIF, Nome, Email, Tipo, Rua, Classificação, Gasto, Numero, CodPostal, Sexo) VALUES
(1, 'Carlos Silva', 'carlos.silva@mail.com', 'Singular', 'Rua A', 0, 0, '123', '1234-567', 'M'),
(2, 'Ana Souza', 'ana.souza@mail.com', 'Singular', 'Avenida B', 0, 0, '456', '2345-678', 'F'),
(3, 'João Pereira', 'joao.pereira@mail.com', 'Singular', 'Travessa C', 0, 0, '789', '3456-789', 'M'),
(4, 'Maria Lima', 'maria.lima@mail.com', 'Singular', 'Rua D', 0, 0, '101', '4567-890', 'F'),
(5, 'Pedro Santos', 'pedro.santos@mail.com', 'Singular', 'Avenida E', 0, 0, '202', '5678-901', 'M'),
(6, 'Empresa X', 'empresa.x@mail.com', 'Coletivo', 'Rua F', 0, 0, '303', '6789-012', 'ND'),
(7, 'Empresa Y', 'empresa.y@mail.com', 'Coletivo', 'Avenida G', 0, 0, '404', '7890-123', 'ND'),
(8, 'Empresa Z', 'empresa.z@mail.com', 'Coletivo', 'Travessa H', 0, 0, '505', '8901-234', 'ND'),
(9, 'Fernando Costa', 'fernando.costa@mail.com', 'Singular', 'Rua I', 0, 0, '606', '9012-345', 'M'),
(10, 'Clara Oliveira', 'clara.oliveira@mail.com', 'Singular', 'Avenida J', 0, 0, '707', '0123-456', 'F');

-- Povoar tabela ClienteTelefone
INSERT INTO ClienteTelefone (Cliente, Telefone) VALUES
(1, '111111111'),
(1, '222222222'),
(2, '333333333'),
(2, '444444444'),
(3, '555555555'),
(3, '666666666'),
(4, '777777777'),
(5, '888888888'),
(5, '999999999');

-- Povoar tabela Suspeito
INSERT INTO Suspeito (Nome, Descrição) VALUES
('Suspeito A', 'Descrição do suspeito A'),
('Suspeito B', 'Descrição do suspeito B'),
('Suspeito C', 'Descrição do suspeito C'),
('Suspeito D', 'Descrição do suspeito D'),
('Suspeito E', 'Descrição do suspeito E');

-- Povoar tabela Detetive
INSERT INTO Detetive (Nome, Email, NumeroCasos, Classificação, Estado) VALUES
('Detetive X', 'x@detetive.com', 0, 0, 'Ativo'),
('Detetive Y', 'y@detetive.com', 0, 0, 'Ativo'),
('Detetive Z', 'z@detetive.com', 0, 0, 'Inativo'),
('Detetive W', 'w@detetive.com', 0, 0, 'Ativo'),
('Detetive V', 'v@detetive.com', 0, 0, 'Ativo');

-- Povoar tabela DetetiveTelefone
INSERT INTO DetetiveTelefone (Detetive, Telefone) VALUES
(1, '555555555'),
(2, '666666666'),
(3, '777777777'),
(4, '888888888'),
(5, '999999999');

-- Povoar tabela Caso
INSERT INTO Caso (Estado, DescriçãoCaso, DataAbertura, Preço, Classificação, Cliente, Suspeito) VALUES
('Aberto', 'Caso 1 descrição', '2023-01-01 10:00:00', 0, 0, 1, 1),
('Fechado', 'Caso 2 descrição', '2023-02-01 10:00:00', 0, 0, 1, 2),
('Aberto', 'Caso 3 descrição', '2023-03-01 10:00:00', 0, 0, 2, 1),
('Fechado', 'Caso 4 descrição', '2023-04-01 10:00:00', 0, 0, 3, 3),
('Aberto', 'Caso 5 descrição', '2023-05-01 10:00:00', 0, 0, 2, 2),
('Aberto', 'Caso 6 descrição', '2023-06-01 10:00:00', 0, 0, 4, 4),
('Fechado', 'Caso 7 descrição', '2023-07-01 10:00:00', 0, 0, 5, 5),
('Aberto', 'Caso 8 descrição', '2023-08-01 10:00:00', 0, 0, 5, 1),
('Fechado', 'Caso 9 descrição', '2023-09-01 10:00:00', 0, 0, 3, 4),
('Aberto', 'Caso 10 descrição', '2023-10-01 10:00:00', 0, 0, 1, 5);

-- Povoar tabela CasoDetetive
INSERT INTO CasoDetetive (IdDetetive, IdCaso, Responsável) VALUES
(1, 1, 1),
(2, 1, 0),
(1, 2, 1),
(2, 3, 1),
(3, 4, 0),
(1, 5, 0),
(2, 5, 1),
(3, 6, 1),
(4, 7, 0),
(5, 8, 1),
(1, 9, 0),
(2, 10, 1),
(4, 10, 0),
(5, 10, 1);

-- Povoar tabela Prova
INSERT INTO Prova (Descrição, DataDescoberta, Suspeito, Caso, Detetive) VALUES
('Prova 1', '2023-01-02 11:00:00', 1, 1, 1),
('Prova 2', '2023-02-02 12:00:00', 2, 2, 1),
('Prova 3', '2023-03-02 13:00:00', 1, 3, 2),
('Prova 4', '2023-04-02 14:00:00', 3, 4, 3),
('Prova 5', '2023-05-02 15:00:00', 2, 5, 2),
('Prova 6', '2023-06-02 16:00:00', 4, 6, 3),
('Prova 7', '2023-07-02 17:00:00', 5, 7, 4),
('Prova 8', '2023-08-02 18:00:00', 1, 8, 5),
('Prova 9', '2023-09-02 19:00:00', 4, 9, 1),
('Prova 10', '2023-10-02 20:00:00', 5, 10, 2);

-- Reativar modo de atualização segura
SET SQL_SAFE_UPDATES = 1;