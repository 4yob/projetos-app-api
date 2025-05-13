const { format } = require("@fast-csv/format");
const PDFDocument = require("pdfkit");
const postModel = require("../models/postModel");
const userModel = require("../models/userModel");

const exportPostCSV = async (req, res) => {
    try {
        const posts = await postModel.getPosts();

        res.setHeader("Content-Disposition", "attachment; filename=posts.csv");
        res.setHeader("Content-Type", "text/csv");

        const csvStream = format({ headers: true });
        csvStream.pipe(res);

        posts.forEach((post) => {
            csvStream.write({
                Id: post.id,
                Titulo: post.title,
                Conteudo: post.content,
                Usuario: post.user_id,
                Foto: post.photo,
                Categoria: post.categoria,
                Likes: post.likes,
                Comentarios: post.comments,
                Data_Criacao: post.created_at
            });
        });

        csvStream.end();
    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar o CSV" });
    }
}

const exportUserCSV = async (req, res) => {
    try {
        const users = await userModel.getUsers();

        res.setHeader("Content-Disposition", "attachment; filename=users.csv");
        res.setHeader("Content-Type", "text/csv");

        const csvStream = format({ headers: true });
        csvStream.pipe(res);

        users.forEach((user) => {
            csvStream.write({
                Id: user.id,
                Nome: user.name,
                Email: user.email,
                User: user.username,
                Seguidores: user.following,
                Seguindo: user.followers,
                Data_Criacao: user.created_at
            });
        });

        csvStream.end();
    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar o CSV" });
    }
}

const exportPostPDF = async (req, res) => {
    try {
        const posts = await postModel.getPosts(); 

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=posts.pdf");

        const doc = new PDFDocument();
        doc.pipe(res);

        // Título
        doc.fontSize(30).text("Relatório de Posts", { align: "center" });
        doc.moveDown();

        // Cabeçalho
        doc.fontSize(20).text("Id | Titulo | Conteudo | Categoria | Likes | Comentarios", { underline: true });
        doc.moveDown(0.5);

        // Adicionar dados dos Posts
        posts.forEach((post) => {
            doc.text(
                `${post.id} | ${post.title} | ${post.content} | ${post.categoria} | ${post.likes} | ${post.comments}`
            );
        });
        doc.moveDown();
        // Rodapé
        doc.fontSize(10).text("Relatório gerado em: " + new Date().toLocaleString(), { align: "right" });
        doc.end();

    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar PDF!", error: error.message });
    }
};

const exportUserPDF = async (req, res) => {
    try {
        const users = await userModel.getUsers();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=users.pdf");

        const doc = new PDFDocument();
        doc.pipe(res);

        // Título
        doc.fontSize(30).text("Relatório de Usuários", { align: "center" });
        doc.moveDown();

        // Cabeçalho
        doc.fontSize(20).text("Id | Nome | Email | User | Seguidores | Seguindo", { underline: true });
        doc.moveDown(0.5);

        // Adicionar dados dos Usuários
        users.forEach((user) => {
            doc.text(
                `${user.id} | ${user.name} | ${user.email} | ${user.username} | ${user.following} | ${user.followers}`
            );
        });
        doc.moveDown();
        // Rodapé
        doc.fontSize(10).text("Relatório gerado em: " + new Date().toLocaleString(), { align: "right" });
        doc.end();

    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar PDF!", error: error.message });
    }
};

module.exports = { exportPostCSV, exportUserCSV, exportPostPDF, exportUserPDF };