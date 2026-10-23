const express = require("express");
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Home API
app.get("/", (req, res) => {
  res.send("Welcome to PWC Project Backend!");
});

// Backend message API
app.get("/api/message", (req, res) => {
  res.json({
    message: "Hello from PWC Project Backend!",
    status: "success",
    service: "Node.js Express"
  });
});

// Health check API
app.get("/health", (req, res) => {
  res.status(200).json({
    status: "healthy"
  });
});

// Start server
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Backend running on port ${PORT}`);
});
