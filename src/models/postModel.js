// Post Models

const pool = require("../config/database");

// Function to fetch all posts
const getPosts = async (categoria) => {
    try {
        const query = categoria
            ? "SELECT * FROM posts WHERE categoria ILIKE $1"
            : "SELECT * FROM posts";

        const values = categoria ? [`%${categoria}%`] : []; // Adicionado o uso de %

        const result = await pool.query(query, values);
        return result.rows;
    } catch (error) {
        console.error("Error fetching posts:", error);
        throw new Error("Error retrieving posts from the database.");
    }
};


// Function to fetch a specific post by ID
const getPostById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM posts WHERE id = $1", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Error fetching post with ID ${id}:`, error);
        throw error;
    }
};

// Function to create a new post
const createPost = async (title, content, user_id, photo) => {
    try {
        const result = await pool.query(
            "INSERT INTO posts (title, content, user_id, photo, created_at) VALUES ($1, $2, $3, $4, NOW()) RETURNING *",
            [title, content, user_id, photo]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error creating post:", error);
        throw new Error("Error creating the post in the database.");
    }
};

// Function to update an existing post
const updatePost = async (id, title, content) => {
    try {
        const result = await pool.query(
            "UPDATE posts SET title = $1, content = $2 WHERE id = $3 RETURNING *",
            [title, content, id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error updating post:", error);
        throw error;
    }
};

// Function to delete an existing post
const deletePost = async (id) => {
    try {
        const result = await pool.query("DELETE FROM posts WHERE id = $1 RETURNING *", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Error deleting post with ID ${id}:`, error);
        throw new Error("Error deleting the post from the database.");
    }
};

// Function to delete all posts
const deleteAllPosts = async () => {
    try {
        await pool.query("DELETE FROM posts");
    } catch (error) {
        console.error("Error deleting all posts:", error);
        throw new Error("Error deleting all posts from the database.");
    }
};

const updateLikes = async (id, action) => {
    try {
        const increment = action === "like" ? 1 : -1;
        const result = await pool.query(
            "UPDATE post SET likes = likes + $1 WHERE id = $2 AND likes + $1 >= 0 RETURNING *",
            [increment, id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error updating likes in database:", error);
        throw error;
    }
};

// Exporting functions to be used in other files
module.exports = { getPosts, getPostById, createPost, updatePost, deletePost, deleteAllPosts, updateLikes };