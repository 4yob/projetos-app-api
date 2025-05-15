const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController");
const multer = require("multer");
const upload = multer({ dest: "uploads/" });

/**
 * @swagger
 * tags:
 *   name: Users
 *   description: Gerenciamento de Usuários
 */

/**
 * @swagger
 * /api/users:
 *   get:
 *     summary: Listar todos os usuários
 *     tags: [Users]
 *     responses:
 *       200:
 *         description: Usuários retornados com sucesso!
 */
router.get("/users", userController.getUsers);

/**
 * @swagger
 * /api/users/{id}:
 *   get:
 *     summary: Busca um usuário por ID
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: ID do usuário
 *     responses:
 *       200:
 *         description: Usuário encontrado
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
 *                   example: "João Silva"
 *                 email:
 *                   type: string
 *                   example: "joao.silva@example.com"
 *       404:
 *         description: Usuário não encontrado
 */
router.get("/users/:id", userController.getUserById);

/**
 * @swagger
 * /api/users:
 *   post:
 *     summary: Criar um novo usuário
 *     tags: [Users]
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *                 description: Nome do usuário
 *               email:
 *                 type: string
 *                 description: Email do usuário
 *               username:
 *                 type: string
 *                 description: Nome de usuário
 *               location:
 *                 type: string
 *                 description: Localização do usuário
 *               following:
*                 type: integer
*                 description: Número de pessoas que o usuário está seguindo.
*                 example: 0
*               followers:
*                 type: integer
*                 description: Número de seguidores do usuário.
*                 example: 0
 *               photo:
 *                 type: string
 *                 format: binary
 *                 description: Foto do usuário
 *     responses:
 *       201:
 *         description: Usuário criado com sucesso
 */
router.post("/users", (req, res, next) => {
    upload.single("photo")(req, res, (err) => {
        if (err) {
            return res.status(400).json({ message: "Erro no upload do arquivo" });
        }
        next();
    });
}, userController.createUser);

/**
 * @swagger
 * /api/users/{id}:
 *   put:
 *     summary: Atualiza um usuário
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: ID do usuário
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *                 description: Nome do usuário
 *               email:
 *                 type: string
 *                 description: Email do usuário
 *               username:
 *                 type: string
 *                 description: Nome de usuário
 *               location:
 *                 type: string
 *                 description: Localização do usuário
 *               photo:
 *                 type: string
 *                 format: binary
 *                 description: Foto do usuário
 *     responses:
 *       200:
 *         description: Usuário atualizado com sucesso
 */

router.put("/users/:id", (req, res, next) => {
    upload.single("photo")(req, res, (err) => {
        if (err) {
            return res.status(400).json({ message: "Erro no upload do arquivo" });
        }
        next();
    });
}, userController.updateUser);

/**
 * @swagger
 * /api/users/{id}:
 *   delete:
 *     summary: Deleta um usuário
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: ID do usuário
 *     responses:
 *       200:
 *         description: Usuário deletado com sucesso
 *       404:
 *         description: Usuário não encontrado
 */
router.delete("/users/:id", userController.deleteUser);

/**
 * @swagger
 * /api/users/{id}/followers:
 *   get:
 *     summary: Obter o número de seguidores de um usuário
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: ID do usuário
 *     responses:
 *       200:
 *         description: Número de seguidores retornado com sucesso
 *       404:
 *         description: Usuário não encontrado
 */
router.get("/users/:id/followers", userController.getFollowers);

/**
 * @swagger
 * /api/users/{id}/followers:
 *   patch:
 *     summary: Atualizar o número de seguidores de um usuário
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: ID do usuário
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               action:
 *                 type: string
 *                 enum: [increase, decrease]
 *                 description: Ação para atualizar seguidores
 *     responses:
 *       200:
 *         description: Seguidores atualizados com sucesso
 *       400:
 *         description: Ação inválida
 *       404:
 *         description: Usuário não encontrado
 */
router.patch("/users/:id/followers", userController.updateFollowers);

/**
 * @swagger
 * /api/users/{id}/following:
 *   get:
 *     summary: Obter o número de pessoas que o usuário está seguindo
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: ID do usuário
 *     responses:
 *       200:
 *         description: Número de pessoas seguindo retornado com sucesso
 *       404:
 *         description: Usuário não encontrado
 */
router.get("/users/:id/following", userController.getFollowing);

/**
 * @swagger
 * /api/users/{id}/following:
 *   patch:
 *     summary: Atualizar o número de pessoas que o usuário está seguindo
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *           example: 1
 *         description: ID do usuário
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               action:
 *                 type: string
 *                 enum: [increase, decrease]
 *                 description: Ação para atualizar seguindo
 *     responses:
 *       200:
 *         description: Seguindo atualizado com sucesso
 *       400:
 *         description: Ação inválida
 *       404:
 *         description: Usuário não encontrado
 */
router.patch("/users/:id/following", userController.updateFollowing);

module.exports = router;