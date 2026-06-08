DROP TABLE IF EXISTS funcionarios;
DROP TABLE IF EXISTS departamentos;

--n:n
CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
); 

CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento_id INTEGER REFERENCES departamentos(id)
);

INSERT INTO departamentos (nome) VALUES 
('Tecnologia da Informação'),
('Recursos Humanos');

INSERT INTO funcionarios (nome, departamento_id) VALUES 
('Alice Silva', 1),
('Bruno Souza', 1),
('Carlos Oliveira', 2); 

SELECT 
    f.id AS funcionario_id,
    f.nome AS nome_funcionario,
    d.nome AS nome_departamento
FROM funcionarios f
JOIN departamentos d ON f.departamento_id = d.id;
