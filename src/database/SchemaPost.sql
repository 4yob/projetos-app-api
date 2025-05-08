--BANCO DE DADOS OFICIAL DO GRAMSYNC
-- CRIAÇÃO DO BANCO DE DADOS GLAMSYNC

CREATE DATABASE glamsync;
\c glamsync;

-- Schema creation for PostgreSQL

-- Create a table for posts
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    photo TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO posts (user_id, title, content, photo) VALUES
(1, 'Moda é vida', 'O estilo é uma maneira de dizer quem você é sem precisar falar. 💬👗', 'https://br.pinterest.com/pin/1407443629356036/'),
(2, 'Estilo pessoal', 'Vestir-se bem é uma arte, e eu sou a obra-prima. 🎨✨', 'https://br.pinterest.com/pin/3377768467826560/'),
(3, 'Liberdade na moda', 'A moda é uma forma de liberdade. Liberte-se! 🌟', 'https://br.pinterest.com/pin/1407443629356036/'),
(4, 'Elegância', 'Elegância não é sobre ser notada, mas sobre ser lembrada. ✨👑', 'https://br.pinterest.com/pin/1407443629356036/'),
(5, 'Brilho pessoal', 'Toda mulher é uma estrela, e o estilo é seu brilho. ✨🌟', 'https://br.pinterest.com/pin/1407443629356036/');
(6, 'Estilo próprio', 'A moda não tem regras, só estilo próprio. 🔥💁‍♀️', 'https://br.pinterest.com/pin/1407443629356036/'),
(7, 'Confiança', 'Confiança é o melhor acessório que você pode usar. 👑💖', 'https://br.pinterest.com/pin/1407443629356036/'),
(8, 'Peças atemporais', 'Peças atemporais para momentos inesquecíveis. ⏳✨', 'https://br.pinterest.com/pin/1407443629356036/'),
(9, 'Beleza no olhar', 'A verdadeira beleza está no olhar de quem vê. 👀💖', 'https://br.pinterest.com/pin/1407443629356036/'),
(10, 'Estilo pessoal 2', 'Estilo é saber quem você é, o que você quer e não dar a mínima para os outros. 💅🔥', 'https://br.pinterest.com/pin/1407443629356036/');
