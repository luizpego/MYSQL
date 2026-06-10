create database teste;
use teste;

create table cursos(
id int primary key auto_increment,
nome_curso varchar(100) not null
);

create table alunos(
id int primary key auto_increment,
nome_aluno varchar(100) not null,
id_curso int,
foreign key(id_curso) references cursos(id)
);

insert into cursos(nome_curso) values
('Ciência da computação'),
('Engenharia civil'),
('admiministração'),
('Medicina');

insert into alunos(nome_aluno,id_curso) values
('João Silva',1),
('Maria Santos',2),
('Pedro Almeida', 1),
('Ana Oliveira', 3),
('Carlos Oliveira', NULL);

select A.nome_aluno, C.nome_curso from alunos A inner join Cursos C on A.id_curso = C.id;

select A.nome_aluno, C.nome_curso from alunos A right join Cursos C on A.id_curso = C.id;

select A.nome_aluno, C.nome_curso from alunos A left join Cursos C on A.id_curso = C.id;

