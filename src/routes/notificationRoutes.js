const express = require("express");
const router = express.Router();
const notificationController = require("../controllers/notificationController");

/**
 * @swagger
 * tags:
 *   - name: Notifications
 *     description: Gerenciamento de Notificações
 */

/**
 * @swagger
 * /api/notifications:
 *   get:
 *     summary: Listar todas as notificações
 *     tags: [Notifications]
 *     responses:
 *       200:
 *         description: Notificações retornadas com sucesso!
 */
router.get("/notification", notificationController.getNotifications);

/**
 * @swagger
 * /api/notification/{id}:
 *   get:
 *     summary: Busca uma notificação por ID
 *     tags: [Notifications]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: ID da notificação
 *     responses:
 *       200:
 *         description: Notificação encontrada
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
 *                 mensagem:
 *                   type: string
 *                   example: "Você recebeu uma nova mensagem"
 *                 created_at:
 *                   type: string
 *                   format: date-time
 *       404:
 *         description: Notificação não encontrada
 */
router.get("/notification/:id", notificationController.getNotificationById);

/**
 * @swagger
 * /api/notification:
 *   post:
 *     summary: Cria uma nova notificação
 *     tags: [Notifications]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               user_id:
 *                 type: integer
 *               mensagem:
 *                 type: string
 *     responses:
 *       201:
 *         description: Notificação criada com sucesso
 */
router.post("/notification", notificationController.createNotification);

/**
 * @swagger
 * /api/notification/{id}:
 *   put:
 *     summary: Atualiza uma notificação existente
 *     tags: [Notifications]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da notificação
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               mensagem:
 *                 type: string
 *     responses:
 *       200:
 *         description: Notificação atualizada com sucesso
 */
router.put("/notification/:id", notificationController.updateNotification);

/**
 * @swagger
 * /api/notification/{id}:
 *   delete:
 *     summary: Exclui uma notificação pelo ID
 *     tags: [Notifications]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da notificação
 *     responses:
 *       200:
 *         description: Notificação excluída com sucesso
 */
router.delete("/notification/:id", notificationController.deleteNotification);

router.post("/ganharNotificacao", notificationController.ganharNotificacao);

module.exports = router;