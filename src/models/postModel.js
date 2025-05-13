// Post Models

const pool = require("../config/database");

// Função para obter todos os posts
const getPosts = async () => {
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
        const result = await pool.query("SELECT * FROM posts WHERE id = $1", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Erro ao buscar o post com ID ${id}:`, error); // mantém o erro original
        throw error;
    }
};

// Função para criar um novo post
const createPost = async (title, content, user_id, photo) => {
    try {
        const result = await pool.query(
            "INSERT INTO posts (title, content, user_id, photo) VALUES ($1, $2, $3, $4) RETURNING *",
            [title, content, user_id, photo]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Erro ao criar o post:", error);
        throw new Error("Erro ao criar o post no banco de dados.");
    }
};

// Função para atualizar um post existente
const updatePost = async (id, title, content) => {
        const result = await pool.query(
            "UPDATE posts SET title = $1, content = $2 WHERE id = $3 RETURNING *",
            [title, content, id]
        );
        return result.rows[0];
};

// Função para deletar um post existente
const deletePost = async (id) => {
    try {
        const result = await pool.query("DELETE FROM posts WHERE id = $1 RETURNING *", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Erro ao deletar o post com ID ${id}:`, error);
        throw new Error("Erro ao deletar o post no banco de dados.");
    }
};

//Função para deletar todos os posts
const deleteAllPosts = async () => {
    try {
        await pool.query("DELETE FROM posts");
    } catch (error) {
        console.error("Erro ao deletar todos os posts:", error);
        throw new Error("Erro ao deletar todos os posts no banco de dados.");
    }
};

const updateLikes = async (id, action) => {
    try {
        const increment = action === "like" ? 1 : -1;
        const result = await pool.query(
            "UPDATE post SET likes = likes + $1 WHERE id = $2 AND likes + $1 >= 0 RETURNING *",
            [increment, id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error updating likes in database:", error);
        throw error;
    }
};

// Exportando as funções para serem usadas em outros arquivos
module.exports = { getPosts, getPostById, createPost, updatePost, deletePost, deleteAllPosts, updateLikes };