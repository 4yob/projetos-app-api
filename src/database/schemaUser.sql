/*Banco de Dados*/

CREATE DATABASE glamSync;
\c glamSync;

-- Create a table for users
CREATE TABLE users (
    id_users SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    location VARCHAR(100),
    photo TEXT,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

 following, followers