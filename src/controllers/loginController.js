const bcrypt = require('bcrypt');
const User = require('../models/userModel');

const loginController = {
    login: async (req, res) => {
        const { username, password } = req.body;
        const user = await User.findOne({ username });
        if (!user) {
            return res.status(401).json({ message: 'Usuário não encontrado.' });
        }
        const validPassword = await bcrypt.compare(password, user.password);
        if (!validPassword) {
            return res.status(401).json({ message: 'Senha incorreta.' });
        }
        res.json({ message: 'Login bem-sucedido!' });
    }
}

module.exports = loginController;