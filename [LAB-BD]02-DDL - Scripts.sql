CREATE DATABASE auladia30_08_23
go

use auladia30_08_23
go

CREATE TABLE Modelo
(
    IDModelo int not null identity,
    Nome varchar(200) not null,
    Descricao varchar(500),
    CONSTRAINT PKIDModelo PRIMARY KEY (IDModelo)
)
go

CREATE TABLE Veiculo
(
    IDVeiculo int not null identity,
    Proprietario varchar(200) not null,
    Placa varchar(50) not null,
    DataCompra datetime,
    IDModelo int not null,
    Valor numeric(18,2) not null,
    CONSTRAINT PKIDVeiculo PRIMARY KEY (IDVeiculo),
    CONSTRAINT FKVeiculoModelo FOREIGN KEY (IDModelo) REFERENCES Modelo(IDModelo)
)
go

--Adicionar Colunas
ALTER TABLE Modelo ADD NumeroLugares int 
ALTER TABLE Modelo ADD Tipo varchar(100)
go

--Adicionar Consistência
ALTER TABLE Modelo ADD CHECK (Tipo in ('Sedan', 'SUV', 'Hatch', 'Outros'))
go

--Valor Padrão
ALTER TABLE Modelo ADD CONSTRAINT defLugares DEFAULT 5 FOR NumeroLugares
go

--Adicionar Colunas
ALTER TABLE Veiculo ADD VouApagar numeric(18,2)
ALTER TABLE Veiculo ADD AnoFabricacao int
ALTER TABLE Veiculo ADD Cores varchar(10)
go

--Adicionar Consistência
ALTER TABLE Veiculo ALTER COLUMN AnoFabricacao int not null
go

--Tamanho da Coluna
ALTER TABLE Veiculo ALTER COLUMN Cores varchar(50)
go

--Excluir coluna
ALTER TABLE Veiculo DROP COLUMN VouApagar
go

--Renomear Coluna
SP_RENAME 'Veiculo.Cores', Cor
go



INSERT INTO Modelo (Nome, NumeroLugares, Tipo) VALUES /* inserindo dados na tabela*/
('HB20S', 5, 'Sedan')

INSERT INTO Modelo (Nome, NumeroLugares, Tipo) VALUES /* inserindo dados na tabela*/
('HB20S', 5, 'Hatch'),
('Porsche Spyder', 2, 'Outros'),
('Touro', 5, 'Outros')

select *from Modelo /*ver os itens da tabela*/

delete from Modelo /*deleta todos os itens da tabela*/

DBCC	CHECKIDENT (Modelo, RESEED, 0) /*reset nos id da tabela*/

SET DATEFORMAT DMY

INSERT INTO Veiculo (Proprietario, Placa, DataCompra, IDModelo, Valor, AnoFabricacao) VALUES --inserindo iformaçao no veiculo
('Gustvo Argoze', 'nsei', '29-03-2004', 1, 50000, 2004)

INSERT INTO Veiculo  VALUES --inserindo iformaçao no veiculo
('Victoria Mariucha', 'nsei', '29-03-2004 13:59:12', 2, 123000, 2004, 'rosa')

select *from Veiculo --vendo a tabela

select *from Modelo

update Modelo set Descricao = 'VAI DAR MERDA' -- nao coloquei em qual linha vai aplicar logo afetou todas as linhas

update Modelo set Descricao = 'Carro forte' where IDModelo = 3 -- agora disse em qual linha ele deve mudar
update Modelo set Descricao ='Nova', NumeroLugares = 7 where Tipo = 'SUV' -- mudei todas as descriçoes e numero de lugares em todos que estao com o tpo SUV

update Veiculo set Cor = 'branco' where Cor is null --atualiza todos as cores que estiverem NULL

delete from Modelo -- nao da pois tem referencia/primary key (apagar 1 veiculo depois essa)

DELETE FROM Modelo WHERE NumeroLugares >5 AND Tipo = 'SUV' -- faz com que delete todos os modelos com 5 lugares  SUV