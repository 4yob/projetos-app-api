const express = require('express');
const router = express.Router();
const loginController = require('../src/controllers/loginController');

router.post("/login", loginController.login);

module.exports = router;