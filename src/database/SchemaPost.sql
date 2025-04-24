--BANCO DE DADOS PARA TESTES DO GLAMSYNC (FICTICIO)

CREATE DATABASE glamsync;
\c glamsync;

-- Schema creation for PostgreSQL

-- Create a table for posts
CREATE TABLE posts (
    id_posts SERIAL PRIMARY KEY,
    id_users INTEGER REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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


