-- BANCO DE DADOS OFICIAL DO GLAMSYNC
-- CRIAÇÃO DO BANCO DE DADOS GLAMSYNC

CREATE DATABASE glamsync;


-- Schema creation for PostgreSQL

-- Create a table for posts
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    photo TEXT,
    likes INT DEFAULT 0,
    comments INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO posts (user_id, title, content, categoria, photo, likes, comments) 
VALUES 
    (1, 'Moda é vida', 'O estilo é uma maneira de dizer quem você é sem precisar falar. 💬👗', 'Roupas', 'https://br.pinterest.com/pin/1407443629356036/', 60, 54),
    (2, 'Estilo pessoal', 'Vestir-se bem é uma arte, e eu sou a obra-prima. 🎨✨', 'Sapatos', 'https://br.pinterest.com/pin/3377768467826560/', 45, 30),
    (3, 'Liberdade na moda', 'A moda é uma forma de liberdade. Liberte-se! 🌟', 'Roupas', 'https://br.pinterest.com/pin/1407443629356036/', 80, 20),
    (4, 'Elegância', 'Elegância não é sobre ser notada, mas sobre ser lembrada. ✨👑', 'Joias', 'https://br.pinterest.com/pin/1407443629356036/', 90, 15),
    (5, 'Brilho pessoal', 'Toda mulher é uma estrela, e o estilo é seu brilho. ✨🌟', 'Maquiagem', 'https://br.pinterest.com/pin/1407443629356036/', 70, 25),
    (6, 'Estilo próprio', 'A moda não tem regras, só estilo próprio. 🔥💁‍♀️', 'Roupas', 'https://br.pinterest.com/pin/1407443629356036/', 50, 40),
    (7, 'Confiança', 'Confiança é o melhor acessório que você pode usar. 👑💖', 'Roupas', 'https://br.pinterest.com/pin/1407443629356036/', 65, 35),
    (8, 'Peças atemporais', 'Peças atemporais para momentos inesquecíveis. ⏳✨', 'Roupas', 'https://br.pinterest.com/pin/1407443629356036/', 55, 28),
    (9, 'Beleza no olhar', 'A verdadeira beleza está no olhar de quem vê. 👀💖', 'Roupas', 'https://br.pinterest.com/pin/1407443629356036/', 75, 22),
    (10, 'Estilo pessoal 2', 'Estilo é saber quem você é, o que você quer e não dar a mínima para os outros. 💅🔥', 'Roupas', 'https://br.pinterest.com/pin/1407443629356036/', 85, 18);

CREATE TABLE chats (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    message TEXT NOT NULL,
    photo TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO chats (user_id, message, photo) VALUES
    (1, 'A moda é uma forma de liberdade. Liberte-se! 🌟', 'https://br.pinterest.com/pin/1407443629356036/'),
    (2, 'A moda é uma forma de liberdade. Liberte-se! 🌟', 'https://br.pinterest.com/pin/1407443629356036/'),
    (3, 'A moda é uma forma de liberdade. Liberte-se! 🌟', 'https://br.pinterest.com/pin/1407443629356036/'),
    (4, 'A moda é uma forma de liberdade. Liberte-se! 🌟', 'https://br.pinterest.com/pin/1407443629356036/'),
    (5, 'A moda é uma forma de liberdade. Liberte-se! 🌟', 'https://br.pinterest.com/pin/1407443629356036/');



