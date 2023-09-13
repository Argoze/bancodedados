use BD2023S2_Turma

select *from Modelo
select *from Veiculo

select COUNT(*) qtdModelo from Modelo 

select SUM(Valor) SomaValorVeic from Veiculo -- fazendo a soma dos valores dos veiculos 
select AVG(Valor) MediaValor from Veiculo -- fazendo a media dos valores dos veiculos 
select SUM(Valor) Soma, AVG(Valor) Media, COUNT(*) Qtd from Veiculo -- fazendo a media dos valores dos veiculos, a media e a quantidade deles 
select MAX(Valor) Maximo, MIN(Valor) Minimo from veiculo --vendo o maximo de valor do veiculos  


select distinct AnoFabricacao from Veiculo
select AnoFabricacao, Count(*) Qtd from Veiculo group by AnoFabricacao -- vendo quanto carro tem em cada ano

SELECT AnoFabricacao, SUM(Valor) SomaValorVeiculos FROM Veiculo -- vendo os anos de fabricaçao e a soma dos valores 
Group by AnoFabricacao -- agrpando tudo de cima em um so 
HAVING SUM(Valor) >= 50000 --delimitando um valor para que mostre valores menor ou igual a 50000



