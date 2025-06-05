const express = require("express");
const router = express.Router();
const reportController = require("../controllers/reportController");

//Rota para gerar PDF
router.get("/report/pdf/posts", reportController.exportPostsPDF);
router.get("/report/pdf/users", reportController.exportUsersPDF);
router.get("/report/pdf/notifications", reportController.exportNotificationsPDF);
router.get("/report/pdf/comments", reportController.exportCommentsPDF);
router.get("/report/pdf/chats", reportController.exportChatsPDF);
router.get("/report/pdf/categories", reportController.exportCategoriasPDF);

module.exports = router;    