CREATE DATABASE livraria;
USE livraria;

CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(100) NOT NULL,
    cidade VARCHAR(50)
);

CREATE TABLE autores (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

CREATE TABLE livros (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ano_publicacao INT,
    id_editora INT
);

CREATE TABLE livro_autor (
    id_livro INT,
    id_autor INT,
    PRIMARY KEY (id_livro, id_autor)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE DEFAULT (CURRENT_DATE),
    id_cliente INT
);

CREATE TABLE itens_pedido (
    id_itens_pedido INT AUTO_INCREMENT,
    id_pedido INT,
    id_livro INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_itens_pedido, id_pedido, id_livro)
);

ALTER TABLE livros
ADD CONSTRAINT fk_livro_editora
FOREIGN KEY (id_editora)
REFERENCES editora(id_editora);

ALTER TABLE livro_autor
ADD CONSTRAINT fk_livroautor_livro
FOREIGN KEY (id_livro)
REFERENCES livros(id_livro);

ALTER TABLE livro_autor
ADD CONSTRAINT fk_livroautor_autor
FOREIGN KEY (id_autor)
REFERENCES autores(id_autor);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente);

ALTER TABLE itens_pedido
ADD CONSTRAINT fk_itempedido_pedido
FOREIGN KEY (id_pedido)
REFERENCES pedidos(id_pedido);

ALTER TABLE itens_pedido
ADD CONSTRAINT fk_itempedido_livro
FOREIGN KEY (id_livro)
REFERENCES livros(id_livro);