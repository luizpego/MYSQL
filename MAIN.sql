CREATE DATABASE blog;
USE blog;

CREATE TABLE usuario(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE publicacoes(
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    conteudo TEXT NOT NULL,
    data_publicacao DATETIME,
    autor_id INT
);

CREATE TABLE comentario_post(
    comentario_id INT PRIMARY KEY AUTO_INCREMENT,
    texto_comentario TEXT NOT NULL,
    data_comentario DATETIME,
    usuario_id INT,
    post_id INT
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

ALTER TABLE comentario_postAS
DROP COLUMN resumo;

ALTER TABLE publicacoes
RENAME TO publicacao;