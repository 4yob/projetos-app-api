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

        const drawCoverPage = () => {
            doc
                .font('Helvetica-Bold')
                .fontSize(30)
                .fillColor('#003366')
                .text("Relatório de Posts", { align: "center", valign: "center" })
                .moveDown(2);

            doc
                .fontSize(16)
                .fillColor('black')
                .text(`Gerado em: ${new Date().toLocaleString()}`, { align: "center" });

            doc.addPage();
        };

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
                .text("Conteúdo", 200)
                .text("Categoria", 350)
                .text("Likes", 450)
                .text("Comentários", 520);

            doc.moveTo(50, doc.y).lineTo(560, doc.y).stroke('#003366');
            doc.moveDown(0.3);
        };

        const drawFooter = () => {
            doc.fontSize(10).fillColor('gray');
            doc.text(`Página ${doc.page.number}`, 50, maxY + 10, { align: "left" });
            doc.text("Gerado em: " + new Date().toLocaleString(), 50, maxY + 10, { align: "right" });
        };

        const drawPageTitle = () => {
            doc.fontSize(16).fillColor('#003366').text("📄 Página de Relatório", 50, 30, { align: "center" });
        };

        const drawBorder = () => {
            doc.rect(45, 45, 520, maxY - 45).stroke('#003366');
        };

        drawCoverPage();
        drawPageTitle();
        drawBorder();
        drawHeader();

        let y = doc.y;
        posts.forEach((post, i) => {
            if (y > maxY) {
                drawFooter();
                doc.addPage();
                drawPageTitle();
                drawBorder();
                drawHeader();
                y = doc.y;
            }

            const isEven = i % 2 === 0;
            if (isEven) {
                doc.rect(50, y - 2, 510, 18).fill('#f2f2f2').stroke('#d9d9d9');
            } else {
                doc.rect(50, y - 2, 510, 18).stroke('#d9d9d9');
            }

            doc
                .fontSize(10)
                .font('Helvetica')
                .fillColor('black')
                .text(String(post.id).padEnd(10), 50, y)
                .text(post.title.length > 20 ? post.title.slice(0, 20) + '...' : post.title, 90, y)
                .text(post.content.length > 50 ? post.content.slice(0, 50) + '...' : post.content, 200, y)
                .text(post.categoria, 350, y)
                .text(String(post.likes), 450, y, { width: 50, align: "right" })
                .text(String(post.comments), 520, y, { width: 50, align: "right" });

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

        const drawCoverPage = () => {
            doc
                .font('Helvetica-Bold')
                .fontSize(30)
                .fillColor('#003366')
                .text("Relatório de Usuários", { align: "center", valign: "center" })
                .moveDown(2);

            doc
                .fontSize(16)
                .fillColor('black')
                .text(`Gerado em: ${new Date().toLocaleString()}`, { align: "center" });

            doc.addPage();
        };

        const drawHeader = () => {
            doc
                .font('Helvetica-Bold')
                .fontSize(24)
                .fillColor('#003366')
                .text("Relatório de Usuários", { align: "center" })
                .moveDown(1.2);

            doc
                .fontSize(12)
                .fillColor('black')
                .font('Helvetica-Bold')
                .text("ID", 50)
                .text("Nome", 90)
                .text("Email", 200)
                .text("Usuário", 350)
                .text("Seguindo", 450)
                .text("Seguidores", 520);

            doc.moveTo(50, doc.y).lineTo(560, doc.y).stroke('#003366');
            doc.moveDown(0.3);
        };

        const drawFooter = () => {
            doc.fontSize(10).fillColor('gray');
            doc.text(`Página ${doc.page.number}`, 50, maxY + 10, { align: "left" });
            doc.text("Gerado em: " + new Date().toLocaleString(), 50, maxY + 10, { align: "right" });
        };

        const drawPageTitle = () => {
            doc.fontSize(16).fillColor('#003366').text("📄 Página de Relatório", 50, 30, { align: "center" });
        };

        const drawBorder = () => {
            doc.rect(45, 45, 520, maxY - 45).stroke('#003366');
        };

        drawCoverPage();
        drawPageTitle();
        drawBorder();
        drawHeader();

        let y = doc.y;
        users.forEach((user, i) => {
            if (y > maxY) {
                drawFooter();
                doc.addPage();
                drawPageTitle();
                drawBorder();
                drawHeader();
                y = doc.y;
            }

            const isEven = i % 2 === 0;
            if (isEven) {
                doc.rect(50, y - 2, 510, 18).fill('#f9f9f9').stroke('#d9d9d9');
            } else {
                doc.rect(50, y - 2, 510, 18).stroke('#d9d9d9');
            }

            doc
                .fontSize(10)
                .font('Helvetica')
                .fillColor('black')
                .text(String(user.id).padEnd(10), 50, y)
                .text(user.name.length > 20 ? user.name.slice(0, 20) + '...' : user.name, 90, y)
                .text(user.email.length > 30 ? user.email.slice(0, 30) + '...' : user.email, 200, y)
                .text(user.username.length > 15 ? user.username.slice(0, 15) + '...' : user.username, 350, y)
                .text(String(user.following), 450, y, { width: 50, align: "right" })
                .text(String(user.followers), 520, y, { width: 50, align: "right" });

            y += 18;
        });

        drawFooter();
        doc.end();

    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar PDF!", error: error.message });
    }
};

module.exports = { exportPostCSV, exportUserCSV, exportPostPDF, exportUserPDF };