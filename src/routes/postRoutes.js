const express = require("express");
const router = express.Router();
const postController = require("../controllers/postController");
const multer = require("multer");
const upload = multer({ dest: "uploads/" });

/**
 * @swagger
 * tags:
 *   name: Posts
 *   description: Gerenciamento das rotas de posts
 */

/**
 * @swagger
 * /api/posts/{id}:
 *   get:
 *     summary: Retorna um post específico
 *     tags: [Posts]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do post
 *     responses:
 *       200:
 *         description: Post encontrado com sucesso
 *       404:
 *         description: Post não encontrado
 */
router.get("/posts/:id", postController.getPostById);

/**
 * @swagger
 * /api/posts:
 *   get:
 *     summary: Retorna todos os posts
 *     tags: [Posts]
 *     parameters:
 *       - in: query
 *         name: name
 *         schema:
 *           type: string
 *         description: Nome do post
 *     responses:
 *       200:
 *         description: Lista de posts
 */
router.get("/posts", postController.getPosts);

/**
 * @swagger
 * /api/posts:
 *   post:
 *     summary: Cria um novo post
 *     tags: [Posts]
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               title:
 *                 type: string
 *                 description: Título do post
 *               content:
 *                 type: string
 *                 description: Conteúdo do post
 *               photo:
 *                 type: string
 *                 format: binary
 *                 description: Imagem do post
 *     responses:
 *       201:
 *         description: Post criado com sucesso
 *       400:
 *         description: Erro ao criar o post
 */
router.post("/posts", upload.single("photo"), postController.createPost);

/**
 * @swagger
 * /api/posts/{id}:
 *   put:
 *     summary: Atualiza um post existente
 *     tags: [Posts]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do post
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
 *         description: Post atualizado com sucesso
 *       404:
 *         description: Post não encontrado
 */
router.put("/posts/:id", postController.updatePost);

/**
 * @swagger
 * /api/posts/{id}:
 *   delete:
 *     summary: Deleta um post existente
 *     tags: [Posts]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do post
 *     responses:
 *       200:
 *         description: Post deletado com sucesso
 *       404:
 *         description: Post não encontrado
 */
router.delete("/posts/:id", postController.deletePost);

/**
 * @swagger
 * /api/posts/like/{postId}:
 *   post:
 *     summary: Adiciona um like a um post
 *     tags: [Posts]
 *     parameters:
 *       - in: path
 *         name: postId
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do post a ser curtido
 *     responses:
 *       200:
 *         description: Like adicionado com sucesso
 *       404:
 *         description: Post não encontrado
 */
router.post("/like/:postId", postController.likePost);

module.exports = router;
