CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
    text_comment VARCHAR(350),
    date_comment TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO comments (user_id, post_id, text_comment) 
VALUES 
    (1, 1, "Simplesmente impecável! Esse look tá um arraso 🔥"),



