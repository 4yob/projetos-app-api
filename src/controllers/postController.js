const postModel = require("../models/postModel");



const getPost = async (req, res) => {
    try {
        const post = await postModel.getPostById(req.params.id);
        if (!post) {
            return res.status(404).json({ message: "Post não encontrado." });
        }
        res.json({ message: "Post obtido com sucesso.", post });
    }
    catch (error) 
    { res.status(500).json({ message: "Erro ao buscar post." }); }
};




module.exports = {getPost };