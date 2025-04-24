const postModel = require("../models/postModel");

//Controller para obter um post específico pelo ID
const getPost = async (req, res) => {
    try {
        const post = await postModel.getPostById(req.params.id);
        if (!post) {
            return res.status(404).json({ message: "Post não encontrado." });
        }
        res.json({ message: "Post obtido com sucesso.", post });
    }
    catch (error) 
    { res.status(500).json({ message: "Erro ao buscar post." }); }
};

//Controller para obter todos os posts
const getAllPosts = async (req, res) => {
    try {
        const posts = await postModel.getAllPosts();
        if (!posts || posts.length === 0) {
            return res.status(404).json({ message: "Nenhum post encontrado." });
        }
        res.json({ message: "Todos os Posts abaixo!!", posts });
    }
    catch (error) 
    { res.status(500).json({ message: "Erro ao buscar posts." }); }
};

//Controller para criar um novo post
const createPost = async (req, res) => {
    try {
        const { user_id, title, content } = req.body;
        const newPost = await postModel.createPost(user_id, title, content);
        res.status(201).json({ message: "Post criado com sucesso.", newPost });
    } catch (error) {
        if (error.code === "23505") {
            return res.status(404).json({ message: "Post já existe." });
        }
        res.status(404).json({ message: "Erro ao criar post." });
    }
};

//Controller para atualizar um post existente
const updatePost = async (req, res) => {
    try {
        const { id } = req.params;
        const { title, content } = req.body;
        const updatedPost = await postModel.updatePost(id, title, content);
        if (!updatedPost) {
            return res.status(404).json({ message: "Post não encontrado." });
        }
        res.json({ message: "Post atualizado com sucesso.", updatedPost });
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar post." });
    }
};

//Controller para deletar um post existente
const deletePost = async (req, res) => {
    try {
        const { id } = req.params;
        const deletedPost = await postModel.deletePost(id);
        if (!deletedPost) {
            return res.status(404).json({ message: "Post não encontrado." });
        }
        res.json({ message: "Post deletado com sucesso.", deletedPost });
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar post." });
    }
};


//Exportação dos controllers
module.exports = {getPost, getAllPosts, createPost, updatePost, deletePost, deletePostById, likePost};