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
        const { title, content } = req.body;
        console.log("Dados recebidos:", req.body); // Adicione este log
        if (!title || !content) {
            return res.status(400).json({ message: "Título e conteúdo são obrigatórios." });
        }
        const newPost = await postModel.createPost(title, content);
        res.status(201).json({ message: "Post criado com sucesso.", post: newPost });
    } catch (error) {
        console.error("Erro ao criar post:", error); // Adicione este log
        res.status(500).json({ message: "Erro ao criar post." });
    }
};

module.exports = {getPost, getAllPosts, createPost};