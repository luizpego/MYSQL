CREATE DATABASE blog;
USE blog;

CREATE TABLE usuario(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_admin boolean default false
);

CREATE TABLE publicacoes(
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    conteudo TEXT NOT NULL,
    data_publicacao DATETIME,
    autor_id INT,
    categorias_id int,
    
    foreign key(categorias_id)
    references categorias(categoria_id)
);

CREATE TABLE comentario_post(
    comentario_id INT PRIMARY KEY AUTO_INCREMENT,
    texto_comentario TEXT NOT NULL,
    data_comentario DATETIME,
    usuario_id INT,
    post_id INT
);

create table categorias(
categoria_id int primary key auto_increment,
nome_categoria varchar(100) not null unique,
descricao text null
);

create table tags(
tag_id int primary key auto_increment,
nome_da_tag varchar(50) not null unique
);

create table publicacao_Tag(
publicacao_id int,
tag_id int,

foreign key (publicacao_id)
references publicacoes(post_id),

foreign key (tag_id)
references tags(tag_id),

primary key(publicacao_id, tag_id)
);

create table curtida(
curtida_id int primary key auto_increment,
usuario_id int unique,
post_id int unique,
data_curtida datetime default current_timestamp,
check (data_curtida <= current_timestamp),

foreign key(usuario_id)
references usuario(id),

foreign key(post_id)
references publicacoes(post_id)
);

ALTER TABLE publicacoes
ADD CONSTRAINT fk_post_usuario
FOREIGN KEY (autor_id)
REFERENCES usuario(id);

ALTER TABLE comentario_post
ADD CONSTRAINT fk_comentario_usuario
FOREIGN KEY (usuario_id)
REFERENCES usuario(id);

ALTER TABLE comentario_post
ADD CONSTRAINT fk_comentario_post
FOREIGN KEY (post_id)
REFERENCES publicacoes(post_id);

ALTER TABLE comentario_post
ADD resumo VARCHAR(255);

ALTER TABLE usuario
MODIFY nome VARCHAR(150);

ALTER TABLE publicacoes
ADD CONSTRAINT chk_titulo
CHECK (LENGTH(titulo) > 5);

ALTER TABLE usuario
RENAME COLUMN data_cadastro TO data_de_criacao;

ALTER TABLE comentario_post
DROP COLUMN resumo;

ALTER TABLE publicacoes
RENAME TO publicacao;


