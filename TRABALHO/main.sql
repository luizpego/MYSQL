create database if not exists controle_estoque;
use controle_estoque;

create table cliente(
cliente_id int primary key,
nome varchar(50),
cpf_cnpj varchar(20),
telefone varchar(20),
email varchar(100),
endereco varchar(50),
cidade varchar(50),
estado varchar (30),
data_cadastro date,
limite_credito int,
status varchar(20)
);

create table produto(
produto_id int primary key,
codigo varchar(20),
descricao varchar(50),
preco_venda decimal not null,
preco_custo decimal not null,
estoque_atual decimal not null,
estoque_minimo decimal not null,
categoria_id int,
foreign key (categoria_id) references categoria(categoria_id),
unidade_medida varchar(20),
data_cadastro date,
status varchar(20)
);

create table fornecedor(
fornecedor_id int primary key,
nome varchar(50),
cpf_cnpj varchar(20),
telefone varchar(20),
email varchar(20),
endereco varchar(20),
cidade varchar(20),
estado varchar(20),
data_cadastro date,
status varchar(20)
);

create table categoria(
categoria_id int primary key,
nome varchar(30),
descricao varchar(50),
status varchar(20)
);

create table funcionario(
funcionario_id int primary key,
nome varchar(30),
cpf_cnpj varchar(20),
cargo varchar(20),
data_contratacao date,
salario decimal not null,
telefone varchar(20),
email varchar(50),
status varchar(20)
);

create table transportadora(
transportadora_id int primary key,
nome varchar(50),
cnpj varchar(30),
telefone varchar(20),
email varchar(50),
status varchar(20)
);

create table rota(
rota_id int primary key,
nome varchar(50),
origem varchar(30),
destino varchar(30),
distancia_km int,
tempo_estimado time,
transportadora_id int,
foreign key(transportadora_id) references transportadora(transportadora_id),
status varchar(20)
);

