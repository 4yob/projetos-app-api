// Importa o modelo de posts
const postModel = require("../models/postModel");

// Controlador para buscar todos os posts
const getPosts = async (req, res) => {
  try {
    let categories = req.query.categorie_id; // Obtém categorias da query string
    if (categories) {
      categories = categories.toString().split(',').map(Number).filter(Boolean); // Converte para array de números
    }
    const posts = await postModel.getPosts(categories); // Busca os posts
    res.status(200).json(posts); // Retorna os posts
  } catch (error) {
    console.error(error);
    res.status(400).json({ message: "Error fetching posts." });
  }
};

// Controlador para buscar um post específico pelo ID
const getPostById = async (req, res) => {
  try {
    const post = await postModel.getPostById(req.params.id); // Busca o post pelo ID
    if (!post) {
      res.status(404).json({ message: "Post not found." });
    }
    res.status(200).json({ message: "Post retrieved successfully.", post });
  } catch (error) {
    console.error(error);
    res.status(404).json({ message: "Error fetching post." });
  }
};

// Controlador para criar um novo post
const createPost = async (req, res) => {
  try {
    const { user_id, categorie_id, content } = req.body;

    // Valida os campos obrigatórios
    if (!user_id || !categorie_id || !content) {
      return res
        .status(400)
        .json({ message: "Required fields not provided." });
    }

    const photo = req.file ? req.file.filename : null; // Obtém o nome do arquivo da foto, se fornecido
    const newPost = await postModel.createPost(user_id, categorie_id, content, photo); // Cria o post
    res.status(201).json(newPost); // Retorna o post criado
  } catch (error) {
    console.error(error);
    if (error.code === "23505") {
      return res.status(409).json({ message: "Post already exists!" });
    }
    res.status(500).json({ message: "Error creating a new post." });
  }
};

// Controlador para atualizar um post existente
const updatePost = async (req, res) => {
  try {
    const { content } = req.body; // Obtém o conteúdo do corpo da requisição
    const updatePost = await postModel.updatePost(req.params.id, content); // Atualiza o post
    if (!updatePost) {
      return res.status(404).json({ message: "Post not found." });
    }
    res.json({ message: "Post updated successfully.", updatePost });
  } catch (error) {
    res.status(500).json({ message: "Error updating post." });
  }
};

// Controlador para deletar um post específico pelo ID
const deletePost = async (req, res) => {
  try {
    const { id } = req.params; // Obtém o ID do post
    const deletedPost = await postModel.deletePost(id); // Deleta o post
    if (!deletedPost) {
      return res.status(404).json({ message: "Post not found." });
    }
    res.json({ message: "Post deleted successfully.", deletedPost });
  } catch (error) {
    res.status(500).json({ message: "Error deleting post." });
  }
};

// Controlador para buscar os likes de um post
const getLikes = async (req, res) => {
  try {
    const postId = req.params.id; // Obtém o ID do post
    const post = await postModel.getPostById(postId); // Busca o post
    if (!post) {
      return res.status(404).json({ message: "Post not found." });
    }
    res
      .status(200)
      .json({ message: "Likes retrieved successfully.", likes: post.likes });
  } catch (error) {
    console.error("Error retrieving Likes:", error);
    res.status(500).json({ message: "Error retrieving Likes." });
  }
};

// Controlador para atualizar os likes de um post
const updateLikes = async (req, res) => {
  try {
    const { id } = req.params; // Obtém o ID do post
    const { action } = req.body; // Obtém a ação (like ou remove like)
    if (!["like", "remove like"].includes(action)) {
      return res
        .status(400)
        .json({ message: "Invalid action. Use 'remove like' or 'like'." });
    }

    const updatedPost = await postModel.updateLikes(id, action); // Atualiza os likes
    if (!updatedPost) {
      return res
        .status(404)
        .json({ message: "Post not found or invalid operation." });
    }

    res.status(200).json({
      message: "Likes updated successfully.",
      likes: updatedPost.likes, // Retorna os likes atualizados
    });
  } catch (error) {
    console.error("Error updating likes:", error);
    res.status(500).json({ message: "Error updating likes." });
  }
};

// Exporta os controladores
module.exports = {
  getPosts,
  getPostById,
  createPost,
  updatePost,
  deletePost,
  getLikes,
  updateLikes
};
