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

CREATE TABLE categorias (
    categoria_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE tags (
    tag_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_da_tag VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    is_admin BOOLEAN DEFAULT FALSE
);

CREATE TABLE publicacoes (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    conteudo TEXT,
    categoria_id INT
);

CREATE TABLE publicacao_tag (
    publicacao_id INT,
    tag_id INT,
    PRIMARY KEY (publicacao_id, tag_id)
);

CREATE TABLE curtidas (
    curtida_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    post_id INT,
    data_curtida DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE (usuario_id, post_id),

    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(usuario_id),

    FOREIGN KEY (post_id)
    REFERENCES publicacoes(post_id)
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

ALTER TABLE publicacoes
ADD CONSTRAINT fk_publicacao_categoria
FOREIGN KEY (categoria_id)
REFERENCES categorias(categoria_id);

ALTER TABLE publicacao_tag
ADD CONSTRAINT fk_publicacaotag_publicacao
FOREIGN KEY (publicacao_id)
REFERENCES publicacoes(post_id);

ALTER TABLE publicacao_tag
ADD CONSTRAINT fk_publicacaotag_tag
FOREIGN KEY (tag_id)
REFERENCES tags(tag_id);

ALTER TABLE curtidas
ADD CONSTRAINT fk_curtida_usuario
FOREIGN KEY (usuario_id)
REFERENCES usuarios(usuario_id);

ALTER TABLE curtidas
ADD CONSTRAINT fk_curtida_post
FOREIGN KEY (post_id)
REFERENCES publicacoes(post_id);

ALTER TABLE categorias
MODIFY descricao TEXT NULL;

CREATE TABLE tabela_teste AS
SELECT * FROM categorias;

DROP TABLE tabela_teste;