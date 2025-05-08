const express = require("express");
const router = express.Router();
const chatController = require("../controllers/chatController");

router.get("/chat", chatController.getChats);
router.get("/chat/:id", chatController.getChatById);
router.post("/chat", chatController.createChat);
router.put("/chat/:id", chatController.updateChat);
router.delete("/chat/:id", chatController.deleteChat);

module.exports = router;