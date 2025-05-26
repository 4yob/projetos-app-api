const categoriaModel = require("../models/categoriaModel");

const getCategorias = async (req, res) => {
    try {
        const categorias = await categoriaModel.getCategorias();
        res.status(201).json({ message: "Categorias retrieved successfully.", categorias });
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Error retrieving categorias." });
    }
};

const getCategoriaById = async (req, res) => {
    try {
        const categoria = await categoriaModel.getCategoriaById(req.params.id);
        if (!categoria) {
            return res.status(404).json({ message: "Categoria not found." });
        }
        res.status(200).json({ message: "Categoria retrieved successfully.", categoria });
    } catch (error) {
        console.error(error);
        res.status(404).json({ message: "Error retrieving categoria." });
    }
}

const createCategoria = async (req, res) => {
    try {
        const { nome, descricacao } = req.body;

        // Validação dos campos obrigatórios
        if (!nome || !descricacao) {
            return res.status(400).json({ message: "Required fields not provided." });
        }

        const newCategoria = await categoriaModel.createCategoria(user_id, message);
        res.status(201).json({ message: "Categoria created successfully.", newCategoria });
    } catch (error) {
        console.error(error);
        if (error.code === "23505") {
            return res.status(400).json({ message: "Categoria already registered!" });
        }
        console.log(req.body);
        res.status(500).json({ message: "Error creating a new categoria." });
    }
};

const updateCategoria = async (req, res) => {
    try {
        const { message } = req.body;
        const updatedCategoria = await categoriaModel.updateCategoria(req.params.id, message);
        if (!updatedCategoria) {
            return res.status(404).json({ message: "Categoria not found." });
        }
        res.status(200).json({ message: "Categoria updated successfully.", updatedCategoria });
    } catch (error) {
        res.status(500).json({ message: "Error updating categoria." });
    }
};


const deleteCategoria = async (req, res) => {
    try {
        const { id } = req.params;
        const deletedCategoria = await categoriaModel.deleteCategoria(id);
        if (!deletedCategoria) {
            return res.status(404).json({ message: "Categoria not found." });
        }
        res.status(200).json({ message: "Categoria deleted successfully.", deletedCategoria });
    } catch (error) {
        res.status(500).json({ message: "Error deleting categoria." });
    }
};

module.exports = { getCategorias, getCategoriaById, createCategoria, updateCategoria, deleteCategoria };