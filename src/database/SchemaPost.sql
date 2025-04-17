--BANCO DE DADOS PARA TESTES DO GLAMSYNC (FICTICIO)

CREATE DATABASE glamsync;
\c glamsync;

-- Schema creation for PostgreSQL

-- Create a table for users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a table for posts
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

-- Create a table for comments
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

-- Inserts para a tabela users
INSERT INTO users (name, email, password) VALUES 
('João Silva', 'joao.silva@example.com', 'senha123'),
('Maria Oliveira', 'maria.oliveira@example.com', 'senha456'),
('Carlos Souza', 'carlos.souza@example.com', 'senha789'),
('Ana Lima', 'ana.lima@example.com', 'senha101'),
('Pedro Santos', 'pedro.santos@example.com', 'senha202');

-- Inserts para a tabela posts
INSERT INTO posts (user_id, title, content) VALUES 
(1, 'Primeiro Post', 'Este é o conteúdo do primeiro post.'),
(2, 'Dicas de Programação', 'Aqui estão algumas dicas úteis para programadores.'),
(3, 'Viagem dos Sonhos', 'Compartilhando minha experiência de viagem.'),
(4, 'Receitas Fáceis', 'Aprenda a fazer receitas simples e deliciosas.'),
(5, 'Tecnologia do Futuro', 'Explorando as tendências tecnológicas.');

INSERT INTO posts (user_id, title, content) VALUES 
(1, 'Como aprender JavaScript', 'Dicas para iniciantes em JavaScript.'),
(2, 'Melhores Livros de 2025', 'Minha lista de livros favoritos deste ano.'),
(3, 'Fotografia para Iniciantes', 'Como começar no mundo da fotografia.'),
(4, 'Saúde e Bem-Estar', 'Dicas para uma vida saudável.'),
(5, 'Novidades em Inteligência Artificial', 'O que esperar da IA nos próximos anos.');

-- Inserts para a tabela comments
INSERT INTO comments (post_id, user_id, content) VALUES 
(1, 2, 'Ótimo post! Muito informativo.'),
(1, 3, 'Obrigado por compartilhar!'),
(2, 1, 'Adorei as dicas, vou aplicar no meu dia a dia.'),
(3, 4, 'Que viagem incrível!'),
(4, 5, 'Vou tentar essa receita no final de semana.');

INSERT INTO comments (post_id, user_id, content) VALUES 
(5, 1, 'Muito interessante, obrigado por compartilhar.'),
(6, 2, 'JavaScript é realmente uma linguagem incrível.'),
(7, 3, 'Já li alguns desses livros, são ótimos!'),
(8, 4, 'Fotografia é uma arte fascinante.'),
(9, 5, 'Saúde é realmente o mais importante.');

INSERT INTO comments (post_id, user_id, content) VALUES 
(10, 1, 'IA está mudando o mundo rapidamente.'),
(10, 2, 'Muito bom, quero aprender mais sobre isso.'),
(10, 3, 'Obrigado por compartilhar essas informações.'),
(10, 4, 'Estou ansioso para ver o futuro da tecnologia.'),
(10, 5, 'Excelente post, parabéns!');

