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

create table venda(
venda_id int primary key,
data_venda date,
cliente_id int,
foreign key(cliente_id) references cliente(cliente_id),
funcionario_id int,
foreign key(funcionario_id) references funcionario(funcionario_id),
valor_total decimal not null,
desconto decimal not null, 
forma_pagamento varchar(20),
status varchar(20),
observacao varchar(20)
);

create table item_venda(
item_venda_id int primary key,
venda_id int,
foreign key(venda_id) references venda(venda_id),
produto_id int,
foreign key(produto_id) references produto(produto_id),
quantidade int,
preco_unitario decimal not null,
desconto decimal not null,
valor_total decimal not null
);

create table compra(
compra_id int primary key,
data_compra date,
fornecedor_id int,
foreign key(fornecedor_id) references fornecedor(fornecedor_id),
funcionario_id int,
foreign key (funcionario_id) references funcionario(funcionario_id),
valor_total decimal not null,
status varchar(20),
observacao varchar(20)
);

create table item_compra(
item_compra_id int primary key,
compra_id int,
foreign key (compra_id) references compra(compra_id),
produto_id int,
foreign key (produto_id) references produto(produto_id),
quantidade int,
preco_unitario decimal not null,
valor_total decimal not null
);

create table producao(
producao_id int primary key,
data_inicio date,
data_fim date,
funcionario_id int,
foreign key (funcionario_id) references funcionario (funcionario_id),
status varchar(20),
observacao varchar(20)
);

create table item_producao(
item_producao int primary key,
producao_id int,
foreign key (producao_id) references producao(producao_id),
produto_id int,
foreign key (produto_id) references produto(produto_id),
quantidade_planejada int,
quantidade_produzida int,
custo_unitario int,
valor_total decimal not null
);

create table pedido(
pedido_id int primary key,
data_pedido date,
cliente_id int,
foreign key (cliente_id) references cliente(cliente_id),
funcionario_id int,
foreign key (funcionario_id) references funcionario(funcionario_id),
data_entrega_prevista date,
rota_id int,
foreign key (rota_id) references rota(rota_id),
valor_total decimal not null,
status varchar(20),
observacao varchar(20)
);

create table item_pedido(
item_pedido_id int primary key,
pedido_id int,
foreign key (pedido_id) references pedido(pedido_id),
produto_id int,
foreign key (produto_id) references produto(produto_id),
quantidade int,
preco_unitario decimal not null,
desconto decimal not null,
valor_total decimal not null
);

