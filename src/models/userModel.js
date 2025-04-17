const pool = require("../config/database");

//Api para listar todos os usuários cadastrados no app
const getUsers = async () => {
    const result = await pool.query("SELECT * FROM users");
    return result.rows
};

//Api para procurar um usuário pelo id
const getUserBy = async (id) => {
    const result = await pool.query("SELECT * FROM users WHERE id = $1", [id]);
    return result.rows[0];
};

//Api para criar um novo usuário
const createUser = async (name, username, email, photo_profile, location, following, followers) => {
    const result = await pool.query("INSERT INTO users (name, email, photo_profile, location, following, followers) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *", 
        [name, username, email, photo_profile, location, following, followers]
    );
        return result.rows[0];
};

//Api para atualizar um usuário
const updateUser = async (id, name, username, email, photo_profile, location, following, followers) => {
    const result = await pool.query("UPDATE users SET name = $1, username = $2, email = $3, photo_profile = $4, location = $5, following = $6, followers = $7 WHERE id = $8 RETURNING *", 
        [name, username, email, photo_profile, location, following, followers, id]
    );
    return result.rows[0];
};

//Api para deletar um usuário
const deletarUser = async (id) => {
    const result = await pool.query("DELETE FROM users WHERE id = $1 RETURNING *", [id]
    );
    if (result.rowCount === 0){
        return {error: "Usuário não encontrado"};
        }
    return { message: "Usuário deletado com sucesso" };
};

module.exports = {
    getUsers,
    getUserBy,
    createUser,
    updateUser,
    deletarUser
};
