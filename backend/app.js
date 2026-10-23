
const express = require("express");

const app = express();
app.use(express.json());

app.get("/", (req, res) => {
  res.send("Welcome to PWC Project Backend!");
});

app.get("/api/message", (req, res) => {
  res.json({
    message: "Hello from PWC Project Backend!",
    status: "success",
    service: "Node.js Express"
  });
});

app.get("/api/health", (req, res) => {
  res.status(200).json({ status: "healthy" });
});

module.exports = app;
