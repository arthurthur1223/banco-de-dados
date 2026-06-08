DROP TABLE IF EXISTS aluno_materia CASCADE;
DROP TABLE IF EXISTS alunos CASCADE;
DROP TABLE IF EXISTS materias CASCADE;
DROP TABLE IF EXISTS turmas CASCADE;

--1:1
CREATE TABLE turmas ( 
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome text NOT NULL
);

CREATE TABLE alunos (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome text NOT NULL,
    turma_id bigint,
    CONSTRAINT fk_turma FOREIGN KEY (turma_id) REFERENCES turmas(id)
);

CREATE TABLE materias (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome text NOT NULL
);

CREATE TABLE aluno_materia (
    aluno_id bigint REFERENCES alunos(id),
    materia_id bigint REFERENCES materias(id),
    PRIMARY KEY (aluno_id, materia_id)
);

INSERT INTO turmas (nome) VALUES 
('DS1'),
('DS2'),
('DS3');

INSERT INTO alunos (nome, turma_id) VALUES 
('João', 1),
('Angela', 1),
('Marilia', 2),
('Arthur', 3),
('Thomas', 3);

INSERT INTO materias (nome) VALUES 
('Matemática'),
('História'),
('Física'),
('Química'),
('Geografia');

INSERT INTO aluno_materia (aluno_id, materia_id) VALUES 
(1, 1),
(1, 3),
(2, 1),
(2, 2),
(3, 4),
(3, 5),
(4, 2),
(5, 3),
(5, 5);

SELECT 
    alunos.nome AS nome_aluno,
    turmas.nome AS nome_turma
FROM alunos
JOIN turmas ON alunos.turma_id = turmas.id;

SELECT 
    a.nome AS nome_aluno,
    m.nome AS nome_materia
FROM aluno_materia am
JOIN alunos a ON am.aluno_id = a.id
JOIN materias m ON am.materia_id = m.id;
