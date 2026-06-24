-- Criação das Tabelas 
create database luiz_atividade;

use luiz_atividade;

CREATE TABLE clientes ( 
id_cliente INT PRIMARY KEY, 
nome VARCHAR(100), 
cidade VARCHAR(50), 
tipo_perfil VARCHAR(20) -- 'Bronze', 'Prata', 'Ouro' 
); 
CREATE TABLE produtos ( 
id_produto INT PRIMARY KEY, 
nome_produto VARCHAR(100), 
categoria VARCHAR(50), 
preco DECIMAL(10, 2) 
); 
CREATE TABLE pedidos ( 
id_pedido INT PRIMARY KEY, 
id_cliente INT, 
data_pedido DATE, 
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) 
); 
CREATE TABLE itens_pedido ( 
id_pedido INT, 
id_produto INT, 
quantidade INT, 
preco_unitario DECIMAL(10, 2), 
PRIMARY KEY (id_pedido, id_produto), 
FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido), 
FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) 
); -- Inserção de Dados de Teste 
INSERT INTO clientes VALUES  
(1, 'Carlos Silva', 'São Paulo', 'Ouro'), 
(2, 'Ana Beatriz', 'Belo Horizonte', 'Prata'), 
(3, 'Marcos Souza', 'Rio de Janeiro', 'Bronze'), 
(4, 'Julia Mendes', 'São Paulo', 'Ouro'), 
(5, 'Ricardo Oliveira', 'Curitiba', 'Bronze'); 
INSERT INTO produtos VALUES  
(101, 'Notebook Pro', 'Eletrônicos', 4500.00), 
(102, 'Mouse Sem Fio', 'Acessórios', 150.00), 
(103, 'Teclado Mecânico', 'Acessórios', 350.00), 
(104, 'Monitor 24 Pol', 'Eletrônicos', 1200.00), 
(105, 'Cadeira Gamer', 'Móveis', 1800.00); 
INSERT INTO pedidos VALUES  
(1001, 1, '2026-01-10'), 
(1002, 2, '2026-01-12'), 
(1003, 4, '2026-01-15'), 
(1004, 1, '2026-01-20'), 
(1005, 3, '2026-01-22'); 
INSERT INTO itens_pedido VALUES  
(1001, 101, 1, 4500.00), 
(1001, 102, 2, 150.00), 
(1002, 103, 1, 350.00), 
(1003, 101, 1, 4500.00), 
(1003, 104, 1, 1200.00), 
(1004, 105, 1, 1800.00), 
(1005, 102, 1, 150.00);

select produtos.nome_produto, produtos.preco
from produtos
where produtos.preco > (select avg(produtos.preco) from produtos);

select produtos.nome_produto, produtos.categoria
from produtos
where produtos.preco = (select max(produtos.preco) from produtos);

select pedidos.id_pedido, pedidos.data_pedido
from pedidos
where pedidos.id_cliente = (select clientes.id_cliente from clientes where clientes.nome = "Carlos Silva");

select clientes.nome, clientes.cidade
from clientes
where clientes.id_cliente in (select pedidos.id_cliente from pedidos);

select clientes.nome, clientes.cidade
from clientes
where clientes.id_cliente not in (select pedidos.id_cliente from pedidos);

select pedidos.id_pedido,itens_pedido.quantidade
from pedidos
inner join itens_pedido
on pedidos.id_pedido = itens_pedido.id_pedido
inner join produtos
on itens_pedido.id_produto	= produtos.id_produto
where produtos.id_produto in (select produtos.id_produto from produtos where produtos.categoria = "Eletrônicos");

select produtos.nome_produto, produtos.preco
from produtos
where produtos.preco > (select avg(produtos.preco) from produtos where produtos.categoria = "Eletronicos");

SELECT clientes.nome,(SELECT COUNT(*) FROM pedidos WHERE pedidos.id_cliente = clientes.id_cliente) AS total_pedidos FROM clientes;

select clientes.nome, clientes.cidade
from clientes
where clientes.id_cliente in (select pedidos.id_cliente from pedidos where pedidos.id_pedido in
 (select itens_pedido.id_pedido from itens_pedido where itens_pedido.id_produto in
 (select produtos.id_produto from produtos where produtos.id_produto = "101")));