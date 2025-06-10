const pool = require("../config/database");

// Obtém todas as categorias do banco de dados
const getCategorias = async () => {
    try {
        const result = await pool.query("SELECT * FROM categories");
        return result.rows;
    } catch (error) {
        console.error("Error fetching all categorias:", error);
        throw new Error("Error retrieving categorias from the database.");
    }
};

// Obtém uma categoria específica pelo ID
const getCategoriaById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM categories WHERE id = $1", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Error fetching categoria with ID ${id}:`, error);
        throw error;
    }
};

// Cria uma nova categoria no banco de dados
const createCategoria = async (name) => {
    try {
        const result = await pool.query(
            "INSERT INTO categories (name) VALUES ($1) RETURNING *",
            [name]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error creating categoria:", error);
        throw error;
    }
};

// Atualiza uma categoria existente pelo ID
const updateCategoria = async (id, name) => {
    try {
        const result = await pool.query(
            "UPDATE categories SET name = $1 WHERE id = $2 RETURNING *",
            [name, id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error updating categoria:", error);
        throw error;
    }
};

// Deleta uma categoria existente pelo ID
const deleteCategoria = async (id) => {
    try {
        const result = await pool.query(
            "DELETE FROM categories WHERE id = $1 RETURNING *",
            [id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error deleting categoria:", error);
        throw error;
    }
};

// Exporta as funções do modelo
module.exports = {
    getCategorias,
    getCategoriaById,
    createCategoria,
    updateCategoria,
    deleteCategoria,
};