/* Banco de Dados */

CREATE DATABASE glamsync;
\c glamsync;

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
VALUES 
    ('Alice Johnson', 'alicej', 'alice@example.com', 'New York', 'https://example.com/photos/alice.jpg', 10, 50),
    ('Bob Smith', 'bobsmith', 'bob@example.com', 'Los Angeles', 'https://example.com/photos/bob.jpg', 20, 100),
    ('Charlie Brown', 'charlieb', 'charlie@example.com', 'Chicago', 'https://example.com/photos/charlie.jpg', 15, 75),
    ('Diana Prince', 'dianap', 'diana@example.com', 'San Francisco', 'https://example.com/photos/diana.jpg', 30, 200),
    ('Ethan Hunt', 'ethanh', 'ethan@example.com', 'Miami', 'https://example.com/photos/ethan.jpg', 25, 150);


    -- Insert more sample data into users table
    INSERT INTO users (name, username, email, location, photo, following, followers) 
    VALUES 
        ('Fiona Gallagher', 'fionag', 'fiona@example.com', 'Boston', 'https://example.com/photos/fiona.jpg', 12, 60),
        ('George Miller', 'georgem', 'george@example.com', 'Seattle', 'https://example.com/photos/george.jpg', 18, 80),
        ('Hannah Lee', 'hannahl', 'hannah@example.com', 'Austin', 'https://example.com/photos/hannah.jpg', 22, 110),
        ('Ian Wright', 'ianw', 'ian@example.com', 'Denver', 'https://example.com/photos/ian.jpg', 14, 70),
        ('Julia Roberts', 'juliar', 'julia@example.com', 'Atlanta', 'https://example.com/photos/julia.jpg', 28, 140);