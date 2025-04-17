//Post Routes

const express = require("express");
const router = express.Router();
const postController = require("../controllers/postController");


router.get("/:id", postController.getPost);
router.get("/", postController.getAllPosts);
router.post("/", postController.createPost);


module.exports = router;