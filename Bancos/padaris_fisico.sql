use bakery;
show databases;
create database bakery;
/* Padaria */

CREATE TABLE Funcionario (
    id_funcionario int not null unique auto_increment,
    id_pessoa int not null unique auto_increment,
    cargo_funcionario varchar (40) not null unique,
    data_contrato_funcionario date not null,
    formacao_funcionario varchar (40) not null unique,
    area_funcionario varchar (40) not null unique,
    experiencia_funcionario varchar (40) not null unique,
    idioma_funcioario varchar (40) not null unique,
    rg_funcionario int not null unique,
    filiacao_funcionario varchar(50) null unique,
    primary key (id_funcionario)
);


/* Paderia_logico: */

CREATE TABLE Funcionario (
    id_funcionario NUMERIC PRIMARY KEY,
    id_pessoa NUMERIC,
    cargo_funcionario VARCHAR,
    data_contrato_funcionario DATE,
    formacao_funcionario VARCHAR,
    area_funcionario VARCHAR,
    experiencia_funcionario CHAR,
    idioma_funcioario VARCHAR,
    rg_funcionario DECIMAL,
    filiacao_funcionario VARCHAR
);

CREATE TABLE Pessoa_ (
    id_pessoa NUMERIC,
    nome VARCHAR,
    data_nascimento DATE,
    email VARCHAR,
    id_telefone NUMERIC,
    id_endereco VARCHAR,
    cpf_pessoa NUMERIC,
    id_cliente NUMERIC,
    id_pessoa NUMERIC,
    data_registr DATE,
    taxa_desconto REAL,
    numero_fidelidade NUMERIC,
    Pessoa__TIPO INT,
    PRIMARY KEY (id_pessoa, id_cliente)
);

CREATE TABLE Telefone (
    id_telefone NUMERIC PRIMARY KEY,
    fixo1_telefone NUMERIC,
    fixo2_telefone NUMERIC,
    celular1_telefone NUMERIC,
    celular2_telefone NUMERIC,
    fk_Pessoa__id_pessoa NUMERIC,
    fk_Pessoa__id_cliente NUMERIC
);

CREATE TABLE Endereco (
    id_endereco NUMERIC PRIMARY KEY,
    rua_endereco VARCHAR,
    numero_endereco NUMERIC,
    complemento_endereco CHAR,
    cep_endereco REAL,
    bairro_endereco VARCHAR,
    fk_Pessoa__id_pessoa NUMERIC,
    fk_Pessoa__id_cliente NUMERIC
);

CREATE TABLE Venda (
    id_produto NUMERIC,
    id_funcionario NUMERIC,
    id_fornecedor NUMERIC,
    id_venda NUMERIC PRIMARY KEY
);

CREATE TABLE Produto (
    quantidade_produto REAL,
    vencimento_produto DATE,
    id_fornecedor NUMERIC,
    preco_produto NUMERIC,
    id_produto NUMERIC PRIMARY KEY
);

CREATE TABLE Fornecedor_ (
    status_fornecedor CHAR,
    tipo_fornecedor VARCHAR,
    id_fornecedor NUMERIC PRIMARY KEY,
    nome_fantasia_fornecedor VARCHAR
);

CREATE TABLE Pode_ser_ (
    fk_Pessoa__id_pessoa NUMERIC,
    fk_Pessoa__id_cliente NUMERIC,
    fk_Funcionario_id_funcionario NUMERIC
);

CREATE TABLE Precisa (
    fk_Funcionario_id_funcionario NUMERIC,
    fk_Venda_id_venda NUMERIC
);

CREATE TABLE Necessita (
    fk_Venda_id_venda NUMERIC,
    fk_Produto_id_produto NUMERIC
);

CREATE TABLE Composta (
    fk_Produto_id_produto NUMERIC,
    fk_Fornecedor__id_fornecedor NUMERIC
);
 
ALTER TABLE Telefone ADD CONSTRAINT FK_Telefone_2
    FOREIGN KEY (fk_Pessoa__id_pessoa, fk_Pessoa__id_cliente)
    REFERENCES Pessoa_ (id_pessoa, id_cliente)
    ON DELETE CASCADE;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_2
    FOREIGN KEY (fk_Pessoa__id_pessoa, fk_Pessoa__id_cliente)
    REFERENCES Pessoa_ (id_pessoa, id_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Pode_ser_ ADD CONSTRAINT FK_Pode_ser__1
    FOREIGN KEY (fk_Pessoa__id_pessoa, fk_Pessoa__id_cliente)
    REFERENCES Pessoa_ (id_pessoa, id_cliente)
    ON DELETE SET NULL;
 
ALTER TABLE Pode_ser_ ADD CONSTRAINT FK_Pode_ser__2
    FOREIGN KEY (fk_Funcionario_id_funcionario)
    REFERENCES Funcionario (id_funcionario)
    ON DELETE SET NULL;
 
ALTER TABLE Precisa ADD CONSTRAINT FK_Precisa_1
    FOREIGN KEY (fk_Funcionario_id_funcionario)
    REFERENCES Funcionario (id_funcionario)
    ON DELETE RESTRICT;
 
ALTER TABLE Precisa ADD CONSTRAINT FK_Precisa_2
    FOREIGN KEY (fk_Venda_id_venda)
    REFERENCES Venda (id_venda)
    ON DELETE SET NULL;
 
ALTER TABLE Necessita ADD CONSTRAINT FK_Necessita_1
    FOREIGN KEY (fk_Venda_id_venda)
    REFERENCES Venda (id_venda)
    ON DELETE RESTRICT;
 
ALTER TABLE Necessita ADD CONSTRAINT FK_Necessita_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE SET NULL;
 
ALTER TABLE Composta ADD CONSTRAINT FK_Composta_1
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE SET NULL;
 
ALTER TABLE Composta ADD CONSTRAINT FK_Composta_2
    FOREIGN KEY (fk_Fornecedor__id_fornecedor)
    REFERENCES Fornecedor_ (id_fornecedor)
    ON DELETE SET NULL;