//Post Routes

const express = require("express");
const router = express.Router();
const postController = require("../controllers/postController");


router.get("/:id", postController.getPost);


module.exports = router;