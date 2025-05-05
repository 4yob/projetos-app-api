const postModel = require("../models/postModel");

//Controller para obter todos os posts
const getPosts = async (req, res) => {
    try {
        const posts = await postModel.getPosts();
        res.status(200).json(posts)
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Erro ao buscar Posts" })
    }
};

//Controller para obter um post específico pelo ID
const getPostById = async (req, res) => {
    try {
        const post = await postModel.getPostById(req.params.id);
        if (!post) {
            res.status(404).json({ message: "Post não encontrado" });
        }
        res.status(200).json({message: "Post obtido com sucesso.", post});
    } catch (error) {
        console.error(error)
        res.status(404).json({ message: "Erro ao buscar post" })
    }
};

//Controller para criar um novo post
const createPost = async (req, res) => {
    try {
        const { user_id, title, content } = req.body;

        // Validação dos campos obrigatórios
        if (!user_id || !title || !content) {
            return res.status(400).json({ message: "Campos obrigatórios não fornecidos." });
        }

        const photo = req.file ? req.file.filename : null;
        const newPost = await postModel.createPost(title, content, user_id, photo);
        res.status(201).json(newPost);
    } catch (error) {
        console.error(error);
        if (error.code === "23505") {
            return res.status(409).json({ message: "Post já cadastrado!!" });
        }
        console.log(req.body);
        res.status(500).json({ message: "Erro ao criar um novo Post" });
    }
};

//Controller para atualizar um post existente
const updatePost = async (req, res) => {
    try {
        const { title, content } = req.body;
        const updatePost = await postModel.updatePost(req.params.id, title, content);
        if (!updatePost) {
            return res.status(404).json({ message: "Post não encontrado." });
        }
        res.json({ message: "Post atualizado com sucesso.", updatePost });
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

//Controller para deletar um post específico pelo ID
const deletePostById = async (req, res) => {
    try {
        const postId = req.params.id;
        const deletedPost = await postModel.deletePostById(postId);
        if (!deletedPost) {
            return res.status(404).json({ message: "Post não encontrado." });
        }
        res.json({ message: "Post deletado com sucesso.", deletedPost });
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar post por ID" });
    }
};

//Controller para curtir um post
const likePost = async (req, res) => {
    try {
        const { postId } = req.params;
        const { userId } = req.body;
        const likedPost = await postModel.likePost(postId, userId);
        if (!likedPost) {
            return res.status(404).json({ message: "Post não encontrado." });
        }
        res.json({ message: "Post curtido com sucesso.", likedPost });
    } catch (error) {
        res.status(500).json({ message: "Erro ao curtir post." });
    }
};


//Exportação dos controllers
module.exports = {getPosts, getPostById, createPost, updatePost, deletePost, deletePostById, likePost};