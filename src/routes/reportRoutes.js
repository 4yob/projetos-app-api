const express = require("express");
const router = express.Router();
const reportController = require("../controllers/reportController");

//Rota para gerar CSV
router.get("/report/csv/users", reportController.exportUserCSV);
router.get("/report/csv/posts", reportController.exportPostCSV);

//Rota para gerar PDF
router.get("/report/pdf/users", reportController.exportUserPDF);
router.get("/report/pdf/posts", reportController.exportPostPDF);

module.exports = router;    