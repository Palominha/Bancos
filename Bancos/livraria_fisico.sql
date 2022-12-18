
create database livraria;

use livraria;

create table pessoafisica(
    cpf varchar(11) primary key not null
);

create table pessoajuridica(
    cnpj varchar(15) primary key not null
);

create table cliente(
    codigo int primary key not null,
    telefone varchar(11),
    endereço varchar(45),
    cpf varchar(11) primary key not null,
    foreign key (cpf) references 
    pessoafisica (cpf),
    cnpj varchar(15) primary key not null,
    foreign key (cnpj) references 
    pessoajuridica (cnpj)
);

create table compras(
    codigocliente int not null,
    isbn int not null,
    datacompra date,
    primary key (codigocliente, isbn)
    );

create table livro(
    isbn int primary key not null,
    qtd_estoque int,
    assunto varchar(45),
    autor varchar(45),
    codigoeditora varchar(45) 

);

create table editora(
    codigo int primary key not null,
    endereco varchar(45),
    telefone varchar(11),
    gerente varchar(45)

);
