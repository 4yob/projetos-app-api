const pool = require("../config/database");

// Buscar todas as notificações
const getNotificacoes = async () => {
    try {
        const result = await pool.query("SELECT * FROM notificacoes ORDER BY created_at DESC");
        return result.rows;
    } catch (error) {
        console.error("Erro ao buscar notificações:", error);
        throw new Error("Erro ao buscar notificações no banco de dados.");
    }
};

// Buscar uma notificação por ID
const getNotificacaoById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM notificacoes WHERE id = $1", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Erro ao buscar notificação com ID ${id}:`, error);
        throw error;
    }
};

// Criar uma nova notificação
const createNotificacao = async (user_id, mensagem) => {
    try {
        const result = await pool.query(
            "INSERT INTO notificacoes (user_id, mensagem, created_at) VALUES ($1, $2, NOW()) RETURNING *",
            [user_id, mensagem]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Erro ao criar notificação:", error);
        throw new Error("Erro ao criar notificação no banco de dados.");
    }
};

// Atualizar uma notificação existente
const updateNotificacao = async (id, mensagem) => {
    try {
        const result = await pool.query(
            "UPDATE notificacoes SET mensagem = $1 WHERE id = $2 RETURNING *",
            [mensagem, id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Erro ao atualizar notificação:", error);
        throw error;
    }
};

// Deletar uma notificação
const deleteNotificacao = async (id) => {
    try {
        const result = await pool.query("DELETE FROM notificacoes WHERE id = $1 RETURNING *", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Erro ao deletar notificação com ID ${id}:`, error);
        throw new Error("Erro ao deletar notificação no banco de dados.");
    }
};

module.exports = {
    getNotificacoes,
    getNotificacaoById,
    createNotificacao,
    updateNotificacao,
    deleteNotificacao
};