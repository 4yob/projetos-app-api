const express = require("express");
const router = express.Router();
const chatController = require("../controllers/chatController");
/**
 * @swagger
 * tags:
 *   name: Chat
 *   description: Chat routes management
 */

/**
 * @swagger
 * /api/chat:
 *   get:
 *     summary: Returns all chats
 *     tags: [Chat]
 *     parameters:
 *       - in: query
 *         name: name
 *         schema:
 *           type: string
 *         description: Chat name
 *     responses:
 *       200:
 *         description: List of chats
 */
router.get("/chat", chatController.getChats);

/**
 * @swagger
 * /api/chat/{id}:
 *   get:
 *     summary: Returns a specific chat
 *     tags: [Chat]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: Chat ID
 *     responses:
 *       200:
 *         description: Chat found successfully
 *       404:
 *         description: Chat not found
 */
router.get("/chat/:id", chatController.getChatById);

/**
 * @swagger
 * /api/chat:
 *   post:
 *     summary: Creates a new chat
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
 *                 description: User ID
 *               content:
 *                 type: string
 *                 description: Chat message
 *               photo:
 *                 type: string
 *                 format: binary
 *                 description: Chat message
 *     responses:
 *       201:
 *         description: Chat created successfully
 *       400:
 *         description: Error creating chat
 *       500:
 *         description: Internal server error
 */
router.post("/chat", chatController.createChat);

/**
 * @swagger
 * /api/chat/{id}:
 *   put:
 *     summary: Updates an existing chat
 *     tags: [Chat]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: Chat ID
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
 *         description: Chat updated successfully
 *       404:
 *         description: Chat not found
 */
router.put("/chat/:id", chatController.updateChat);

/**
 * @swagger
 * /api/chat/{id}:
 *   delete:
 *     summary: Deletes an existing chat
 *     tags: [Chat]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: Chat ID
 *     responses:
 *       200:
 *         description: Chat deleted successfully
 *       404:
 *         description: Chat not found
 */
router.delete("/chat/:id", chatController.deleteChat);

module.exports = router;