CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
    text_comment VARCHAR(350),
    date_comment TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO comments (user_id, post_id, text_comment) 
VALUES 
    (1, 101, 'Ótimo post! Muito informativo.'),
    (2, 102, 'Concordo com o que foi dito.'),
    (3, 101, 'Tenho uma dúvida sobre o conteúdo.'),
    (1, 103, 'Parabéns pelo trabalho!');



