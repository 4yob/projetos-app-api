// Importa o modelo de comentários
const commentsModel = require("../models/commentsModel");

// Obtém todos os comentários, com filtro opcional por nome de usuário
const getComments = async (req, res) => {
    try {
        const { username } = req.query;
        const comments = await commentsModel.getComments(username);
        res.status(200).json({ message: "Comments retrieved successfully.", comments });
    } catch (error) {
        console.error("Error fetching comments:", error);
        res.status(500).json({ error: "Failed to retrieve comments." });
    }
};

// Obtém um comentário específico pelo ID
const getCommentById = async (req, res) => {
    try {
        const { id } = req.params;
        if (!id || isNaN(Number(id))) {
            return res.status(400).json({ message: "Invalid comment id." });
        }
        const comment = await commentsModel.getCommentById(id);
        if (!comment) {
            return res.status(404).json({ message: "Comment not found." });
        }
        res.status(200).json({ message: "Comment retrieved successfully.", comment });
    } catch (error) {
        console.error("Error fetching comment by ID:", error);
        res.status(500).json({ error: "Failed to retrieve comment." });
    }
};

// Cria um novo comentário
const createComment = async (req, res) => {
    try {
        const { user_id, post_id, text_comment } = req.body;
        const newComment = await commentsModel.createComment(user_id, post_id, text_comment);
        res.status(201).json({ message: "Comment created successfully.", newComment });
    } catch (error) {
        if (error.code === "23505") {
            return res.status(400).json({ message: "Comment already exists." });
        }
        res.status(500).json({ error: "Failed to create comment." });
    }
};

// Atualiza o texto de um comentário existente pelo ID
const updateComment = async (req, res) => {
    try {
        const { text_comment } = req.body;
        const updatedComment = await commentsModel.updateComment(req.params.id, text_comment);
        if (!updatedComment) {
            return res.status(404).json({ message: "Comment not found." });
        }
        res.status(200).json({ message: "Comment updated successfully.", updatedComment });
    } catch (error) {
        res.status(500).json({ error: "Failed to update comment." });
    }
};

// Deleta um comentário pelo ID
const deleteComment = async (req, res) => {
    try {
        const message = await commentsModel.deleteComment(req.params.id);
        res.status(200).json({ message: "Comment deleted successfully.", details: message });
    } catch (error) {
        res.status(500).json({ error: "Failed to delete comment." });
    }
};

// Obtém todos os comentários de um post específico pelo ID do post
const getCommentsByPostId = async (req, res) => {
    try {
        const { post_id } = req.params;
        if (!post_id || isNaN(Number(post_id))) {
            return res.status(400).json({ message: "Invalid post id." });
        }
        const comments = await commentsModel.getCommentsByPostId(post_id);
        res.status(200).json({ message: "Comments retrieved successfully.", comments });
    } catch (error) {
        console.error("Error fetching comments by post ID:", error);
        res.status(500).json({ error: "Failed to retrieve comments." });
    }
};

// Conta o número de comentários de um post específico pelo ID do post
const getCountCommentsByPostId = async (req, res) => {
    try {
        const { post_id } = req.params;
        if (!post_id || isNaN(Number(post_id))) {
            return res.status(400).json({ message: "Invalid post id." });
        }
        const count = await commentsModel.getCountCommentsByPostId(post_id);
        res.status(200).json({ message: "Comment count retrieved successfully.", count });
    } catch (error) {
        console.error("Error counting comments by post ID:", error);
        throw new Error("Failed to count comments.");
    }
};

// Exporta as funções do controlador
module.exports = {
    getComments,
    getCommentById,
    createComment,
    updateComment,
    deleteComment,
    getCommentsByPostId,
    getCountCommentsByPostId
};