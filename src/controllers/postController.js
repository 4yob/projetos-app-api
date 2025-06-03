const postModel = require("../models/postModel");

//Controller to get all posts
const getPosts = async (req, res) => {
  try {
    let categories = req.query.categorie_id;
    if(categories) {
      categories = categories.toString().split(',').map(Number).filter(Boolean);
    }
    const posts = await postModel.getPosts(categories);
    res.status(200).json(posts);
  } catch (error) {
    console.error(error);
    res.status(400).json({ message: "Error fetching posts." });
  }
};

//Controller to get a specific post by ID
const getPostById = async (req, res) => {
  try {
    const post = await postModel.getPostById(req.params.id);
    if (!post) {
      res.status(404).json({ message: "Post not found." });
    }
    res.status(200).json({ message: "Post retrieved successfully.", post });
  } catch (error) {
    console.error(error);
    res.status(404).json({ message: "Error fetching post." });
  }
};

//Controller to create a new post
const createPost = async (req, res) => {
  try {
    const { user_id, categorie_id, content } = req.body;

    // Validation of required fields
    if (!user_id || !categorie_id || !content) {
      return res
        .status(400)
        .json({ message: "Required fields not provided." });
    }

    const photo = req.file ? req.file.filename : null;
    const newPost = await postModel.createPost(user_id, categorie_id, content,  photo);
    res.status(201).json(newPost);
  } catch (error) {
    console.error(error);
    if (error.code === "23505") {
      return res.status(409).json({ message: "Post already exists!" });
    }
    console.log(req.body);
    res.status(500).json({ message: "Error creating a new post." });
  }
};

//Controller to update an existing post
const updatePost = async (req, res) => {
  try {
    const { content } = req.body;
    const updatePost = await postModel.updatePost(
      req.params.id,
      content
    );
    if (!updatePost) {
      return res.status(404).json({ message: "Post not found." });
    }
    res.json({ message: "Post updated successfully.", updatePost });
  } catch (error) {
    res.status(500).json({ message: "Error updating post." });
  }
};

//Controller to delete an existing post
const deletePost = async (req, res) => {
  try {
    const { id } = req.params;
    const deletedPost = await postModel.deletePost(id);
    if (!deletedPost) {
      return res.status(404).json({ message: "Post not found." });
    }
    res.json({ message: "Post deleted successfully.", deletedPost });
  } catch (error) {
    res.status(500).json({ message: "Error deleting post." });
  }
};

//Controller to retrieve likes of a post
const getLikes = async (req, res) => {
  try {
    const postId = req.params.id;
    const post = await postModel.getPostById(postId);
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

//Controller to update likes of a post
const updateLikes = async (req, res) => {
  try {
    const { id } = req.params;
    const { action } = req.body; // 
    if (!["like", "remove like"].includes(action)) {
      return res
        .status(400)
        .json({ message: "Invalid action. Use 'remove like' or 'like'." });
    }

    const updatedPost = await postModel.updateLikes(id, action);
    if (!updatedPost) {
      return res
        .status(404)
        .json({ message: "Post not found or invalid operation." });
    }

    res.status(200).json({
      message: "Likes updated successfully.",
      likes: updatedPost.likes, // Corrected property reference
    });
  } catch (error) {
    console.error("Error updating likes:", error); // Updated error message
    res.status(500).json({ message: "Error updating likes." }); // Updated error message
  }
};

//Export controllers
module.exports = {
  getPosts,
  getPostById,
  createPost,
  updatePost,
  deletePost,
  getLikes,
  updateLikes
};
