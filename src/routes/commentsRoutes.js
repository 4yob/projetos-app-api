const express = require("express");
const router = express.Router();
const commentsController = require("../controllers/commentsController");

router.get("/comments", commentsController.getComments);
router.get("/comment/:id", commentsController.getCommentById);
router.post("/comment", commentsController.createComment);
router.put("/comment/:id", commentsController.updateComment);
router.delete("/comment/:id", commentsController.deleteComment);

module.exports = router;