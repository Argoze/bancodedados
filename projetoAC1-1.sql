/*
Grupo 5 - 06/09/23
Gustavo Argoze - 212070
Felipe Marins Sanchez - 235272
Tales Augusto Satório Furlan - 212170 
*/

create database AC1060923
go
use AC1060923
go


--AC1.1:

-- 1 - DDL
CREATE TABLE Raca(
		IDRaca int not null identity,
		Nome varchar(100) not null,
		Descricao varchar(500),
		Origem varchar(150) not null,
		Perdido datetime,
		CONSTRAINT PKRaca PRIMARY KEY (IDRaca)
)

CREATE TABLE Habilidade(
	IDHabilidade int not null identity,
	Nome varchar(200) not null,
	CONSTRAINT PKHabilidade PRIMARY KEY (IDHabilidade)
)

CREATE TABLE Classe(
	IDClasse int not null identity,
	Nome varchar(100) not null,
	Caracteristicas varchar (1000),
	IDHabilidade int,
	CONSTRAINT PKIDClasse PRIMARY KEY (IDClasse),
	CONSTRAINT FKIDHabilidade FOREIGN KEY (IDHabilidade) REFERENCES Habilidade(IDHabilidade)
)

CREATE TABLE Personagem(
	IDPersonagem int not null identity,
	Nome varchar(100),
	Descricao varchar(500),
	DataNascimento datetime,
	IDRaca int not null,
	IDClasse int not null,
	CONSTRAINT PKIDPersonagem PRIMARY KEY (IDPersonagem),
	CONSTRAINT FKIDRaca FOREIGN KEY (IDRaca) REFERENCES Raca(IDRaca),
	CONSTRAINT FKIDClasse FOREIGN KEY (IDClasse) REFERENCES Classe(IDClasse)
)

-- 2
ALTER TABLE Personagem ADD Poder int not null
go

-- 3
ALTER TABLE Classe ALTER COLUMN Caracteristicas varchar (500)
go

-- 4 
ALTER TABLE Raca DROP COLUMN Perdido
go

-- 5 - DML

INSERT INTO Raca (Nome, Descricao, Origem) VALUES
('Humanos', 'Seres bípedes com polegar opositor', 'Macacos'),
('Vampiros', 'Seres bípedes com polegar opositor e presas', 'Bruxaria'),
('Murloc', 'Seres bípedes com polegar opositor e gelras', 'Peixes')

INSERT INTO Habilidade(Nome) VALUES
('Pedrada'),
('Chupada'),
('Lançada')

INSERT INTO Classe(Nome, Caracteristicas, IDHabilidade) VALUES
('Guerreiro', 'Robusto', 1),
('Assassino', 'Sanguinário', 2),
('Caçador', 'Estrategista', 3)

SELECT * FROM Raca
SELECT * FROM Classe

SET DATEFORMAT YMD

INSERT INTO Personagem(Nome, Descricao, DataNascimento, IDRaca, IDClasse, Poder) VALUES
('ARGOZÃO', 'Anciente Murloc da profundeza dos oceanos, barbudo', '2004-03-29 14:30:15', 3, 1, 240),
('MS','Caçador feroz e sanguinário','2005-02-10 03:32:14',1, 3, 450),
('Tales','Adora pão de alho','2004-04-06 06:32:14',2, 2, 10),
('A2.0','GRGRGGGLLLL','2004-03-29 14:30:15',3, 1, 80)

SELECT * FROM Personagem
-- 6

UPDATE Classe SET Caracteristicas = 'Características Gerais' WHERE Caracteristicas IS NULL;

-- 7

DELETE FROM Personagem WHERE YEAR(DataNascimento) BETWEEN 1970 AND 1990;

-- 8 - DQL
SELECT * FROM Classe;

-- 9

SELECT Nome, DataNascimento, Poder FROM Personagem WHERE Poder BETWEEN 0 AND 75;

-- 10

SELECT Nome, Descricao, Origem FROM Raca WHERE Nome LIKE '%Orc%';


--AC1.2:

-- 1
SELECT COUNT(*) AS QuantidadeDeHabilidades FROM Habilidade;

-- 2
SELECT C.Nome AS NomeDaClasse, COUNT(P.IDPersonagem) AS QuantidadeDePersonagens
FROM Classe C
LEFT JOIN Personagem P ON C.IDClasse = P.IDClasse
GROUP BY C.Nome;

-- 3
SELECT R.Nome AS NomeDaRaca, COUNT(P.IDPersonagem) AS QuantidadeDePersonagens
FROM Raca R
LEFT JOIN Personagem P ON R.IDRaca = P.IDRaca
GROUP BY R.Nome;

-- 4
SELECT C.Nome AS NomeDaClasse, AVG(P.Poder) AS ValorMedioDoPoder, SUM(P.Poder) AS SomaDoPoder
FROM Classe C
INNER JOIN Personagem P ON C.IDClasse = P.IDClasse
GROUP BY C.Nome
HAVING AVG(P.Poder) >= 100;

-- 5
SELECT
    P.Nome AS NomeDoPersonagem,
    P.DataNascimento,
    R.Nome AS NomeDaRaca,
    C.Nome AS NomeDaClasse,
    H.Nome AS NomeDaHabilidade
FROM Personagem P
INNER JOIN Raca R ON P.IDRaca = R.IDRaca
INNER JOIN Classe C ON P.IDClasse = C.IDClasse
INNER JOIN Habilidade H ON C.IDHabilidade = H.IDHabilidade;
