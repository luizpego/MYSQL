create database blog;
use blog;

create table usuarios(
    id int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    data_cadastro timestamp default current_timestamp
);

create table publicacoes_blog(
    post_id int primary key auto_increment,
    titulo varchar(200) not null,
    conteudo text not null,
    data_publicacao datetime,
    autor_id int
);

create table comentarios_post(
    comentario_id int primary key auto_increment,
    texto_comentario text not null,
    data_comentario datetime,
    usuario_id int,
    post_id int
);

alter table publicacoes_blog
add constraint fk_autor_id
foreign key (autor_id)
references usuarios(id);

alter table comentarios_post
add constraint fk_usuario_id
foreign key (usuario_id)
references usuarios(id);

alter table comentarios_post
add constraint fk_post_id
foreign key (post_id)
references publicacoes_blog(post_id);

alter table comentarios_post
add column resumo varchar(255);

alter table usuarios
modify column nome varchar(150);

alter table publicacoes_blog
add constraint chk_titulo
check (length(titulo) > 5);

alter table usuarios
rename column data_cadastro to data_de_craicao;

alter table usuarios
rename column data_de_craicao to data_de_criacao;

alter table comentarios_post
drop column resumo;

create table categorias(
    categoria_id int primary key auto_increment,
    nome_categoria varchar(100) not null unique,
    descricao text
) engine=InnoDB;

create table tags(
    tag_id int primary key auto_increment,
    nome_tag varchar(50) not null unique
);

create table publicacao_tag(
    publicacao_id int,
    tag_id int,
    primary key (publicacao_id, tag_id),
    foreign key (publicacao_id) references publicacoes_blog(post_id),
    foreign key (tag_id) references tags(tag_id)
);

alter table publicacoes_blog
add column categoria_id int;

alter table publicacoes_blog
add constraint fk_categoria_id
foreign key (categoria_id)
references categorias(categoria_id);

create table curtidas(
    curtida_id int primary key auto_increment,
    usuario_id int,
    post_id int,
    data_curtida datetime default current_timestamp,
    unique (usuario_id, post_id),
    foreign key (usuario_id) references usuarios(id),
    foreign key (post_id) references publicacoes_blog(post_id)
) ;

alter table usuarios
add column is_admin boolean default false;

alter table categorias
modify column descricao text null;

alter table curtidas
add constraint chk_data_curtida
check (data_curtida <= current_timestamp);

alter table tags
rename column nome_tag to nome_da_tag;

create table tabela_teste(
    categoria_id int primary key auto_increment,
    nome_categoria varchar(100) not null unique,
    descricao text null
) engine=InnoDB;

drop table tabela_teste;