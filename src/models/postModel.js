// Post Models

const pool = require("../config/database");

// Função para obter todos os posts
const getAllPosts = async () => {
    try {
        const result = await pool.query("SELECT * FROM posts");
        return result.rows;
    } catch (error) {
        console.error("Erro ao obter todos os posts:", error);
        throw new Error("Erro ao buscar posts no banco de dados.");
    }
};

// Função para obter um post específico pelo ID
const getPostById = async (id) => {
    try {
        if (isNaN(id)) {
            throw new Error("ID inválido.");
        }
        const result = await pool.query("SELECT * FROM posts WHERE id = $1", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Erro ao obter o post com ID ${id}:`, error);
        throw new Error("Erro ao buscar o post no banco de dados.");
    }
};

// Função para criar um novo post
const createPost = async (title, content, userId) => {
    try {
        const result = await pool.query(
            "INSERT INTO posts (title, content, user_id) VALUES ($1, $2, $3) RETURNING *",
            [title, content, userId]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Erro ao criar o post:", error);
        throw new Error("Erro ao criar o post no banco de dados.");
    }
};

module.exports = { getAllPosts, getPostById, createPost };