CREATE DATABASE biblioteca;

CREATE TABLE Aluno (
    id_aluno SERIAL PRIMARY KEY,
    rgu VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15),
    CHECK (telefone ~ '^[0-11]+$')
);

CREATE TABLE Livro (
    id_livro SERIAL PRIMARY KEY,
    codigo_livro VARCHAR(20) UNIQUE NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100),
    localizacao VARCHAR(50)
);

CREATE TABLE Professor (
    id_professor SERIAL PRIMARY KEY,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    sala VARCHAR(20),
    telefone VARCHAR(15),
    CHECK (telefone ~ '^[0-11]+$')
);

CREATE TABLE Emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    id_aluno INT REFERENCES Aluno(id_aluno),
    id_livro INT REFERENCES Livro(id_livro)
);

CREATE TABLE Bloqueio (
    id_bloqueio SERIAL PRIMARY KEY,
    data_bloqueio DATE NOT NULL,
    id_professor INT REFERENCES Professor(id_professor),
    id_livro INT REFERENCES Livro(id_livro),
    UNIQUE(id_professor, id_livro)
);

INSERT INTO Aluno (rgu, nome, endereco, telefone)
VALUES 
    ('12420179', 'Guilherme Borde', 'Rua Indaia, Nº 810', '24992632839'),
	('11710523', 'Vitoria Borde', 'Rua Quissama, Nº 1165', '21988672962');
    ('11720191', 'Bernardo Help', 'Rua Henrique Paixao, Nº 20', '24988654321'),
    

INSERT INTO Livro (codigo_livro, titulo, autor, localizacao)
VALUES 
    ('LIV001', 'A Arte da Guerra', 'Sun Tzu', 'Estante 1'),
    ('LIV002', 'Dom Quixote de la Mancha', 'Miguel de Cervantes Saavedra', 'Estante 2'),
    ('LIV003', 'Biblia', NULL, 'Estante 3');

INSERT INTO Professor (matricula, nome, sala, telefone)
VALUES 
    ('PROF1001', 'Prof. Luiz Alexandre', 'Sala C-407', '24981475623'),
    ('PROF1002', 'Prof. Flavio Frade', 'Sala A-212', '21988756423'),
    ('PROF1003', 'Prof. Bulinha', 'Sala A-111-3', '22993216547');

INSERT INTO Emprestimo (data_emprestimo, data_prevista_devolucao, data_devolucao, id_aluno, id_livro)
VALUES 
    ('2023-01-15', '2023-01-22', '2023-01-20', 1, 1),
    ('2023-02-10', '2023-02-17', NULL, 2, 2),
    ('2023-03-05', '2023-03-12', '2023-03-15', 3, 3);

INSERT INTO Bloqueio (data_bloqueio, id_professor, id_livro)
VALUES 
    ('2023-01-10', 1, 1),
    ('2023-01-20', 2, 2),
    ('2023-02-15', 3, 3);