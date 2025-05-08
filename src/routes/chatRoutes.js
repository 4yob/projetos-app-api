const express = require("express");
const router = express.Router();
const chatController = require("../controllers/chatController");
/**
 * @swagger
 * tags:
 *   name: Chat
 *   description: Gerenciamento das rotas de chats
 */

/**
 * @swagger
 * /api/chat:
 *   get:
 *     summary: Retorna todos os chats
 *     tags: [Chat]
 *     parameters:
 *       - in: query
 *         name: name
 *         schema:
 *           type: string
 *         description: Nome do chat
 *     responses:
 *       200:
 *         description: Lista de chats
 */
router.get("/chat", chatController.getChats);

/**
 * @swagger
 * /api/chat/{id}:
 *   get:
 *     summary: Retorna um chat específico
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
 *         description: Chat encontrado com sucesso
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
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               title:
 *                 type: string
 *                 description: Id do usuário
 *               content:
 *                 type: string
 *                 description: Mensagem do chat
 *               photo:
 *                 type: string
 *                 format: binary
 *                 description: Mensagem do chat
 *     responses:
 *       201:
 *         description: Chat criado com sucesso
 *       400:
 *         description: Erro ao criar o chat
 *       500:
 *         description: Erro interno do servidor
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
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               title:
 *                 type: string
 *               content:
 *                 type: string
 *               photo:
 *                 type: string
 *                 format: binary
 *     responses:
 *       200:
 *         description: Chat atualizado com sucesso
 *       404:
 *         description: Chat não encontrado
 */
router.put("/chat/:id", chatController.updateChat);

/**
 * @swagger
 * /api/chat/{id}:
 *   delete:
 *     summary: Deleta um chat existente
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
 *         description: Chat deletado com sucesso
 *       404:
 *         description: Chat não encontrado
 */
router.delete("/chat/:id", chatController.deleteChat);

module.exports = router;