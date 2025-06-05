const fs = require("fs");
const path = require("path");
const PDFDocument = require("pdfkit");
const { PassThrough } = require("stream");
const postModel = require("../models/postModel");
const userModel = require("../models/userModel");
const notificationModels = require("../models/notificationModel");
const commentsModel = require("../models/commentsModel");
const chatModel = require("../models/chatModel");

const exportPostsPDF = async (req, res) => {
    try {
        const posts = await postModel.getPosts();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=posts.pdf");

        const doc = new PDFDocument({ margin: 40, size: "A4" });
        const stream = new PassThrough();
        doc.pipe(stream);
        stream.pipe(res);

        const rowHeight = 22;
        const fontSize = 9;
        const textYOffset = (rowHeight - fontSize) / 2;
        const marginBottom = 50;
        const contentWidth = 500;

        const drawCoverPage = () => {
            const logoPath = path.join(__dirname, "../../public/logo.png");
            const logoSize = 80;
            const marginLeft = 50;
            const topY = 80;
        
            if (fs.existsSync(logoPath)) {

                doc.image(logoPath, marginLeft, topY, {
                    width: logoSize,
                    height: logoSize
                });
            }
        
            const textStartX = marginLeft + logoSize + 20;
            const textY = topY + 12;
        
            doc
                .font("Times-Bold")
                .fontSize(22)
                .fillColor("#6b2e2e")
                .text("Glamsync Posts", textStartX, textY);
        

            doc
                .moveDown(6)
                .font("Times-Roman")
                .fontSize(14)
                .fillColor("#8d4d4d")
                .text("Moda que conecta. Estilo que impacta.", textStartX, textY + 26);
                
            doc
                .font("Helvetica")
                .fontSize(10)
                .fillColor("#999")
                .text("Desenvolvido por: Evelyn Oliveira, Bruna Savelli, Alejandra Barros, Leonardo Oliveira, Ana Beatriz e Julia Neves.", textStartX, textY + 46);
        };
        
        const drawHeader = () => {
            const headerY = doc.y;
            doc.rect(50, headerY, contentWidth, rowHeight).fill("#d46a6a");

            doc
                .font("Helvetica-Bold")
                .fontSize(fontSize)
                .fillColor("white")
                .text("ID", 52, headerY + textYOffset, { width: 30, align: "left" })
                .text("Usuário", 90, headerY + textYOffset, { width: 100, align: "left" })
                .text("Conteúdo", 200, headerY + textYOffset, { width: 180, align: "left" })
                .text("Likes", 390, headerY + textYOffset, { width: 50, align: "right" })
                .text("Data", 460, headerY + textYOffset, { width: 90, align: "right" });

            doc.y = headerY + rowHeight + 1;
        };

        drawCoverPage();

        if (posts.length > 0) {
            doc.addPage();
            doc.y = 50; 
            drawHeader();

            posts.forEach((post, i) => {
                const maxY = doc.page.height - marginBottom;

                if (doc.y + rowHeight > maxY) {
                    doc.addPage();
                    doc.y = 50;
                    drawHeader();
                }

                const currentY = doc.y;
                const bgColor = i % 2 === 0 ? "#fdf5f7" : "#ffffff";

                doc.rect(50, currentY, contentWidth, rowHeight).fill(bgColor);

                doc
                    .fillColor("black")
                    .font("Helvetica")
                    .fontSize(fontSize)
                    .text(post.id || "", 52, currentY + textYOffset, { width: 30, align: "left", lineBreak: false })
                    .text((post.user_name || "").slice(0, 20), 90, currentY + textYOffset, { width: 100, align: "left", lineBreak: false })
                    .text((post.content || "").slice(0, 45), 200, currentY + textYOffset, { width: 180, align: "left", lineBreak: false })
                    .text(String(post.likes ?? 0), 390, currentY + textYOffset, { width: 50, align: "right", lineBreak: false })
                    .text(new Date(post.created_at).toLocaleDateString("pt-BR"), 460, currentY + textYOffset, { width: 90, align: "right", lineBreak: false });

                doc.y += rowHeight;
            });
        }
        doc.end();
    } catch (error) {
        console.error("Erro ao gerar PDF de postagens:", error);
        res.status(500).json({ message: "Erro ao gerar PDF!", error: error.message });
    }
};

const exportUsersPDF = async (req, res) => {
    try {
        const users = await userModel.getUsers();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=usuarios.pdf");

        const doc = new PDFDocument({ margin: 40, size: "A4" });
        const stream = new PassThrough();
        doc.pipe(stream);
        stream.pipe(res);

        const rowHeight = 22;
        const fontSize = 9;
        const textYOffset = (rowHeight - fontSize) / 2;
        const marginBottom = 50;
        const contentWidth = 500;

        const drawCoverPage = () => {
            const logoPath = path.join(__dirname, "../../public/logo.png");
            const logoSize = 80;
            const marginLeft = 50;
            const topY = 80;

            if (fs.existsSync(logoPath)) {
                doc.image(logoPath, marginLeft, topY, {
                    width: logoSize,
                    height: logoSize
                });
            }

            const textStartX = marginLeft + logoSize + 20;
            const textY = topY + 12;

            doc
                .font("Times-Bold")
                .fontSize(22)
                .fillColor("#6b2e2e")
                .text("Glamsync Usuários", textStartX, textY);

            doc
                .moveDown(6)
                .font("Times-Roman")
                .fontSize(14)
                .fillColor("#8d4d4d")
                .text("Moda que conecta. Estilo que impacta.", textStartX, textY + 26);

            doc
                .font("Helvetica")
                .fontSize(10)
                .fillColor("#999")
                .text("Desenvolvido por: Evelyn Oliveira, Bruna Savelli, Alejandra Barros, Leonardo Oliveira, Ana Beatriz e Julia Neves.", textStartX, textY + 46);
        };

        const drawHeader = () => {
            const headerY = doc.y;
            doc.rect(50, headerY, contentWidth, rowHeight).fill("#d46a6a");

            doc
                .font("Helvetica-Bold")
                .fontSize(fontSize)
                .fillColor("white")
                .text("ID", 52, headerY + textYOffset, { width: 30, align: "left" })
                .text("Nome", 90, headerY + textYOffset, { width: 100, align: "left" })
                .text("Username", 200, headerY + textYOffset, { width: 90, align: "left" })
                .text("Seguidores", 300, headerY + textYOffset, { width: 60, align: "right" })
                .text("Seguindo", 370, headerY + textYOffset, { width: 60, align: "right" })
                .text("Localização", 440, headerY + textYOffset, { width: 90, align: "right" });

            doc.y = headerY + rowHeight + 1;
        };

        drawCoverPage();

        if (users.length > 0) {
            doc.addPage();
            doc.y = 50;
            drawHeader();

            users.forEach((user, i) => {
                const maxY = doc.page.height - marginBottom;

                if (doc.y + rowHeight > maxY) {
                    doc.addPage();
                    doc.y = 50;
                    drawHeader();
                }

                const currentY = doc.y;
                const bgColor = i % 2 === 0 ? "#fdf5f7" : "#ffffff";
                doc.rect(50, currentY, contentWidth, rowHeight).fill(bgColor);

                doc
                    .fillColor("black")
                    .font("Helvetica")
                    .fontSize(fontSize)
                    .text(user.id || "", 52, currentY + textYOffset, { width: 30, align: "left", lineBreak: false })
                    .text((user.name || "").slice(0, 20), 90, currentY + textYOffset, { width: 100, align: "left", lineBreak: false })
                    .text((user.username || "").slice(0, 20), 200, currentY + textYOffset, { width: 90, align: "left", lineBreak: false })
                    .text(String(user.followers ?? 0), 300, currentY + textYOffset, { width: 60, align: "right", lineBreak: false })
                    .text(String(user.following ?? 0), 370, currentY + textYOffset, { width: 60, align: "right", lineBreak: false })
                    .text((user.location || "").slice(0, 20), 440, currentY + textYOffset, { width: 90, align: "right", lineBreak: false });

                doc.y += rowHeight;
            });
        }

        doc.end();
    } catch (error) {
        console.error("Erro ao gerar PDF de usuários:", error);
        res.status(500).json({ message: "Erro ao gerar PDF!", error: error.message });
    }
};

const exportNotificationsPDF = async (req, res) => {
    try {
        const notifications = await notificationModels.getNotifications();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=notificacoes.pdf");

        const doc = new PDFDocument({ margin: 40, size: "A4" });
        const stream = new PassThrough();
        doc.pipe(stream);
        stream.pipe(res);

        const rowHeight = 22;
        const fontSize = 9;
        const textYOffset = (rowHeight - fontSize) / 2;
        const marginBottom = 50;
        const contentWidth = 500;

        const drawCoverPage = () => {
            const logoPath = path.join(__dirname, "../../public/logo.png");
            const logoSize = 80;
            const marginLeft = 50;
            const topY = 80;

            if (fs.existsSync(logoPath)) {
                doc.image(logoPath, marginLeft, topY, {
                    width: logoSize,
                    height: logoSize
                });
            }

            const textStartX = marginLeft + logoSize + 20;
            const textY = topY + 12;

            doc
                .font("Times-Bold")
                .fontSize(22)
                .fillColor("#6b2e2e")
                .text("Glamsync Notificações", textStartX, textY);

            doc
                .moveDown(6)
                .font("Times-Roman")
                .fontSize(14)
                .fillColor("#8d4d4d")
                .text("Moda que conecta. Estilo que impacta.", textStartX, textY + 26);

            doc
                .font("Helvetica")
                .fontSize(10)
                .fillColor("#999")
                .text("Desenvolvido por: Evelyn Oliveira, Bruna Savelli, Alejandra Barros, Leonardo Oliveira, Ana Beatriz e Julia Neves.", textStartX, textY + 46);
        };

        const drawHeader = () => {
            const headerY = doc.y;
            doc.rect(50, headerY, contentWidth, rowHeight).fill("#d46a6a");

            doc
                .font("Helvetica-Bold")
                .fontSize(fontSize)
                .fillColor("white")
                .text("ID", 52, headerY + textYOffset, { width: 30, align: "left" })
                .text("Usuário", 90, headerY + textYOffset, { width: 60, align: "left" })
                .text("Mensagem", 160, headerY + textYOffset, { width: 160, align: "left" })
                .text("Post", 330, headerY + textYOffset, { width: 50, align: "right" })
                .text("Chat", 390, headerY + textYOffset, { width: 50, align: "right" })
                .text("Data", 450, headerY + textYOffset, { width: 90, align: "right" });

            doc.y = headerY + rowHeight + 1;
        };

        drawCoverPage();

        if (notifications.length > 0) {
            doc.addPage();
            doc.y = 50;
            drawHeader();

            notifications.forEach((notif, i) => {
                const maxY = doc.page.height - marginBottom;

                if (doc.y + rowHeight > maxY) {
                    doc.addPage();
                    doc.y = 50;
                    drawHeader();
                }

                const currentY = doc.y;
                const bgColor = i % 2 === 0 ? "#fdf5f7" : "#ffffff";
                doc.rect(50, currentY, contentWidth, rowHeight).fill(bgColor);

                doc
                    .fillColor("black")
                    .font("Helvetica")
                    .fontSize(fontSize)
                    .text(notif.id || "", 52, currentY + textYOffset, { width: 30, align: "left", lineBreak: false })
                    .text(String(notif.user_id || ""), 90, currentY + textYOffset, { width: 60, align: "left", lineBreak: false })
                    .text((notif.message || "").slice(0, 40), 160, currentY + textYOffset, { width: 160, align: "left", lineBreak: false })
                    .text(notif.post_id !== null ? String(notif.post_id) : "-", 330, currentY + textYOffset, { width: 50, align: "right", lineBreak: false })
                    .text(notif.chat_id !== null ? String(notif.chat_id) : "-", 390, currentY + textYOffset, { width: 50, align: "right", lineBreak: false })
                    .text(new Date(notif.created_at).toLocaleDateString("pt-BR"), 450, currentY + textYOffset, { width: 90, align: "right", lineBreak: false });

                doc.y += rowHeight;
            });
        }

        doc.end();
    } catch (error) {
        console.error("Erro ao gerar PDF de notificações:", error);
        res.status(500).json({ message: "Erro ao gerar PDF!", error: error.message });
    }
};

const exportCommentsPDF = async (req, res) => {
    try {
      const { username } = req.query;

      const comments = await commentsModel.getComments(username);
  
      res.setHeader("Content-Type", "application/pdf");
      res.setHeader("Content-Disposition", "inline; filename=comentarios.pdf");
  
      const doc = new PDFDocument({ margin: 40, size: "A4" });
      const stream = new PassThrough();
      doc.pipe(stream);
      stream.pipe(res);
  
      const rowHeight = 22;
      const fontSize = 9;
      const textYOffset = (rowHeight - fontSize) / 2;
      const marginBottom = 50;
      const contentWidth = 500;
  
      const drawCoverPage = () => {
        const logoPath = path.join(__dirname, "../../public/logo.png");
        const logoSize = 80;
        const marginLeft = 50;
        const topY = 80;
  
        if (fs.existsSync(logoPath)) {
          doc.image(logoPath, marginLeft, topY, {
            width: logoSize,
            height: logoSize,
          });
        }
  
        const textStartX = marginLeft + logoSize + 20;
        const textY = topY + 12;
  
        doc
          .font("Times-Bold")
          .fontSize(22)
          .fillColor("#6b2e2e")
          .text("Glamsync Comentários", textStartX, textY);
  
        doc
          .moveDown(6)
          .font("Times-Roman")
          .fontSize(14)
          .fillColor("#8d4d4d")
          .text("Moda que conecta. Estilo que impacta.", textStartX, textY + 26);
  
        doc
          .font("Helvetica")
          .fontSize(10)
          .fillColor("#999")
          .text(
            "Desenvolvido por: Evelyn Oliveira, Bruna Savelli, Alejandra Barros, Leonardo Oliveira, Ana Beatriz e Julia Neves.",
            textStartX,
            textY + 46
          );
      };
  
      const drawHeader = () => {
        const headerY = doc.y;
        doc.rect(50, headerY, contentWidth, rowHeight).fill("#d46a6a");
  
        doc
          .font("Helvetica-Bold")
          .fontSize(fontSize)
          .fillColor("white")
          .text("ID", 52, headerY + textYOffset, { width: 30, align: "left" })
          .text("Usuário", 90, headerY + textYOffset, { width: 90, align: "left" })
          .text("Comentário", 190, headerY + textYOffset, { width: 220, align: "left" })
          .text("Post ID", 420, headerY + textYOffset, { width: 50, align: "right" })
          .text("Data", 470, headerY + textYOffset, { width: 80, align: "right" });
  
        doc.y = headerY + rowHeight + 1;
      };
  
      drawCoverPage();
  
      if (comments.length > 0) {
        doc.addPage();
        doc.y = 50;
        drawHeader();
  
        comments.forEach((comment, i) => {
          const maxY = doc.page.height - marginBottom;
  
          if (doc.y + rowHeight > maxY) {
            doc.addPage();
            doc.y = 50;
            drawHeader();
          }
  
          const currentY = doc.y;
          const bgColor = i % 2 === 0 ? "#fdf5f7" : "#ffffff";
          doc.rect(50, currentY, contentWidth, rowHeight).fill(bgColor);
  
          doc
            .fillColor("black")
            .font("Helvetica")
            .fontSize(fontSize)
            .text(comment.id || "", 52, currentY + textYOffset, { width: 30, align: "left", lineBreak: false })
            .text((comment.user_name || "").slice(0, 20), 90, currentY + textYOffset, { width: 90, align: "left", lineBreak: false })
            .text((comment.text_comment || "").slice(0, 60), 190, currentY + textYOffset, { width: 220, align: "left", lineBreak: false })
            .text(String(comment.post_id || ""), 420, currentY + textYOffset, { width: 50, align: "right", lineBreak: false })
            .text(
              comment.created_at ? new Date(comment.created_at).toLocaleDateString("pt-BR") : "",
              470,
              currentY + textYOffset,
              { width: 80, align: "right", lineBreak: false }
            );
  
          doc.y += rowHeight;
        });
      }
  
      doc.end();
    } catch (error) {
      console.error("Erro ao gerar PDF de comentários:", error);
      res.status(500).json({ message: "Erro ao gerar PDF!", error: error.message });
    }
  };

  const exportChatsPDF = async (req, res) => {
    try {
      const { username } = req.query;
      const chats = await chatModel.getChats(username);
  
      res.setHeader("Content-Type", "application/pdf");
      res.setHeader("Content-Disposition", "inline; filename=chats.pdf");
  
      const doc = new PDFDocument({ margin: 40, size: "A4" });
      const stream = new PassThrough();
      doc.pipe(stream);
      stream.pipe(res);
  
      const rowHeight = 22;
      const fontSize = 9;
      const textYOffset = (rowHeight - fontSize) / 2;
      const marginBottom = 50;
      const contentWidth = 500;
  
      const drawCoverPage = () => {
        const logoPath = path.join(__dirname, "../../public/logo.png");
        const logoSize = 80;
        const marginLeft = 50;
        const topY = 80;
  
        if (fs.existsSync(logoPath)) {
          doc.image(logoPath, marginLeft, topY, {
            width: logoSize,
            height: logoSize,
          });
        }
  
        const textStartX = marginLeft + logoSize + 20;
        const textY = topY + 12;
  
        doc
          .font("Times-Bold")
          .fontSize(22)
          .fillColor("#6b2e2e")
          .text("Glamsync Chats", textStartX, textY);
  
        doc
          .moveDown(6)
          .font("Times-Roman")
          .fontSize(14)
          .fillColor("#8d4d4d")
          .text("Moda que conecta. Estilo que impacta.", textStartX, textY + 26);
  
        doc
          .font("Helvetica")
          .fontSize(10)
          .fillColor("#999")
          .text(
            "Desenvolvido por: Evelyn Oliveira, Bruna Savelli, Alejandra Barros, Leonardo Oliveira, Ana Beatriz e Julia Neves.",
            textStartX,
            textY + 46
          );
      };
  
      const drawHeader = () => {
        const headerY = doc.y;
        doc.rect(50, headerY, contentWidth, rowHeight).fill("#d46a6a");
  
        doc
          .font("Helvetica-Bold")
          .fontSize(fontSize)
          .fillColor("white")
          .text("ID", 52, headerY + textYOffset, { width: 30, align: "left" })
          .text("Usuário", 90, headerY + textYOffset, { width: 100, align: "left" })
          .text("Mensagem", 200, headerY + textYOffset, { width: 200, align: "left" })
          .text("Data", 410, headerY + textYOffset, { width: 90, align: "right" });
  
        doc.y = headerY + rowHeight + 1;
      };
  
      drawCoverPage();
  
      if (chats.length > 0) {
        doc.addPage();
        doc.y = 50;
        drawHeader();
  
        chats.forEach((chat, i) => {
          const maxY = doc.page.height - marginBottom;
  
          if (doc.y + rowHeight > maxY) {
            doc.addPage();
            doc.y = 50;
            drawHeader();
          }
  
          const currentY = doc.y;
          const bgColor = i % 2 === 0 ? "#fdf5f7" : "#ffffff";
  
          doc.rect(50, currentY, contentWidth, rowHeight).fill(bgColor);
  
          doc
            .fillColor("black")
            .font("Helvetica")
            .fontSize(fontSize)
            .text(chat.id || "", 52, currentY + textYOffset, { width: 30, align: "left", lineBreak: false })
            .text((chat.user_name || "").slice(0, 20), 90, currentY + textYOffset, { width: 100, align: "left", lineBreak: false })
            .text((chat.message || "").slice(0, 50), 200, currentY + textYOffset, { width: 200, align: "left", lineBreak: false })
            .text(
              chat.created_at ? new Date(chat.created_at).toLocaleDateString("pt-BR") : "",
              410,
              currentY + textYOffset,
              { width: 90, align: "right", lineBreak: false }
            );
  
          doc.y += rowHeight;
        });
      }
  
      doc.end();
    } catch (error) {
      console.error("Erro ao gerar PDF de chats:", error);
      res.status(500).json({ message: "Erro ao gerar PDF!", error: error.message });
    }
  };

module.exports = {
    exportPostsPDF,
    exportUsersPDF,
    exportNotificationsPDF,
    exportCommentsPDF,
    exportChatsPDF
};
