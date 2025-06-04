const express = require("express");
const router = express.Router();
const reportController = require("../controllers/reportController");

//Rota para gerar PDF
router.get("/report/pdf/users", reportController.exportUserPDF);
router.get("/report/pdf/posts", reportController.exportPostsPDF);

module.exports = router;    