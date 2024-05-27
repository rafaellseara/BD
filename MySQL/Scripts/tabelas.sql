DROP DATABASE IF EXISTS PISTA;

-- Criação da base de dados
CREATE DATABASE PISTA;

-- Seleção da base de dados
USE PISTA;

CREATE TABLE Cliente (
	NIF INT PRIMARY KEY,
    Nome VARCHAR(64) NOT NULL,
    Email VARCHAR(45) NOT NULL,
    Tipo ENUM ('Singular', 'Coletivo') NOT NULL,
    Rua VARCHAR(45) NOT NULL,
    Classificação DECIMAL(4,2),
    Preço DECIMAL(7,2) NOT NULL,
    Numero CHAR(5) NOT NULL,
	CodPostal CHAR(12) NOT NULL,
    Sexo ENUM('M', 'F', 'ND') NOT NULL
);

CREATE TABLE ClienteTelefone (
	Cliente INT NOT NULL,
	Telefone VARCHAR(15) NOT NULL,
    PRIMARY KEY (Cliente, Telefone),
    FOREIGN KEY (Cliente) REFERENCES Cliente (NIF)
);

CREATE TABLE Suspeito (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(64) NOT NULL,
    Descrição TEXT
);

CREATE TABLE Caso (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Estado ENUM ('Aberto', 'Fechado') NOT NULL,
    DescriçãoCaso TEXT,
    DataAbertura DATETIME NOT NULL,
    DataFecho DATETIME,
    Preço DECIMAL(7,2) NOT NULL,
    Classificação DECIMAL(4,2),
    DataEscritaRelatório DATETIME,
    DescriçãoRelatório TEXT,
    Cliente INT NOT NULL,
    Suspeito INT NOT NULL,
    FOREIGN KEY (Cliente) REFERENCES Cliente (NIF),
    FOREIGN KEY (Suspeito) REFERENCES Suspeito (ID)
);

CREATE TABLE Detetive (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(64) NOT NULL,
    Email VARCHAR(45) NOT NULL,
    NumeroCasos INT NOT NULL,
    Classificação DECIMAL(4,2) NOT NULL,
    Estado ENUM('Ativo', 'Inativo')
);

CREATE TABLE DetetiveTelefone (
	Telefone VARCHAR(15) NOT NULL,
    Detetive INT NOT NULL,
    PRIMARY KEY (Telefone, Detetive),
    FOREIGN KEY (Detetive) REFERENCES Detetive (ID)
);

CREATE TABLE CasoDetetive (
	IdDetetive INT NOT NULL,
    IdCaso INT NOT NULL,
    Responsável TINYINT NOT NULL,
    PRIMARY KEY (IdDetetive, IdCaso),
    FOREIGN KEY (IdDetetive) REFERENCES Detetive (ID),
    FOREIGN KEY (IdCaso) REFERENCES Caso (ID)
);

CREATE TABLE Prova (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Descrição TEXT NOT NULL,
    DataDescoberta DATETIME NOT NULL,
    Suspeito INT NOT NULL,
    Caso INT NOT NULL,
    Detetive INT NOT NULL,
    FOREIGN KEY (Suspeito) REFERENCES Suspeito (ID),
    FOREIGN KEY (Caso) REFERENCES Caso (ID),
    FOREIGN KEY (Detetive) REFERENCES Detetive (ID)
);