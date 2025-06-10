const userModel = require("../models/userModel");

// Rota para buscar usuários pelo nome ou username
const getUsers = async (req, res) => {
    try {
        const { name, username } = req.query;
        const users = await userModel.getUsers(name, username);
        res.status(200).json({ message: "Users retrieved successfully.", users });
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Error retrieving users." });
    }
};

// Rota para buscar um usuário pelo ID
const getUserById = async (req, res) => {
    try {
        const user = await userModel.getUserById(req.params.id);
        if (!user) {
            res.status(404).json({ message: "User not found." });
        }
        res.status(200).json({ message: "User retrieved successfully.", user });
    } catch (error) {
        console.error(error);
        res.status(404).json({ message: "Error retrieving user." });
    }
};

// Rota para criar um novo usuário
const createUser = async (req, res) => {
    try {
        const { name, username, email, location, following, followers } = req.body;

        // Valida os campos obrigatórios
        if (!name || !email || !username) {
            return res.status(400).json({ message: "Os campos 'name', 'email' e 'username' são obrigatórios." });
        }

        // Valida se os campos numéricos são números
        if (following && isNaN(following)) {
            return res.status(400).json({ message: "'following' deve ser um número." });
        }
        if (followers && isNaN(followers)) {
            return res.status(400).json({ message: "'followers' deve ser um número." });
        }

        const photo = req.file ? req.file.filename : null; // Obtém o nome do arquivo da foto, se fornecido
        const newUser = await userModel.createUser(name, username, email, location, following, followers, photo);
        res.status(201).json({ message: "User created successfully.", newUser });
    } catch (error) {
        console.log(error);
        if (error.code === "23505") {
            // Trata erros de chave única (e-mail ou username duplicados)
            if (error.constraint === "users_email_key") {
                res.status(400).json({ message: "Email already registered." });
            } else if (error.constraint === "users_username_key") {
                res.status(400).json({ message: "Username already used, please try again!" });
            }
        }
        res.status(404).json({ message: "Error creating user." });
    }
};

// Rota para atualizar os dados de um usuário
const updateUser = async (req, res) => {
    try {
        const { name, username, email, location } = req.body;
        const photo = req.file ? req.file.filename : null; // Obtém o nome do arquivo da foto, se fornecido
        const updatedUser = await userModel.updateUser(req.params.id, name, username, email, location, photo);

        if (!updatedUser) {
            return res.status(404).json({ message: "User not found." });
        }
        res.status(200).json({ message: "User updated successfully.", updatedUser });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error updating user." });
    }
};

// Rota para deletar um usuário
const deleteUser = async (req, res) => {
    try {
        const message = await userModel.deleteUser(req.params.id);
        res.status(200).json({ message: "User deleted successfully.", details: message });
    } catch (error) {
        res.status(500).json({ message: "Failed to delete user." });
    }
};

// Rota para obter o número de seguidores de um usuário
const getFollowers = async (req, res) => {
    try {
        const userId = req.params.id;
        const user = await userModel.getUserById(userId);
        if (!user) {
            return res.status(404).json({ message: "User not found." });
        }
        res.status(200).json({ message: "Followers retrieved successfully.", followers: user.followers });
    } catch (error) {
        console.error("Error retrieving followers:", error);
        res.status(500).json({ message: "Error retrieving followers." });
    }
};

// Rota para atualizar o número de seguidores de um usuário
const updateFollowers = async (req, res) => {
    try {
        const { id } = req.params;
        const { action } = req.body; // 'unfollow' ou 'follow'

        // Valida a ação fornecida
        if (!["follow", "unfollow"].includes(action)) {
            return res.status(400).json({ message: "Invalid action. Use 'unfollow' or 'follow'." });
        }

        const updatedUser = await userModel.updateFollowers(id, action);
        if (!updatedUser) {
            return res.status(404).json({ message: "User not found or invalid operation." });
        }

        res.status(200).json({ message: "Followers updated successfully.", followers: updatedUser.followers });
    } catch (error) {
        console.error("Error updating followers:", error);
        res.status(500).json({ message: "Error updating followers." });
    }
};

// Rota para obter o número de pessoas que o usuário está seguindo
const getFollowing = async (req, res) => {
    try {
        const userId = req.params.id;
        const user = await userModel.getUserById(userId);
        if (!user) {
            return res.status(404).json({ message: "User not found." });
        }
        res.status(200).json({ message: "Following retrieved successfully.", following: user.following });
    } catch (error) {
        console.error("Error retrieving following:", error);
        res.status(500).json({ message: "Error retrieving following." });
    }
};

// Rota para atualizar o número de pessoas que o usuário está seguindo
const updateFollowing = async (req, res) => {
    try {
        const { id } = req.params;
        const { action } = req.body;

        console.log(`Received request to update following for user ${id} with action ${action}`);

        // Valida a ação fornecida
        if (!["follow", "unfollow"].includes(action)) {
            return res.status(400).json({ message: "Invalid action. Use 'follow' or 'unfollow'." });
        }

        const updatedUser = await userModel.updateFollowing(id, action);
        if (!updatedUser) {
            console.log(`User ${id} not found or invalid operation`);
            return res.status(404).json({ message: "User not found or invalid operation." });
        }

        res.status(200).json({ message: "Following updated successfully.", following: updatedUser.following });
    } catch (error) {
        console.error("Error updating following:", error);
        res.status(500).json({ message: "Error updating following." });
    }
};

module.exports = { getUsers, getUserById, createUser, updateUser, deleteUser, getFollowers, updateFollowers, getFollowing, updateFollowing };
