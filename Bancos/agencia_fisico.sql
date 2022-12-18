create database Agencia_Turismo;
use Agencia_Turismo;

create table cidade(
nome_cidade varchar(50),
estado varchar (20),
populacao int,
cod_cidade int primary key);

create table hotel(
cod_hotel int primary key,
nome_hotel varchar(50),
endereco varchar(100),
categoria varchar(10));

create table tipo_quarto(
cod_hotel int  key references hotel(cod_hotel),
cod_tipo int,
primary key(cod_hotel,cod_tipo),
num_quarto int,
valor_diaria int,
decricao varchar(50));

create table restaurante(
cod_restaurante int primary key,
cod_cidade int key references cidade(cod_cidade),
cod_hotel int key references hotel(cod_hotel),
nome varchar(50),
endereco varchar(100),
categoria varchar(30));

create table ponto_turistico(
cod_ponto_turistico int,
cod_cidade int key references cidade(cod_cidade),
primary key(cod_ponto_turistico),
descricao varchar(50),
endereco varchar (100));

create table igreja(
cod_igreja int  key references ponto_turistico(cod_ponto_turistico),
data_fundacao date,
estilo varchar(30)
primary key (cod_igreja));

create table museu(
cod_museu int key references ponto_turistico(cod_ponto_turistico),
data_fund date,
numero_salas int,
primary key (cod_museu));

create table casa_show(
cod_casa_show int  key references ponto_turistico(cod_ponto_turistico),
horario time,
dias_fechado date,
cod_restaurante int foreign key references restaurante(cod_restaurante),
primary key (cod_casa_show))

create table fundador(
cod_fundador int,
nome varchar(50),
data_nasc date,
data_obto date,
nacionalidade varchar(30),
atividade varchar(30),
primary key (cod_fundador))

create table fundacao(
cod_museu int foreign key references museu(cod_museu),
cod_fundador int foreign key references fundador(cod_fundador),
primary key (cod_museu, cod_fundador))

insert into cidade(nome_cidade,estado,populacao,cod_cidade)
values
('Sao Paulo','SP','124000000','01'),
('Rio de Janeiro','RJ','6320000','02'),
('Belo Horizonte','MG','1433000','03')

select *from cidade

alter table hotel
add cod_cidade int

alter table hotel
add constraint fk_cod_cidade foreign key(cod_cidade)
references cidade(cod_cidade)

insert into hotel(cod_hotel, nome_hotel,endereco,categoria,cod_cidade)
values
('001','Nova Era','Rua Libero Badarol 22','3 estrelas','01'),
('002','Jasmine','Rua do Tijuco 430','2 estrelas','02'),


('003','Miraje','Rua Sertao 120','4 estrelas','03')

select *from hotel

insert into tipo_quarto(cod_hotel,cod_tipo,num_quarto,valor_diaria,decricao)
values
('001','2','10','89.50','Quarto solteiro'),
('001','3','10','100','Quarto Casal'),
('001','4','5','120.50','1 Casal 2 solteiro'),
('002','2','10','70','Quarto 2 solteiro'),
('002','3','4','85','Quarto Casal'),
('002','4','5','100','1 Casal 2 solteiro'),
('003','2','20','90.50','Quarto solteiro'),
('003','3','10','110.50','Quarto Casal'),
('003','4','15','120.50','1 Casal 2 solteiro')

select *from tipo_quarto

insert into restaurante(cod_restaurante,cod_cidade,cod_hotel,nome,endereco,categoria)
values
('10','1','1','Restaurnate Nova Era','Rua Libero Badarol 22','Restaurnate por Kilo'),
('20','2','2','Churrascaria','Rua do Tijuco 500','Churrascaria'),


('30','3','3','Pizzaria','Rua Sertao 150','Pizzaria'),


('40','1',null,'Restaurante X','Rua Xavantes 1330','Self Service')

select *from restaurante

insert into ponto_turistico(cod_ponto_turistico, cod_cidade, descricao,endereco)
values
('11','3','Igreja Menino Jesus','Rua Mojor Olimpo 1000'),
('15','1','Igreja NS da Luz','Rua Bom Fim 18'),
('20','1','Museu','Rua Braz Cubas 401'),
('30','1','Boate','Av Coimbra 100'),
('25','2','Igreja Sao Judas','Rua XV Novembro SN'),
('40','2','Museu','AV Copa Cabana 40'),
('50','2','Discotec','Rua da Ladeira 200'),
('5','3','Igreja NS da Luz','Rua Bom Fim 18'),
('2','3','Museu','Rua Braz Cubas 401'),
('3','3','Boate','Av Coimbra 100')

select *from ponto_turistico

insert into igreja(cod_igreja,data_fundacao,estilo)
values
('11','19000522','null'),
('15','18500204','barroco'),
('25','19100816','gotico'),
('5','17900601','bizantina')

select *from igreja

insert into museu(cod_museu,data_fund,numero_salas)
values
('20','19000705','7'),
('40','19881101','3'),
('2','20051010','5')

select *from museu

alter table casa_show
alter column dias_fechado varchar(50)

insert into casa_show(cod_casa_show, horario, dias_fechado,cod_restaurante)
values
('30','23:00','Segunda a Quinta',null),
('50','21:00','Seunda a Sexta',null),
('3','22:00','Domingo a Quinta',null)

select *from casa_show

insert into fundador(cod_fundador,nome,data_nasc,data_obto,nacionalidade,atividade)
values
('31','Jose Bonifacio','18450210','19020502','Portuguesa','Professor'),
('23','Plinio Alcnatara','19010307','19590511','Brasileira','Medico'),


('13','Antonio Villas Boas','19320101','19940507','Brasileira','Historiador')

select *from fundador

insert into fundacao(cod_museu,cod_fundador)
values
('20','31'),
('40','23'),
('2','13')

select *from fundacao

/* 1-Listar todos os pontos turisticos com codigo, descrição e endereço */

select  cod_ponto_turistico, descricao, endereco
from ponto_turistico

/* 2-Listar as igrejas com código, data fundção e estilo */

select cod_igreja, data_fundacao, estilo
from igreja

/* 3-Listar o conteudo completo de cada tabela do Banco de Dados da Agencia de Turismo */

select *from casa_show
select *from cidade
select *from fundacao
select *from fundador
select *from hotel
select *from igreja
select *from museu
select *from ponto_turistico
select *from restaurante
select *from tipo_quarto

/* 4-Recuperar as informções das cidades que tem populção superior a 1 milhão
     de habitantes */

select *from cidade
where populacao > 10000000


/* 5-Quais os hoteis que tem categoria "3 estrelas"  */

select *from hotel
where categoria = '2 estrelas'

/* 6-Adicionar o campo Especialidades em Restaurante */

alter table restaurante
add especialidade varchar(20)

update restaurante
set especialidade = 'Comida Mineira'
where nome = 'Restaurnate Nova Era'

update restaurante
set especialidade = 'Churrascaria'
where nome = 'Churrascaria'

update restaurante
set especialidade = 'Comida Italiana'
where nome = 'Pizzaria'

update restaurante
set especialidade = 'Comida Mineira'
where nome = 'Restaurante X'

-- Alterando Categoria
update restaurante
set categoria = '3 estrelas'
where nome = 'Restaurnate Nova Era'

update restaurante
set categoria = '2 estrelas'
where nome = 'Churrascaria'

update restaurante
set categoria = '3 estrelas'
where nome = 'Pizzaria'

update restaurante
set categoria = '2 estrelas'
where nome = 'Restaurante X'

select *from restaurante