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

        const doc = new PDFDocument({ margin: 50 });
        doc.pipe(res);

        const maxY = 750;

        const drawHeader = () => {
            doc
                .font('Helvetica-Bold')
                .fontSize(24)
                .fillColor('#003366')
                .text("📊 Relatório de Posts", { align: "center" })
                .moveDown(1.2);

            doc
                .fontSize(12)
                .fillColor('black')
                .font('Helvetica-Bold')
                .text("ID", 50)
                .text("Título", 90)
                .text("Conteúdo", 190)
                .text("Categoria", 340)
                .text("Likes", 430)
                .text("Comentários", 490);

            doc.moveTo(50, doc.y).lineTo(560, doc.y).stroke();
            doc.moveDown(0.3);
        };

        const drawFooter = () => {
            doc.fontSize(10).fillColor('gray');
            doc.text(`Página ${doc.page.number}`, 50, maxY + 10, { align: "left" });
            doc.text("Gerado em: " + new Date().toLocaleString(), 50, maxY + 10, { align: "right" });
        };

        drawHeader();

        let y = doc.y;
        posts.forEach((post, i) => {
            if (y > maxY) {
                drawFooter();
                doc.addPage();
                drawHeader();
                y = doc.y;
            }

            const isEven = i % 2 === 0;
            if (isEven) {
                doc.rect(50, y - 2, 510, 18).fill('#f2f2f2').fillColor('black');
            }

            doc
                .fontSize(10)
                .font('Helvetica')
                .fillColor('black')
                .text(String(post.id), 50, y)
                .text(post.title.slice(0, 15), 90, y)
                .text(post.content.slice(0, 30) + (post.content.length > 30 ? '...' : ''), 190, y)
                .text(post.categoria, 340, y)
                .text(String(post.likes), 430, y)
                .text(String(post.comments), 490, y);

            y += 18;
        });

        drawFooter();
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

        const doc = new PDFDocument({ margin: 50 });
        doc.pipe(res);

        const maxY = 750;

        const drawHeader = () => {
            doc
                .font('Helvetica-Bold')
                .fontSize(24)
                .fillColor('#003366')
                .text("👥 Relatório de Usuários", { align: "center" })
                .moveDown(1.2);

            doc
                .fontSize(12)
                .fillColor('black')
                .font('Helvetica-Bold')
                .text("ID", 50)
                .text("Nome", 90)
                .text("Email", 180)
                .text("Usuário", 330)
                .text("Seguindo", 420)
                .text("Seguidores", 500);

            doc.moveTo(50, doc.y).lineTo(560, doc.y).stroke();
            doc.moveDown(0.3);
        };

        const drawFooter = () => {
            doc.fontSize(10).fillColor('gray');
            doc.text(`Página ${doc.page.number}`, 50, maxY + 10, { align: "left" });
            doc.text("Gerado em: " + new Date().toLocaleString(), 50, maxY + 10, { align: "right" });
        };

        drawHeader();

        let y = doc.y;
        users.forEach((user, i) => {
            if (y > maxY) {
                drawFooter();
                doc.addPage();
                drawHeader();
                y = doc.y;
            }

            const isEven = i % 2 === 0;
            if (isEven) {
                doc.rect(50, y - 2, 510, 18).fill('#f9f9f9').fillColor('black');
            }

            doc
                .fontSize(10)
                .font('Helvetica')
                .fillColor('black')
                .text(String(user.id), 50, y)
                .text(user.name.slice(0, 20), 90, y)
                .text(user.email.slice(0, 25), 180, y)
                .text(user.username.slice(0, 15), 330, y)
                .text(String(user.following), 420, y)
                .text(String(user.followers), 500, y);

            y += 18;
        });

        drawFooter();
        doc.end();

    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar PDF!", error: error.message });
    }
};


module.exports = { exportPostCSV, exportUserCSV, exportPostPDF, exportUserPDF };