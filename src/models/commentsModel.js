const pool = require("../config/database");

const getComments = async (userName) => {
    try {
        const result = await pool.query(
            `´SELECT comments.*, users.username AS user_name, users.photo AS user_photo
             FROM comments
             JOIN users ON comments.user_id = users.id
             WHERE users.username = $1;`,
             [userName]
        );
        return result.rows;
    }
    catch (error) {
        console.error("Error fetching comments:", error);
        throw new Error("Error retrieving comments from the database.");
    }

};

const getCommentById = async (id) => {
    const result = await pool.query(
        "SELECT comments.*, users.username FROM comments JOIN users ON comments.user_id = users.id WHERE comments.id = $1;",
        [id]
    );
    return result.rows[0];
};

const createComment = async (user_id, post_id, text_comment) => {
    const result = await pool.query(
        "INSERT INTO comments (user_id, post_id, text_comment) VALUES ($1, $2, $3) RETURNING *;",
        [user_id, post_id, text_comment]
    );
    return result.rows[0];
};

const updateComment = async (id, text_comment) => {
    const result = await pool.query(
        "UPDATE comments SET text_comment = $1 WHERE id = $2 RETURNING *;",
        [text_comment, id]
    );
    return result.rows[0];
};

const deleteComment = async (id) => {
    const result = await pool.query(
        "DELETE FROM comments WHERE id = $1 RETURNING *;",
        [id]
    );
    return result.rows[0];
};

module.exports = {
    getComments,
    getCommentById,
    createComment,
    updateComment,
    deleteComment
};

