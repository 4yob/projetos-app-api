const pool = require("../config/database");

//Api para procurar usuários pelo nome ou username
const getUsers = async (name, username) => {
    let query = "SELECT users.* FROM users";
    let conditions = [];
    let params = [];

    if (name && name.trim()) {
        params.push(`%${name.trim()}%`);
        conditions.push(`users.name ILIKE $${params.length}`);
    }
    if (username && username.trim()) {
        params.push(`%${username.trim()}%`);
        conditions.push(`users.username ILIKE $${params.length}`);
    }
    if (conditions.length > 0) {
        query += " WHERE " + conditions.join(" AND ");
    }
    const result = await pool.query(query, params);
    return result.rows;  
};

//Api para procurar um usuário pelo id
const getUserById = async (id) => {
    const result = await pool.query("SELECT * FROM users WHERE id = $1", [id]);
    return result.rows[0];
};

//Api para criar um novo usuário
const createUser = async (name, username, email, location, following = 0, followers = 0, photo) => {
    const result = await pool.query(
        "INSERT INTO users (name, username, email, location, following, followers, photo) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *",
        [name, username, email, location, following, followers, photo]
    );
    return result.rows[0];
};

//Api para atualizar um usuário
const updateUser = async (id, name, username, email, location, photo) => {

    const currentUser = await pool.query("SELECT * FROM users WHERE id = $1", [id]);
    if (!currentUser.rows[0]) {
        throw new Error("User not found");
    }

    const updatedName = name || currentUser.rows[0].name;
    const updatedUsername = username || currentUser.rows[0].username;
    const updatedEmail = email || currentUser.rows[0].email;
    const updatedLocation = location || currentUser.rows[0].location;
    const updatedPhoto = photo || currentUser.rows[0].photo;

    const result = await pool.query(
        "UPDATE users SET name = $1, username = $2, email = $3, photo = $4, location = $5 WHERE id = $6 RETURNING *",
        [updatedName, updatedUsername, updatedEmail, updatedPhoto, updatedLocation, id]
    );
    return result.rows[0];
};

//Api para deletar um usuário
const deleteUser = async (id) => {
    const result = await pool.query("DELETE FROM users WHERE id = $1 RETURNING *", [id]
    );
    return result.rows[0];
};

//Api para atualizar seguidores de um usuário
const updateFollowers = async (id, action) => {
    try {
        const increment = action === "follow" ? 1 : -1;
        const result = await pool.query(
            "UPDATE users SET followers = followers + $1 WHERE id = $2 AND followers + $1 >= 0 RETURNING *",
            [increment, id]
        );
        return result.rows[0];
    } catch (error) {
        console.error("Error updating followers in database:", error);
        throw error;
    }
};

//Api para atualizar o número de pessoas que o usuário está seguindo
const updateFollowing = async (id, action) => {
    try {
        const increment = action === "follow" ? 1 : -1; // Certifique-se de que "follow" aumenta e "unfollow" diminui
        console.log(`Updating following for user ${id} with action ${action} (increment: ${increment})`); 
        const result = await pool.query(
            "UPDATE users SET following = following + $1 WHERE id = $2 AND following + $1 >= 0 RETURNING *",
            [increment, id]
        );
        console.log("Database result:", result.rows[0]);
        return result.rows[0];
    } catch (error) {
        console.error("Error updating following in database:", error);
        throw error;
    }
};

module.exports = { getUsers, getUserById, createUser, updateUser, deleteUser, updateFollowers, updateFollowing };
