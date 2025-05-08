CREATE TABLE chats (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    message TEXT NOT NULL,
    photo TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO chats (user_id, message, photo) VALUES
(1, ' Bom dia!', 'https://br.pinterest.com/pin/1407443629356036/'),
(2, 'Olá a todos 🌟', 'https://br.pinterest.com/pin/1407443629356036/'),
(3, 'Como estão? 💖', 'https://br.pinterest.com/pin/1407443629356036/'),
(4, 'Vamos arrasar hoje! 💁‍♀️', 'https://br.pinterest.com/pin/1407443629356036/'),
(5, 'Amo essa vibe! ✨', 'https://br.pinterest.com/pin/1407443629356036/');
