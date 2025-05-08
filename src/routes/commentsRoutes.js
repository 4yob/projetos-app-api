const express = require("express");
const router = express.Router();
const commentsController = require("../controllers/commentsController");

router.get("/comments", commentsController.getComments);
router.get("/comments/:id", commentsController.getCommentById);
router.post("/comments", commentsController.createComment);
router.put("/comments/:id", commentsController.updateComment);
router.delete("/comments/:id", commentsController.deleteComment);

module.exports = router;