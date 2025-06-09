const bcrypt = require('bcrypt');
const User = require('../models/User');

const signUpController = {
    signUp: async (req, res) => {
        const { fullName, email, username, password } = req.body;
        try {
            const hashedPassword = await bcrypt.hash(password, 10);
            const user = new User({
                fullName,
                email,
                username,
                password: hashedPassword
            });
            await user.save();
            res.status(201).json({ message: 'Usuário cadastrado!' });
        } catch (error) {
            res.status(500).json({ message: 'Erro ao cadastrar usuário.' });
        }
    }
};

module.exports = signUpController;