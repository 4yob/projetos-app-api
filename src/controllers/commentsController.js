const commentsModel = require('../models/commentsModel');

const getComments = async (req, res) => {
    try {
        const comments = await commentsModel.getComments();
        res.status(200).json(comments);
    } catch (error) {
        res.status(500).json({ error: 'Failed to retrieve comments' });
    }
};

const getCommentById = async (req, res) => {
    try {
        const commemt = await commentsModel.getCommentById(req.params.id);
        if (!commemt) {
            return res.status(404).json({ error: 'Comment not found' });
        }
        res.status(200).json(commemt);
    } catch (error) {
        res.status(500).json({ error: 'Failed to retrieve comment' });        
    }
};

const createComment = async (req, res) => {
    try {
        const { user_id, post_id, text_comment } = req.body;
        const newComment = await commentsModel.createComment(user_id, post_id, text_comment);
        res.status(201).json(newComment);
    } catch (error) {
        if (error.code === "23505") {
            return res.status(400).json({ message: "Comentário cadastrado" });
          }
        res.status(500).json({ error: 'Failed to create comment' });
    }
};

const updateComment = async (req, res) => {
    try {
        const { text_comment } = req.body;
        const updatedComment = await commentsModel.updateComment(req.params.id, text_comment);
        if (!updatedComment) {
            return res.status(404).json({ error: 'Comment not found' });
        }
        res.status(200).json(updatedComment);
    } catch (error) {
        res.status(500).json({ error: 'Failed to update comment' });
    }
}

const deleteComment = async (req, res) => {
    try {
        const message = await commentsModel.deleteComment(req.params.id);
        res.json(message);
    } catch (error) {        
        res.status(500).json({ error: 'Failed to delete comment' });
    }
}

module.exports = {
    getComments,
    getCommentById,
    createComment,
    updateComment,
    deleteComment
};