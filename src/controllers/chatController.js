const chatModel = require("../models/chatModel");

const getChats = async (req, res) => {
    try {
        const chats = await chatModel.getChats();
        res.status(201).json({ message: "Mensagens obtidas com sucesso.", chats });
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Erro ao buscar mensagens" });
    }
};

const getChatById = async (req, res) => {
    try {
        const chat = await chatModel.getChatById(req.params.id);
        if (!chat) {
            return res.status(404).json({ message: "Mensagem não encontrada." });
        }
        res.status(200).json({ message: "Mensagem obtida com sucesso.", chat });
    } catch (error) {
        console.error(error);
        res.status(404).json({ message: "Erro ao buscar mensagem" });
    }
}

const createChat = async (req, res) => {
    try {
        const { user_id, message } = req.body;

        // Validação dos campos obrigatórios
        if (!user_id || !message) {
            return res.status(400).json({ message: "Campos obrigatórios não fornecidos." });
        }

        const newChat = await chatModel.createChat(user_id, message);
        res.status(201).json({ message: "Mensagem criada com sucesso.", newChat });
    } catch (error) {
        console.error(error);
        if (error.code === "23505") {
            return res.status(400).json({ message: "Chat já cadastrado!" });
        }
        console.log(req.body);
        res.status(500).json({ message: "Erro ao criar um novo chat" });
    }
};

const updateChat = async (req, res) => {
    try {
        const { message } = req.body;
        const updatedChat = await chatModel.updateChat(req.params.id, message);
        if (!updatedChat) {
            return res.status(404).json({ message: "Mensagem não encontrada." });
        }
        res.status(200).json({ message: "Mensagem atualizada com sucesso.", updatedChat });
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar mensagem." });
    }
};


const deleteChat = async (req, res) => {
    try {
        const { id } = req.params;
        const deletedChat = await chatModel.deleteChat(id);
        if (!deletedChat) {
            return res.status(404).json({ message: "Mensagem não encontrada." });
        }
        res.status(200).json({ message: "Mensagem deletada com sucesso.", deletedChat });
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar mensagem." });
    }
};

module.exports = { getChats, getChatById, createChat, updateChat, deleteChat };