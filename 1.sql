DROP TABLE IF EXISTS aluno_materia CASCADE;
DROP TABLE IF EXISTS alunos CASCADE;
DROP TABLE IF EXISTS materias CASCADE;

--1:n
CREATE TABLE materias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    materia_id INTEGER REFERENCES materias(id) 
);

INSERT INTO materias (nome) VALUES 
('Matemática'),
('História'),
('Física');

INSERT INTO alunos (nome, materia_id) VALUES 
('Ana Silva', 1), 
('Bruno Santos', 1), 
('Carlos Oliveira', 2),
('Daniela Souza', 3),
('Eduardo Lima', 2); 

SELECT 
    a.id AS aluno_id,
    a.nome AS nome_aluno,
    m.nome AS nome_materia
FROM alunos a
JOIN materias m ON a.materia_id = m.id; 
