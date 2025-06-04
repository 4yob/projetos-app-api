const PDFDocument = require("pdfkit");
const fs = require("fs");
const path = require("path");
const postModel = require("../models/postModel");

const exportPostsPDF = async (req, res) => {
    try {
        const posts = await postModel.getPosts(); 

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=posts.pdf");

        const doc = new PDFDocument({ margin: 40, size: "A4" });
        doc.pipe(res);

        const maxY = 760;
        const rowHeight = 20;

        const drawCoverPage = () => {
            const logoPath = path.join(__dirname, "../public/images/logo-glamsync.png");
            if (fs.existsSync(logoPath)) {
                doc.image(logoPath, doc.page.width / 2 - 75, 80, { width: 150 });
            }

            doc
                .font("Helvetica-Bold")
                .fontSize(24)
                .fillColor("#a94442")
                .text("Glamsync", { align: "center" });

            doc
                .font("Helvetica-Bold")
                .fontSize(28)
                .fillColor("#6b2e2e")
                .text("Relatório de Postagens", { align: "center" });

            doc
                .font("Helvetica-Oblique")
                .fontSize(14)
                .fillColor("#8d4d4d")
                .text("Moda que conecta. Estilo que impacta.", { align: "center" });

            doc
                .font("Helvetica")
                .fontSize(12)
                .fillColor("black")
                .text(`Gerado em: ${new Date().toLocaleString("pt-BR")}`, { align: "center" });

            doc.addPage();
        };

        const drawHeader = () => {
            const headerY = doc.y;

            doc
                .font("Helvetica-Bold")
                .fontSize(11)
                .fillColor("black");

            doc.text("ID", 50, headerY, { width: 30, align: "left" });
            doc.text("Usuário", 90, headerY, { width: 100, align: "left" });
            doc.text("Conteúdo", 200, headerY, { width: 180, align: "left" });
            doc.text("Likes", 390, headerY, { width: 50, align: "right" });
            doc.text("Data", 460, headerY, { width: 90, align: "right" });

            doc
                .moveTo(50, headerY + 15)
                .lineTo(550, headerY + 15)
                .stroke("#f4b6c2");

            doc.y = headerY + 20;
        };

        const drawFooter = () => {
            const footerY = 800;
            doc.fontSize(9).fillColor("gray");
            doc.text(`Página ${doc.page.number}`, 50, footerY, { align: "left" });
            doc.text("Glamsync", 0, footerY, { align: "right" });
        };

        // Capa
        drawCoverPage();

        // Tabela
        drawHeader();

        posts.forEach((post, i) => {
            if (doc.y > maxY - rowHeight) {
                drawFooter();
                doc.addPage();
                drawHeader();
            }

            const bgColor = i % 2 === 0 ? "#f9f3f5" : "#ffffff";
            doc.rect(50, doc.y - 2, 500, rowHeight).fill(bgColor).stroke("#f4b6c2");

            doc
                .fillColor("black")
                .font("Helvetica")
                .fontSize(10);

            doc.text(post.id || "", 50, doc.y, { width: 30, align: "left" });
            doc.text((post.user_name || "").slice(0, 20), 90, doc.y, { width: 100, align: "left" });
            doc.text((post.content || "").slice(0, 50), 200, doc.y, { width: 180, align: "left" });
            doc.text(String(post.likes ?? 0), 390, doc.y, { width: 50, align: "right" });
            doc.text(new Date(post.created_at).toLocaleDateString("pt-BR"), 460, doc.y, { width: 90, align: "right" });

            doc.y += rowHeight;
        });

        drawFooter();
        doc.end();

    } catch (error) {
        console.error("Erro ao gerar PDF de postagens:", error);
        res.status(500).json({ message: "Erro ao gerar PDF!", error: error.message });
    }
};

const exportUserPDF = async (req, res) => {
    try {
        const users = await userModel.getUsers(undefined); // Explicitamente pega todos os usuários

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=users.pdf");

        const doc = new PDFDocument({ margin: 40, size: "A4" });
        doc.pipe(res);

        const maxY = 760;

        const drawCoverPage = () => {
            doc
                .font("Helvetica-Bold")
                .fontSize(28)
                .fillColor("#2c3e50")
                .text("👥 Relatório de Usuários", { align: "center" })
                .moveDown(2);

            doc
                .font("Helvetica")
                .fontSize(14)
                .fillColor("black")
                .text(`Gerado em: ${new Date().toLocaleString()}`, { align: "center" });

            doc.addPage();
        };

        const drawHeader = () => {
            doc
                .font("Helvetica-Bold")
                .fontSize(18)
                .fillColor("#2980b9")
                .text("📄 Lista de Usuários", { align: "center" })
                .moveDown(0.5);

            doc
                .font("Helvetica-Bold")
                .fontSize(12)
                .fillColor("black")
                .text("ID", 50)
                .text("Nome", 100)
                .text("Email", 220)
                .text("Usuário", 370)
                .text("Seguindo", 460)
                .text("Seguidores", 520);

            doc.moveTo(50, doc.y).lineTo(560, doc.y).stroke("#2980b9");
            doc.moveDown(0.5);
        };

        const drawFooter = () => {
            doc.fontSize(9).fillColor("gray");
            doc.text(`Página ${doc.page.number}`, 50, maxY, { align: "left" });
            doc.text("RelatórioApp", 0, maxY, { align: "right" });
        };

        drawCoverPage();
        drawHeader();

        let y = doc.y;
        users.forEach((user, i) => {
            if (y > maxY - 40) {
                drawFooter();
                doc.addPage();
                drawHeader();
                y = doc.y;
            }

            const bgColor = i % 2 === 0 ? "#f8f9fa" : "#ffffff";
            doc
                .rect(50, y - 2, 510, 18)
                .fill(bgColor)
                .stroke("#bdc3c7");

            doc
                .fillColor("black")
                .font("Helvetica")
                .fontSize(10)
                .text(user.id || "", 50, y)
                .text((user.name || "").slice(0, 20), 100, y)
                .text((user.email || "").slice(0, 25), 220, y)
                .text((user.username || "").slice(0, 15), 370, y)
                .text(String(user.following ?? 0), 460, y)
                .text(String(user.followers ?? 0), 520, y);

            y += 18;
        });

        drawFooter();
        doc.end();
    } catch (error) {
        res
            .status(500)
            .json({ message: "Erro ao gerar PDF!", error: error.message });
    }
};

module.exports = {
    exportPostsPDF,
    exportUserPDF,
};
