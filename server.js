require("dotenv").config();
const express = require("express");
const cors = require("cors");
const postRoutes = require("./src/routes/postRoutes");
const userRoutes = require("./src/routes/userRoutes");
const chatRoutes = require("./src/routes/chatRoutes");
const commentsRoutes = require("./src/routes/commentsRoutes");
const setupSwagger = require("./src/config/swagger.js");
const reportRoutes = require("./src/routes/reportRoutes");
const notificationsRoutes = require("./src/routes/notificationRoutes");
const categoriaRoutes = require("./src/routes/categoriaRoutes");

const path = require("path");

const app = express();
const PORT = process.env.PORT || 3000;

    app.use(cors());
app.use(express.json());
setupSwagger(app);

app.use("/uploads", express.static(path.join(__dirname, "uploads")));
app.use("/api", postRoutes);
app.use("/api", userRoutes);
app.use("/api", chatRoutes);
app.use("/api", commentsRoutes);
app.use("/api", reportRoutes);
app.use("/api", notificationsRoutes);
app.use("/api", categoriaRoutes);

app.listen(PORT, () => {
    console.log(`🌸 Servidor rodando em http://localhost:${PORT}`);
});
