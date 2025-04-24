const userModel = require("../models/userModel");

const getAllUsers = async (req, res) => {
    try {
        const users = await userModel.getUsers();
        res.status(200).json(users)
    } catch (error) {
        res.status(400).json({ message: "Erro ao buscar usuário" })
    }
};

const getUserById = async (req, res) => {
    try {
        const user = await userModel.getUserById(req.params.id);


        if (!user) {
            res.status(404).json({ message: "Usuário não encontrado" });
        }
        res.status(200).json(user);
    } catch (error) {
        res.status(404).json({ message: "Erro ao buscar usuário" })
    }
};

const createUser = async (req, res) => {
    try {
        const { name, username, email, location, following, followers } = req.body;
        const photo = req.file ? req.file.filename : null;
        const newUser = await userModel.createUser(name, username, email, location, following, followers, photo);
        res.status(201).json(newUser);
    } catch (error) {
        console.log(error);
        if (error.code === "23505") {
            res.status(400).json({ message: "Email já cadastrado" });
        }
        res.status(404).json({ message: "Erro ao criar usuário" });
    }
};


const updateUser = async (req, res) => {
    try {
        const { name, username, email, location } = req.body;
        const photo = req.file ? req.file.filename : null;
        const updatedUser = await userModel.updateUser(req.params.id, name, username, email, location, photo);

        if (!updatedUser) {
            return res.status(404).json({ message: "Usuário não encontrado" });
        }
        res.status(200).json(updatedUser);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Erro ao atualizar usuário" });
    }
};

const deleteUser = async (req, res) => {
    try {
        const message = await userModel.deleteUser(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(404).json({ message: "Erro ao deletar usuário" });
    }
}

module.exports = { getAllUsers, getUserById, createUser, updateUser, deleteUser }
