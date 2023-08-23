create table modelo
(
	idmodelo int not null primary key identity,
	nome varchar(200)not null,
	descricao varchar(500)

)

create table veiculo 
(
  idveiculo int not null primary key identity,
  proprietario varchar(200) not null,
  placa varchar(200)not null,
  datacompra datetime,
  idmodelo int not null references modelo(idmodelo),
  valor numeric(18,2) not null
)

create table exemplochavecomposta 
(
	idchave1 int not null,
	idchave2 int not null,
	nome varchar(150) not null,

	constraint pkcomposta primary key (idchave1, idchave2),

)
/*Adicionar Colunas
	Adicionar Consistência
	Valor Padrão
*/
alter table modelo add numerolugares int

alter table modelo add tipo varchar(100)

alter table modelo add check (tipo in ('sedan','suv', 'hatch', 'outros'))

alter table modelo add constraint deflugares default 5 for numerolugares

/*
Adicionar Colunas
Adicionar Consistência
Tamanho da Coluna
Excluir coluna
Renomear Coluna
*/

alter table veiculo add vouapagar numeric(19,2)
alter table veiculo add anofabricacao int
alter table veiculo add cores varchar(10)

alter table veiculo drop column vouapagar

alter table veiculo alter column anofabricacao int not null
alter table veiculo alter column cores varchar(50)

sp_rename 'veiculo.cores',cor
