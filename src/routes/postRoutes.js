//Post Routes

const express = require("express");
const router = express.Router();
const postController = require("../controllers/postController");


router.get("/:id", postController.getPost);
router.get("/", postController.getAllPosts);
router.post("/", postController.createPost);
router.put("/:id", postController.updatePost);
router.delete("/:id", postController.deletePost);
router.delete("/delete/:id", postController.deletePostById);
router.post("/like/:postId", postController.likePost);


module.exports = router;