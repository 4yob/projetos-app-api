// Importa o pool de conexão com o banco de dados
const pool = require("../config/database");

// Função para buscar todos os posts, com filtro opcional por categorias
const getPosts = async (categories) => {
    try {
        let query = `
            SELECT posts.*, users.username AS user_name, users.photo AS user_photo 
            FROM posts
            JOIN users ON posts.user_id = users.id
        `;
        let params = [];

        // Adiciona filtro por categorias, se fornecido
        if (categories && Array.isArray(categories) && categories.length > 0) {
            const placeholders = categories.map((_, idx) => `$${idx + 1}`).join(", ");
            query += ` WHERE posts.categorie_id IN (${placeholders})`;
            params = categories;
        }

        query = query.replace(/\s+/g, ' ').trim(); // Remove espaços extras

        const result = await pool.query(query, params); // Executa a consulta
        return result.rows; // Retorna os resultados
    } catch (error) {
        console.error("Error fetching posts:", error);
        throw new Error("Error retrieving posts from the database.");
    }
};

// Função para buscar um post específico pelo ID
const getPostById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM posts WHERE id = $1", [id]);
        return result.rows[0]; // Retorna o post encontrado
    } catch (error) {
        console.error(`Error fetching post with ID ${id}:`, error);
        throw error;
    }
};

// Função para criar um novo post
const createPost = async (user_id, categorie_id, content, photo) => {
    try {
        const result = await pool.query(
            "INSERT INTO posts (user_id, categorie_id, content, photo, created_at) VALUES ($1, $2, $3, $4, NOW()) RETURNING *",
            [user_id, categorie_id, content, photo]
        );
        return result.rows[0]; // Retorna o post criado
    } catch (error) {
        console.error("Error creating post:", error);
        throw new Error("Error creating the post in the database.");
    }
};

// Função para atualizar o conteúdo de um post existente
const updatePost = async (id, content) => {
    try {
        const result = await pool.query(
            "UPDATE posts SET content = $1 WHERE id = $2 RETURNING *",
            [content, id]
        );
        return result.rows[0]; // Retorna o post atualizado
    } catch (error) {
        console.error("Error updating post:", error);
        throw error;
    }
};

// Função para deletar um post específico pelo ID
const deletePost = async (id) => {
    try {
        const result = await pool.query("DELETE FROM posts WHERE id = $1 RETURNING *", [id]);
        return result.rows[0]; // Retorna o post deletado
    } catch (error) {
        console.error(`Error deleting post with ID ${id}:`, error);
        throw new Error("Error deleting the post from the database.");
    }
};

// Função para deletar todos os posts
const deleteAllPosts = async () => {
    try {
        await pool.query("DELETE FROM posts"); // Deleta todos os posts
    } catch (error) {
        console.error("Error deleting all posts:", error);
        throw new Error("Error deleting all posts from the database.");
    }
};

// Função para atualizar os likes de um post (incrementar ou decrementar)
const updateLikes = async (id, action) => {
    try {
        const increment = action === "like" ? 1 : -1; // Define o incremento com base na ação
        const result = await pool.query(
            "UPDATE posts SET likes = likes + $1 WHERE id = $2 AND likes + $1 >= 0 RETURNING *",
            [increment, id]
        );
        return result.rows[0]; // Retorna o post atualizado
    } catch (error) {
        console.error("Error updating likes in database:", error);
        throw error;
    }
};

// Exporta as funções para serem usadas em outros arquivos
module.exports = { getPosts, getPostById, createPost, updatePost, deletePost, deleteAllPosts, updateLikes };