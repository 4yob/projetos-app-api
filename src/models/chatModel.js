const pool = require("../config/database");

const getChats = async () => {
    try {
        const result = await pool.query("SELECT * FROM chats");
        return result.rows;
    } catch (error) {
        console.error("Erro ao obter todos os chats:", error);
        throw new Error("Erro ao buscar chats no banco de dados.");
    }
};

const getChatById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM chats WHERE id = $1", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Erro ao obter chat com ID ${id}:`, error);
        throw error;
    }
};

const createChat = async (user_id, message) => {
    try {
        const result = await pool.query(
            "INSERT INTO chats (user_id, message) VALUES ($1, $2) RETURNING *",
            [user_id, message]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Erro ao criar chat:", error);
        throw error;
    }
};

const updateChat = async (id, message) => {
    try {
        const result = await pool.query(
            "UPDATE chats SET message = $1 WHERE id = $2 RETURNING *",
            [message, id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Erro ao atualizar chat:", error);
        throw error;
    }
};

const deleteChat = async (id) => {
    try {
        const result = await pool.query(
            "DELETE FROM chats WHERE id = $1 RETURNING *",
            [id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Erro ao deletar chat:", error);
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