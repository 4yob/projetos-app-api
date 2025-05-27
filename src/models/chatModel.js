const pool = require("../config/database");

const getChats = async (userName) => {
    try {
      const result = await pool.query(
        `SELECT chats.*, users.username AS user_name
         FROM chats 
         JOIN users ON chats.user_id = users.id 
         WHERE users.username = $1`,
        [userName]	
      );
        return result.rows;
    } catch (error) {
        console.error("Error fetching all chats:", error);
        throw new Error("Error retrieving chats from the database.");
    }
};

const getChatById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM chats WHERE id = $1", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Error fetching chat with ID ${id}:`, error);
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
        console.error("Error creating chat:", error);
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
        console.error("Error updating chat:", error);
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