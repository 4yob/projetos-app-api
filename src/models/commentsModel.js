const pool = require("../config/database");

// Obtém todos os comentários, com filtro opcional por nome de usuário
const getComments = async (userName) => {
  try {
    let query = `
      SELECT comments.*, users.username AS user_name, users.photo AS user_photo
      FROM comments
      JOIN users ON comments.user_id = users.id
    `;
    let params = [];
    if (userName) {
      query += " WHERE users.username = $1";
      params = [userName];
    }
    const result = await pool.query(query, params);
    return result.rows;
  } catch (error) {
    console.error("Error fetching comments:", error);
    throw new Error("Error retrieving comments from the database.");
  }
};

// Obtém um comentário específico pelo ID
const getCommentById = async (id) => {
  const result = await pool.query(
    `SELECT comments.*, users.username AS user_name, users.photo AS user_photo
     FROM comments
     JOIN users ON comments.user_id = users.id
     WHERE comments.id = $1;`,
    [id]
  );
  return result.rows[0];
};

// Cria um novo comentário
const createComment = async (user_id, post_id, text_comment) => {
  const result = await pool.query(
    "INSERT INTO comments (user_id, post_id, text_comment) VALUES ($1, $2, $3) RETURNING *;",
    [user_id, post_id, text_comment]
  );
  return result.rows[0];
};

// Atualiza o texto de um comentário existente pelo ID
const updateComment = async (id, text_comment) => {
  const result = await pool.query(
    "UPDATE comments SET text_comment = $1 WHERE id = $2 RETURNING *;",
    [text_comment, id]
  );
  return result.rows[0];
};

// Deleta um comentário pelo ID
const deleteComment = async (id) => {
  const result = await pool.query(
    "DELETE FROM comments WHERE id = $1 RETURNING *;",
    [id]
  );
  return result.rows[0];
};

// Obtém todos os comentários de um post específico pelo ID do post
const getCommentsByPostId = async (post_id) => {
  const result = await pool.query(
    `SELECT comments.*, users.username AS user_name, users.photo AS user_photo
     FROM comments
     JOIN users ON comments.user_id = users.id
     WHERE comments.post_id = $1;`,
    [post_id]
  );
  return result.rows;
};

// Conta o número de comentários de um post específico pelo ID do post
const getCountCommentsByPostId = async (post_id) => {
  const result = await pool.query(
    "SELECT COUNT(*) AS count FROM comments WHERE post_id = $1;",
    [post_id]
  );
  return parseInt(result.rows[0].count, 10);
};

module.exports = {
  getComments,
  getCommentById,
  createComment,
  updateComment,
  deleteComment,
  getCommentsByPostId,
  getCountCommentsByPostId
};
