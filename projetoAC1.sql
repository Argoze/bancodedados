/*
Grupo 5 - 06/09/23
Gustavo Argoze - 212070
Felipe Marins Sanchez - 235272
Tales Augusto Sat�rio Furlan - 212170 
*/

create database AC1060923
go
use AC1060923
go

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
('Humanos', 'Seres b�pedes com polegar opositor', 'Macacos'),
('Vampiros', 'Seres b�pedes com polegar opositor e presas', 'Bruxaria'),
('Murloc', 'Seres b�pedes com polegar opositor e gelras', 'Peixes')

INSERT INTO Habilidade(Nome) VALUES
('Pedrada'),
('Chupada'),
('Lan�ada')

INSERT INTO Classe(Nome, Caracteristicas, IDHabilidade) VALUES
('Guerreiro', 'Robusto', 1),
('Assassino', 'Sanguin�rio', 2),
('Ca�ador', 'Estrategista', 3)

-- 6 



select *from Raca
