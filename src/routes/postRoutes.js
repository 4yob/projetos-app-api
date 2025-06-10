const express = require("express");
const router = express.Router();
const postController = require("../controllers/postController");
const multer = require("multer");
const upload = multer({ dest: "uploads/" });
const apiKeyMiddleware = require("../config/apiKey");

router.use(apiKeyMiddleware);

/**
 * @swagger
 * tags:
 *   name: Posts
 *   description: Gerenciamento de Posts
 */

/**
 * @swagger
 * /api/posts/{id}:
 *   get:
 *     summary: Busca um Post por ID
 *     tags: [Posts]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do Post
 *     responses:
 *       200:
 *         description: Post encontrado
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
 *     summary: Criar um novo Post
 *     tags: [Posts]
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *                 description: Nome do Post
 *               title:
 *                 type: string
 *                 description: Título do Post
 *               content:
 *                 type: string
 *                 description: Descrição do Post
 *               photo:
 *                 type: string
 *                 format: binary
 *                 description: Foto do Post
 *     responses:
 *       201:
 *         description: Post criado com sucesso
 *       400:
 *         description: Requisição inválida
 */
router.post("/posts", upload.single("photo"), postController.createPost);

/**
 * @swagger
 * /api/posts/{id}:
 *   put:
 *     summary: Atualiza um Post existente
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
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               title:
 *                 type: string
 *                 description: Título do post
 *               content:
 *                 type: string
 *                 description: Descrição do post
 *               photo:
 *                 type: string
 *                 format: binary
 *                 description: Foto do post
 *               categoria:
 *                 type: string
 *                 description: Categoria do post
 *               likes:
 *                 type: integer
 *                 description: Número de likes do post
 *               comments:
 *                 type: integer
 *                 description: Número de comentários do post
 *     responses:
 *       200:
 *         description: Post atualizado com sucesso
 *       400:
 *         description: Requisição inválida
 *       404:
 *         description: Post não encontrado
 */
router.put("/posts/:id", postController.updatePost);

/**
 * @swagger
 * /api/posts/{id}:
 *   delete:
 *     summary: Deleta um Post existente
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
 * /api/likes/{id}/likes:
 *   patch:
 *     summary: Atualizar o número de curtidas de um post
 *     tags: [Posts]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do Post
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               action:
 *                 type: string
 *                 enum: [like, unlike]
 *                 description: Ação para atualizar curtidas
 *     responses:
 *       200:
 * 
 *         description: Seguidores atualizados com sucesso
 *       400:
 *         description: Ação inválida
 *       404:
 *         description: Post não encontrado
 */
router.patch("/posts/:id/likes", postController.updateLikes);


/**
 * @swagger
 * /api/posts/{id}/likes:
 *   get:
 *     summary: Obter o número de curtidas de um post
 *     tags: [Posts]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID do Post
 *     responses:
 *       200:
 *         description: Número de Curtidas retornado com sucesso
 *       404:
 *         description: Usuário não encontrado
 */
router.get("/posts/:id/likes", postController.getLikes);


module.exports = router;
