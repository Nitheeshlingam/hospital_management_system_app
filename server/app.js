import express from "express";
import cors from "cors";
import bodyParser from "body-parser";
import logger from "./utils/logger.js";
import sequelize from "./config/db.js";

import medicineRoutes from "./routes/medicine.route.js";
import departmentRoutes from "./routes/department.route.js";

const app = express();

app.use(cors());
app.use(bodyParser.json());
app.use(logger);

app.use("/api/medicines", medicineRoutes);
app.use("/api/departments", departmentRoutes);

app.get("/", (req, res) => {
  res.send("Hospital Management API is running...");
});

sequelize
  .sync()
  .then(() => console.log("✅ Database synced successfully"))
  .catch((err) => console.error("❌ Database sync error:", err));

export default app;
