require("dotenv").config();
const express = require("express");
const cors = require("cors");
const postRoutes = require("./src/routes/postRoutes");
const userRoutes = require("./src/routes/userRoutes");
const setupSwagger = require('./src/config/swagger.js'); 
const path = require("path");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
setupSwagger(app);

app.use("/uploads", express.static(path.join(__dirname, "uploads")));
app.use("/api", postRoutes);
app.use("/api", userRoutes);

app.listen(PORT, () => {
    console.log(`🌸 Servidor rodando em http://localhost:${PORT}`);
});
