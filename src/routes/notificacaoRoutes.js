const express = require("express");
const router = express.Router();
const notificacaoController = require("../controllers/notificacaoController");

/**
 * @swagger
 * tags:
 *   - name: Notificacoes
 *     description: Gerenciamento de Notificações
 */

/**
 * @swagger
 * /api/notificacoes:
 *   get:
 *     summary: Listar todas as notificações
 *     tags: [Notificacoes]
 *     responses:
 *       200:
 *         description: Notificações retornadas com sucesso!
 */
router.get("/notificacoes", notificacaoController.getNotificacoes);

/**
 * @swagger
 * /api/notificacao/{id}:
 *   get:
 *     summary: Busca uma notificação por ID
 *     tags: [Notificacoes]
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
router.get("/notificacao/:id", notificacaoController.getNotificacaoById);

/**
 * @swagger
 * /api/notificacao:
 *   post:
 *     summary: Cria uma nova notificação
 *     tags: [Notificacoes]
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
router.post("/notificacao", notificacaoController.createNotificacao);

/**
 * @swagger
 * /api/notificacao/{id}:
 *   put:
 *     summary: Atualiza uma notificação existente
 *     tags: [Notificacoes]
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
router.put("/notificacao/:id", notificacaoController.updateNotificacao);

/**
 * @swagger
 * /api/notificacao/{id}:
 *   delete:
 *     summary: Exclui uma notificação pelo ID
 *     tags: [Notificacoes]
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
router.delete("/notificacao/:id", notificacaoController.deleteNotificacao);

module.exports = router;