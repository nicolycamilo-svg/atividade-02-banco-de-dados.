-- 1. Criacao do Banco de Dados
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- 2. Criacao das Tabelas
CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(150),
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao YEAR NOT NULL,
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_emprestimos_alunos FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

CREATE TABLE itens_emprestimo (
    id_emprestimo INT NOT NULL,
    id_livro INT NOT NULL,
    CONSTRAINT fk_itens_emprestimos FOREIGN KEY (id_emprestimo) REFERENCES emprestimos(id_emprestimo),
    CONSTRAINT fk_itens_livros FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

-- 3. Inserts Individuais

-- 3 Alunos
INSERT INTO alunos (nome, matricula, email) VALUES ('Lucas Gabriel', 'ALU202601', 'lucas.g@email.com');
INSERT INTO alunos (nome, matricula, email) VALUES ('Beatriz Souza', 'ALU202602', 'bea.souza@email.com');
INSERT INTO alunos (nome, matricula, email) VALUES ('Guilherme Lima', 'ALU202603', NULL);

-- 10 Livros
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Dom Casmurro', 'Machado de Assis', 1899);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('O Cortiço', 'Aluísio Azevedo', 1890);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Grande Sertão: Veredas', 'João Guimarães Rosa', 1956);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Vidas Secas', 'Graciliano Ramos', 1938);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Capitães da Areia', 'Jorge Amado', 1937);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('A Hora da Estrela', 'Clarice Lispector', 1977);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Memórias Póstumas de Brás Cubas', 'Machado de Assis', 1881);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Iracema', 'José de Alencar', 1865);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('O Alquimista', 'Paulo Coelho', 1988);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Ensaio sobre a Cegueira', 'José Saramago', 1995);

-- 15 Empréstimos (divididos em 3 meses: Janeiro, Fevereiro e Março de 2026)
-- Mês 1: Janeiro 2026
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-01-10', '2026-01-20');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (1, 1);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-01-12', '2026-01-22');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (2, 2);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-01-15', '2026-01-25');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (3, 3);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-01-18', '2026-01-28');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (4, 4);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-01-22', '2026-02-01');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (5, 5);

-- Mês 2: Fevereiro 2026
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-02-02', '2026-02-12');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (6, 6);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-02-05', '2026-02-15');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (7, 7);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-02-10', '2026-02-20');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (8, 8);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-02-14', '2026-02-24');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (9, 9);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-02-20', '2026-03-02');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (10, 10);

-- Mês 3: Março 2026
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-03-01', '2026-03-11');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (11, 1);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-03-05', '2026-03-15');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (12, 3);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-03-10', '2026-03-20');
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (13, 5);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-03-15', NULL); -- Empréstimo em aberto
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (14, 7);

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-03-20', NULL); -- Empréstimo em aberto
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (15, 9);

-- 4. Consultas Solicitadas na Atividade

-- Liste todos os livros com o nome do autor
SELECT 
    titulo, 
    autor, 
    ano_publicacao 
FROM livros;

-- Listar todos os empréstimos ordenando por data de realização
SELECT 
    e.id_emprestimo,
    a.nome AS nome_aluno,
    l.titulo AS titulo_livro,
    e.data_emprestimo,
    e.data_devolucao
FROM emprestimos e
INNER JOIN alunos a ON e.id_aluno = a.id_aluno
INNER JOIN itens_emprestimo ie ON e.id_emprestimo = ie.id_emprestimo
INNER JOIN livros l ON ie.id_livro = l.id_livro
ORDER BY e.data_emprestimo ASC;