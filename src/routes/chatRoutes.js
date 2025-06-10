const express = require("express");
const router = express.Router();
const chatController = require("../controllers/chatController");
const apiKeyMiddleware = require("../config/apiKey");

router.use(apiKeyMiddleware);

/**
 * @swagger
 * tags:
 *   - name: Chat
 *     description: Gerenciamento de Chats
 */

/**
 * @swagger
 * /api/chat:
 *   get:
 *     summary: Listar todos os chats
 *     tags: [Chat]
 *     responses:
 *       200:
 *         description: Chats retornados com sucesso!
 */
router.get("/chat", chatController.getChats);

/**
 * @swagger
 * /api/chat/{id}:
 *   get:
 *     summary: Busca um chat por ID
 *     tags: [Chat]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: ID do chat
 *     responses:
 *       200:
 *         description: Chat encontrado
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
 *                 message:
 *                   type: string
 *                   example: "Mensagem de exemplo"
 *       404:
 *         description: Chat não encontrado
 */
router.get("/chat/:id", chatController.getChatById);

/**
 * @swagger
 * /api/chat:
 *   post:
 *     summary: Cria um novo chat
 *     tags: [Chat]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               user_id:
 *                 type: integer
 *               message:
 *                 type: string
 *     responses:
 *       201:
 *         description: Chat criado com sucesso
 */
router.post("/chat", chatController.createChat);

/**
 * @swagger
 * /api/chat/{id}:
 *   put:
 *     summary: Atualiza um chat existente
 *     tags: [Chat]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do chat
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               message:
 *                 type: string
 *     responses:
 *       200:
 *         description: Chat atualizado com sucesso
 */
router.put("/chat/:id", chatController.updateChat);

/**
 * @swagger
 * /api/chat/{id}:
 *   delete:
 *     summary: Exclui um chat pelo ID
 *     tags: [Chat]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do chat
 *     responses:
 *       200:
 *         description: Chat excluído com sucesso
 */
router.delete("/chat/:id", chatController.deleteChat);

module.exports = router;