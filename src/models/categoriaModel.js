const pool = require("../config/database");

const getCategorias = async () => {
    try {
        const result = await pool.query("SELECT * FROM categories");
        return result.rows;
    } catch (error) {
        console.error("Error fetching all categorias:", error);
        throw new Error("Error retrieving categorias from the database.");
    }
};

const getCategoriaById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM categorias WHERE id = $1", [id]);
        return result.rows[0];
    } catch (error) {
        console.error(`Error fetching categoria with ID ${id}:`, error);
        throw error;
    }
};

const createCategoria = async (user_id, name) => {
    try {
        const result = await pool.query(
            "INSERT INTO categorias (user_id, name) VALUES ($1, $2) RETURNING *",
            [user_id, name]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error creating categoria:", error);
        throw error;
    }
};

const updateCategoria = async (id, name) => {
    try {
        const result = await pool.query(
            "UPDATE categorias SET name = $1 WHERE id = $2 RETURNING *",
            [name, id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error updating categoria:", error);
        throw error;
    }
};

const deleteCategoria = async (id) => {
    try {
        const result = await pool.query(
            "DELETE FROM categorias WHERE id = $1 RETURNING *",
            [id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error deleting categoria:", error);
        throw error;
    }
};

module.exports = {
    getCategorias,
    getCategoriaById,
    createCategoria,
    updateCategoria,
    deleteCategoria
};