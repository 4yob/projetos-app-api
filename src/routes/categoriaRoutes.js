const express = require("express");
const router = express.Router();
const categoriaController = require("../controllers/categoriaController");

/**
 * @swagger
 * tags:
 *   - name: Categoria
 *     description: Gerenciamento de Categorias
 */

/**
 * @swagger
 * /api/categoria:
 *   get:
 *     summary: Listar todas as categorias
 *     tags: [Categoria]
 *     responses:
 *       200:
 *         description: Categorias retornadas com sucesso!
 */
router.get("/categoria", categoriaController.getCategorias);

/**
 * @swagger
 * /api/categoria/{id}:
 *   get:
 *     summary: Busca uma categoria por ID
 *     tags: [Categoria]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: ID da categoria
 *     responses:
 *       200:
 *         description: Categoria encontrada
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
 *         description: Categoria não encontrada
 */
router.get("/categoria/:id", categoriaController.getCategoriaById);

/**
 * @swagger
 * /api/categoria:
 *   post:
 *     summary: Cria uma nova categoria
 *     tags: [Categoria]
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
 *         description: Categoria criada com sucesso
 */
router.post("/categoria", categoriaController.createCategoria);

/**
 * @swagger
 * /api/categoria/{id}:
 *   put:
 *     summary: Atualiza uma categoria existente
 *     tags: [Categoria]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da categoria
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
 *         description: Categoria atualizada com sucesso
 */
router.put("/categoria/:id", categoriaController.updateCategoria);

/**
 * @swagger
 * /api/categoria/{id}:
 *   delete:
 *     summary: Exclui uma categoria pelo ID
 *     tags: [Categoria]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID da categoria
 *     responses:
 *       200:
 *         description: Categoria excluída com sucesso
 */
router.delete("/categoria/:id", categoriaController.deleteCategoria);

module.exports = router;