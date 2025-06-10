// Importa o modelo de categorias
const categoriaModel = require("../models/categoriaModel");

// Obtém todas as categorias
const getCategorias = async (req, res) => {
    try {
        const categorias = await categoriaModel.getCategorias();
        res
            .status(201)
            .json({ message: "Categorias retrieved successfully.", categorias });
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Error retrieving categorias." });
    }
};

// Obtém uma categoria pelo ID
const getCategoriaById = async (req, res) => {
    try {
        const { id } = req.params; // Extrai o ID dos parâmetros da requisição
        const categoria = await categoriaModel.getCategoriaById(id);
        if (!categoria) {
            return res.status(404).json({ message: "Categoria not found." });
        }
        res
            .status(200)
            .json({ message: "Categoria retrieved successfully.", categoria });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error retrieving categoria." });
    }
};

// Cria uma nova categoria
const createCategoria = async (req, res) => {
    try {
        const { nome } = req.body; // Extrai o nome do corpo da requisição

        // Validação dos campos obrigatórios
        if (!nome) {
            return res.status(400).json({ message: "Required fields not provided." });
        }

        const newCategoria = await categoriaModel.createCategoria(nome);
        res
            .status(201)
            .json({ message: "Categoria created successfully.", newCategoria });
    } catch (error) {
        console.error(error);
        if (error.code === "23505") {
            return res.status(400).json({ message: "Categoria already registered!" });
        }
        console.log(req.body);
        res.status(500).json({ message: "Error creating a new categoria." });
    }
};

// Atualiza uma categoria existente
const updateCategoria = async (req, res) => {
    try {
        const { nome } = req.body; // Extrai o nome do corpo da requisição
        if (!nome) {
            return res.status(400).json({ message: "Required fields not provided." });
        }
        const updatedCategoria = await categoriaModel.updateCategoria(
            req.params.id, // Obtém o ID dos parâmetros da requisição
            nome
        );
        if (!updatedCategoria) {
            return res.status(404).json({ message: "Categoria not found." });
        }
        res
            .status(200)
            .json({ message: "Categoria updated successfully.", updatedCategoria });
    } catch (error) {
        res.status(500).json({ message: "Error updating categoria." });
    }
};

// Deleta uma categoria pelo ID
const deleteCategoria = async (req, res) => {
    try {
        const { id } = req.params; // Obtém o ID dos parâmetros da requisição
        const deletedCategoria = await categoriaModel.deleteCategoria(id);
        if (!deletedCategoria) {
            return res.status(404).json({ message: "Categoria not found." });
        }
        res
            .status(200)
            .json({ message: "Categoria deleted successfully.", deletedCategoria });
    } catch (error) {
        res.status(500).json({ message: "Error deleting categoria." });
    }
};

// Exporta as funções do controlador
module.exports = {
    getCategorias,
    getCategoriaById,
    createCategoria,
    updateCategoria,
    deleteCategoria,
};
