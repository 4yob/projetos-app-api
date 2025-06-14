const pool = require("../config/database");

// Buscar todas as notificações
// Retorna todas as notificações ordenadas pela data de criação
const getNotifications = async () => {
    try {
        const result = await pool.query("SELECT * FROM notifications ORDER BY created_at DESC");
        console.log("Notificações retornadas do banco de dados:", result.rows); // Log para depuração
        return result.rows;
    } catch (error) {
        console.error("Erro ao buscar notificações:", error);
        throw new Error("Erro ao buscar notificações no banco de dados.");
    }
};

// Buscar uma notificação por ID
// Retorna uma notificação específica com base no ID fornecido
const getNotificationById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM notifications WHERE id = $1", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Erro ao buscar notificação com ID ${id}:`, error);
        throw error;
    }
};

// Criar uma nova notificação
// Insere uma nova notificação no banco de dados
const createNotification = async (user_id, message, post_id, chat_id) => {
    if (user_id === null || user_id === undefined) {
        throw new Error("user_id não pode ser null ou undefined.");
    }
    if (chat_id === null || chat_id === undefined) {
        throw new Error("chat_id não pode ser null ou undefined.");
    }
    // post_id pode ser null
    try {
        const result = await pool.query(
            "INSERT INTO notifications (user_id, message, post_id, chat_id, created_at) VALUES ($1, $2, $3, $4, NOW()) RETURNING *",
            [user_id, message, post_id || null, chat_id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Erro ao criar notificação:", error);
        throw new Error("Erro ao criar notificação no banco de dados.");
    }
};

// Atualizar uma notificação existente
// Atualiza os dados de uma notificação com base no ID fornecido
const updateNotification = async (id, message, post_id) => {
    try {
        const result = await pool.query(
            "UPDATE notifications SET message = $1, post_id = $2 WHERE id = $3 RETURNING *",
            [message, post_id, id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Erro ao atualizar notificação:", error);
        throw error;
    }
};

// Deletar uma notificação
// Remove uma notificação do banco de dados com base no ID fornecido
const deleteNotification = async (id) => {
    try {
        const result = await pool.query("DELETE FROM notifications WHERE id = $1 RETURNING *", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Erro ao deletar notificação com ID ${id}:`, error);
        throw new Error("Erro ao deletar notificação no banco de dados.");
    }
};

// Ganhar uma notificação
// Insere uma notificação no banco de dados com base em parâmetros específicos
const ganharNotificacao = async (user_id, message, post_id, chat_id) => {
    if (user_id === null || user_id === undefined) {
        throw new Error("user_id não pode ser null ou undefined.");
    }
    if (chat_id === null || chat_id === undefined) {
        throw new Error("chat_id não pode ser null ou undefined.");
    }
    try {
        const result = await pool.query(
            "INSERT INTO notifications (user_id, message, post_id, chat_id, created_at) VALUES ($1, $2, $3, $4, NOW()) RETURNING *",
            [user_id, message, post_id, chat_id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Erro ao ganhar notificação:", error);
        throw new Error("Erro ao ganhar notificação no banco de dados.");
    }
};

module.exports = {
    // Exporta todas as funções para serem usadas em outros módulos
    getNotifications,
    getNotificationById,
    createNotification,
    updateNotification,
    deleteNotification,
    ganharNotificacao
};