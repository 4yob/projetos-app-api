const pool = require("../config/database");

// Obtém todos os chats ou filtra por nome de usuário, se fornecido
const getChats = async (userName) => {
    try {
        let result;
        if (userName) {
            result = await pool.query(
                `SELECT chats.*, users.username AS user_name, users.photo AS user_photo 
                 FROM chats 
                 JOIN users ON chats.user_id = users.id 
                 WHERE users.username = $1`,
                [userName]
            );
        } else {
            result = await pool.query(
                `SELECT chats.*, users.username AS user_name, users.photo AS user_photo 
                 FROM chats 
                 JOIN users ON chats.user_id = users.id`
            );
        }
        return result.rows;
    } catch (error) {
        console.error("Error fetching all chats:", error);
        throw new Error("Error retrieving chats from the database.");
    }
};

// Obtém um chat específico pelo ID
const getChatById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM chats WHERE id = $1", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Error fetching chat with ID ${id}:`, error);
        throw error;
    }
};

// Cria um novo chat com o ID do usuário e a mensagem fornecida
const createChat = async (user_id, message) => {
    try {
        const result = await pool.query(
            "INSERT INTO chats (user_id, message) VALUES ($1, $2) RETURNING *",
            [user_id, message]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error creating chat:", error);
        throw error;
    }
};

// Atualiza a mensagem de um chat existente pelo ID
const updateChat = async (id, message) => {
    try {
        const result = await pool.query(
            "UPDATE chats SET message = $1 WHERE id = $2 RETURNING *",
            [message, id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error updating chat:", error);
        throw error;
    }
};

// Exclui um chat pelo ID
const deleteChat = async (id) => {
    try {
        const result = await pool.query(
            "DELETE FROM chats WHERE id = $1 RETURNING *",
            [id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error deleting chat:", error);
        throw error;
    }
};

module.exports = {
    getChats,
    getChatById,
    createChat,
    updateChat,
    deleteChat
};