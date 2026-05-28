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

create temporary table tabela_teste
like categorias;

drop table tabela_teste;