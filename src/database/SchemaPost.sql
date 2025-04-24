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


