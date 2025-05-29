const express = require("express");
const router = express.Router();
const categoriaController = require("../controllers/categoriaController");

/**
 * @swagger
 * tags:
 *   - name: Category
 *     description: Category management
 */

/**
 * @swagger
 * /api/categoria:
 *   get:
 *     summary: List all categories
 *     tags: [Category]
 *     responses:
 *       200:
 *         description: Categories retrieved successfully!
 */
router.get("/categoria", categoriaController.getCategorias);

/**
 * @swagger
 * /api/categoria/{id}:
 *   get:
 *     summary: Get a category by ID
 *     tags: [Category]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: Category ID
 *     responses:
 *       200:
 *         description: Category found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 id:
 *                   type: integer
 *                   example: 1
 *                 name:
 *                   type: string
 *                   example: "Example category"
 *       404:
 *         description: Category not found
 */
router.get("/categoria/:id", categoriaController.getCategoriaById);

/**
 * @swagger
 * /api/categoria:
 *   post:
 *     summary: Create a new category
 *     tags: [Category]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               nome:
 *                 type: string
 *                 example: "New category"
 *     responses:
 *       201:
 *         description: Category created successfully
 */
router.post("/categoria", categoriaController.createCategoria);

/**
 * @swagger
 * /api/categoria/{id}:
 *   put:
 *     summary: Update an existing category
 *     tags: [Category]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: Category ID
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               nome:
 *                 type: string
 *                 example: "Updated category"
 *     responses:
 *       200:
 *         description: Category updated successfully
 */
router.put("/categoria/:id", categoriaController.updateCategoria);

/**
 * @swagger
 * /api/categoria/{id}:
 *   delete:
 *     summary: Delete a category by ID
 *     tags: [Category]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: Category ID
 *     responses:
 *       200:
 *         description: Category deleted successfully
 */
router.delete("/categoria/:id", categoriaController.deleteCategoria);

module.exports = router;