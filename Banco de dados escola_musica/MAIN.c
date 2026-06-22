CREATE DATABASE IF NOT EXISTS escola_musica;
USE escola_musica;
CREATE TABLE alunos (
 id_aluno INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100) NOT NULL,
 idade INT,
 cidade VARCHAR(50)
);
CREATE TABLE cursos (
 id_curso INT PRIMARY KEY AUTO_INCREMENT,
 nome_curso VARCHAR(50),
 carga_horaria INT,
 valor_mensal DECIMAL(10,2)
);
CREATE TABLE matriculas (
 id_matricula INT PRIMARY KEY AUTO_INCREMENT,
 id_aluno INT,
 id_curso INT,
 data_matricula DATE,
 status VARCHAR(20),
 FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
 FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);
CREATE TABLE professores (
 id_professor INT PRIMARY KEY AUTO_INCREMENT,
 nome_prof VARCHAR(100),
 especialidade VARCHAR(50)
);
CREATE TABLE turmas (
 id_turma INT PRIMARY KEY AUTO_INCREMENT,
 id_curso INT,
 id_professor INT,
 horario VARCHAR(20),
 sala INT,
 FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
 FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
);
INSERT INTO alunos (nome, idade, cidade) VALUES
('Ana Silva', 23, 'São Paulo'),
('Bruno Lima', 31, 'Rio de Janeiro'),
('Carla Souza', 19, 'Belo Horizonte'),
('Diego Santos', 27, 'São Paulo'),
('Elena Rocha', 22, 'Curitiba'),
('Fernando Alves', 35, 'São Paulo'),
('Gabriela Nunes', 29, 'Belo Horizonte');
INSERT INTO cursos (nome_curso, carga_horaria, valor_mensal) VALUES
('Violão', 40, 250.00),
('Piano', 50, 350.00),
('Bateria', 45, 300.00),
('Canto', 30, 200.00),
('Guitarra', 40, 280.00);
INSERT INTO professores (nome_prof, especialidade) VALUES
('Ricardo Melo', 'Violão'),
('Patrícia Lins', 'Piano'),
('Carlos Eduardo', 'Bateria'),
('Marcela Prado', 'Canto'),
('Thiago Neves', 'Guitarra');
INSERT INTO turmas (id_curso, id_professor, horario, sala) VALUES
(1, 1, '14:00', 101),
(2, 2, '16:00', 102),
(3, 3, '10:00', 103),
(4, 4, '18:00', 104),
(5, 5, '19:00', 105),
(1, 1, '20:00', 106);
INSERT INTO matriculas (id_aluno, id_curso, data_matricula, status) VALUES
(1, 1, '2024-01-10', 'ativo'),
(2, 2, '2024-01-12', 'ativo'),
(3, 3, '2024-01-15', 'ativo'),
(4, 4, '2024-01-18', 'inativo'),
(5, 5, '2024-01-20', 'ativo'),
(1, 2, '2024-02-01', 'ativo'),
(6, 1, '2024-02-05', 'ativo'),
(7, 3, '2024-02-10', 'inativo'),
(2, 5, '2024-02-15', 'ativo'),
(3, 1, '2024-02-20', 'ativo');

select alunos.nome, cursos.nome_curso
from alunos
inner join cursos 
on alunos.id_aluno = cursos.id_curso;

select alunos.nome, cursos.nome_curso
from alunos
left join cursos 
on alunos.id_aluno = cursos.id_curso;

select alunos.nome, alunos.idade, cursos.nome_curso, alunos.cidade
from alunos
inner join cursos
on alunos.id_aluno = cursos.id_curso
where alunos.cidade = 'São Paulo';

select cursos.nome_curso, min(matriculas.data_matricula)
from cursos
inner join matriculas
on cursos.id_curso = matriculas.id_matricula;

SELECT cursos.nome_curso, COUNT(matriculas.id_matricula)
FROM cursos
LEFT JOIN matriculas
    ON cursos.id_curso = matriculas.id_curso
GROUP BY cursos.id_curso, cursos.nome_curso;

select alunos.nome, cursos.nome_curso, matriculas.status, matriculas.data_matricula
from alunos
inner join cursos
on alunos.id_aluno = cursos.id_curso
inner join matriculas
on alunos.id_aluno = matriculas.id_matricula;

select alunos.nome, cursos.nome_curso, professores.nome_prof
from alunos
inner join cursos
on alunos.id_aluno = cursos.id_curso
inner join professores
on alunos.id_aluno = professores.id_professor
inner join turmas
on alunos.id_aluno = turmas.id_turma;

SELECT alunos.nome,cursos.nome_curso,turmas.horario,matriculas.status,turmas.sala
FROM alunos
INNER JOIN matriculas 
    ON alunos.id_aluno = matriculas.id_aluno
INNER JOIN cursos 
    ON matriculas.id_curso = cursos.id_curso
INNER JOIN turmas 
    ON cursos.id_curso = turmas.id_curso;