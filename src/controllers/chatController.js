const chatModel = require("../models/chatModel");

// Controlador para obter todos os chats ou filtrar por nome de usuário
const getChats = async (req, res) => {
    try {
        const { userName } = req.query; // userName agora é opcional

        const chats = await chatModel.getChats(userName); // Busca todos se não houver userName
        res.status(200).json({ message: "Messages retrieved successfully.", chats });
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Error retrieving messages." });
    }
};

// Controlador para obter um chat específico pelo ID
const getChatById = async (req, res) => {
    try {
        const chat = await chatModel.getChatById(req.params.id);
        if (!chat) {
            return res.status(404).json({ message: "Message not found." });
        }
        res.status(200).json({ message: "Message retrieved successfully.", chat });
    } catch (error) {
        console.error(error);
        res.status(404).json({ message: "Error retrieving message." });
    }
}

// Controlador para criar um novo chat
const createChat = async (req, res) => {
    try {
        const { user_id, message } = req.body;

        // Validação dos campos obrigatórios
        if (!user_id || !message) {
            return res.status(400).json({ message: "Required fields not provided." });
        }

        const newChat = await chatModel.createChat(user_id, message);
        res.status(201).json({ message: "Message created successfully.", newChat });
    } catch (error) {
        console.error(error);
        if (error.code === "23505") {
            return res.status(400).json({ message: "Chat already registered!" });
        }
        console.log(req.body);
        res.status(500).json({ message: "Error creating a new chat." });
    }
};

// Controlador para atualizar a mensagem de um chat existente
const updateChat = async (req, res) => {
    try {
        const { message } = req.body;
        const updatedChat = await chatModel.updateChat(req.params.id, message);
        if (!updatedChat) {
            return res.status(404).json({ message: "Message not found." });
        }
        res.status(200).json({ message: "Message updated successfully.", updatedChat });
    } catch (error) {
        res.status(500).json({ message: "Error updating message." });
    }
};

// Controlador para excluir um chat pelo ID
const deleteChat = async (req, res) => {
    try {
        const { id } = req.params;
        const deletedChat = await chatModel.deleteChat(id);
        if (!deletedChat) {
            return res.status(404).json({ message: "Message not found." });
        }
        res.status(200).json({ message: "Message deleted successfully.", deletedChat });
    } catch (error) {
        res.status(500).json({ message: "Error deleting message." });
    }
};

module.exports = { getChats, getChatById, createChat, updateChat, deleteChat };