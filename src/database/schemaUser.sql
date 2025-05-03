/*Banco de Dados*/

CREATE DATABASE glamSync;
\c glamSync;

-- Create a table for users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    location VARCHAR(100),
    photo TEXT,
    following INT DEFAULT 0,
    followers INT DEFAULT 0,
    created_user TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data into users table
INSERT INTO users (name, username, email, location, photo, following, followers) 
VALUES ('Alice Johnson', 'alicej', 'alice@example.com', 'New York', 'https://example.com/photos/alice.jpg', 10, 50);

INSERT INTO users (name, username, email, location, photo, following, followers) 
VALUES ('Bob Smith', 'bobsmith', 'bob@example.com', 'Los Angeles', 'https://example.com/photos/bob.jpg', 20, 100);

INSERT INTO users (name, username, email, location, photo, following, followers) 
VALUES ('Charlie Brown', 'charlieb', 'charlie@example.com', 'Chicago', 'https://example.com/photos/charlie.jpg', 15, 75);

INSERT INTO users (name, username, email, location, photo, following, followers) 
VALUES ('Diana Prince', 'dianap', 'diana@example.com', 'San Francisco', 'https://example.com/photos/diana.jpg', 30, 200);

INSERT INTO users (name, username, email, location, photo, following, followers) 
VALUES ('Ethan Hunt', 'ethanh', 'ethan@example.com', 'Miami', 'https://example.com/photos/ethan.jpg', 25, 150);
