const express = require("express");
const router = express.Router();
const commentsController = require("../controllers/commentsController");
/**
 * @swagger
 * tags:
 *   - name: Comments
 *     description: Gerenciamento de Comentários
 */

/**
 * @swagger
 * /api/comments:
 *   get:
 *     summary: Listar todos os comentários
 *     tags: [Comments]
 *     responses:
 *       200:
 *         description: Comentários retornados com sucesso!
 */
router.get("/comments", commentsController.getComments);

/**
 * @swagger
 * /api/comment/{id}:
 *   get:
 *     summary: Busca um comentário por ID
 *     tags: [Comments]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: ID do comentário
 *     responses:
 *       200:
 *         description: Comentário encontrado
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 id:
 *                   type: integer
 *                   example: 1
 *                 user_id:
 *                   type: integer
 *                   example: 2
 *                 post_id:
 *                   type: integer
 *                   example: 3
 *                 text_comment:
 *                   type: string
 *                   example: "Comentário de exemplo"
 *       404:
 *         description: Comentário não encontrado
 */
router.get("/comments/:id", commentsController.getCommentById);

/**
 * @swagger
 * /api/comment:
 *   post:
 *     summary: Cria um novo comentário
 *     tags: [Comments]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               user_id:
 *                 type: integer
 *               post_id:
 *                 type: integer
 *               text_comment:
 *                 type: string
 *     responses:
 *       201:
 *         description: Comentário criado com sucesso
 */
router.post("/comment", commentsController.createComment);

/**
 * @swagger
 * /api/comment/{id}:
 *   put:
 *     summary: Atualiza um comentário existente
 *     tags: [Comments]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do comentário
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               text_comment:
 *                 type: string
 *     responses:
 *       200:
 *         description: Comentário atualizado com sucesso
 */
router.put("/comment/:id", commentsController.updateComment);

/**
 * @swagger
 * /api/comment/{id}:
 *   delete:
 *     summary: Exclui um comentário pelo ID
 *     tags: [Comments]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do comentário
 *     responses:
 *       200:
 *         description: Comentário excluído com sucesso
 */
router.delete("/comment/:id", commentsController.deleteComment);
router.get("/comments/post/:post_id", commentsController.getCommentsByPostId);
router.get("/comments/count/:post_id", commentsController.getCountCommentsByPostId);

module.exports = router;