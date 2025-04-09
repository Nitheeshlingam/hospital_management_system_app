import express from "express";
import cors from "cors";
import logger from "./utils/logger.js";
import sequelize from "./config/db.js";

import medicineRoutes from "./routes/medicine.route.js";
import departmentRoutes from "./routes/department.route.js";
import patientRoutes from "./routes/patient.route.js";
import billingRoutes from "./routes/billing.route.js";
import doctorRoutes from "./routes/doctor.route.js";

const app = express();

app.use(cors());
app.use(logger);
app.use(express.json());

app.use("/api/medicines", medicineRoutes);
app.use("/api/departments", departmentRoutes);
app.use("/api/patients", patientRoutes);
app.use("/api/billings", billingRoutes);
app.use("/api/doctors", doctorRoutes);

app.get("/", (req, res) => {
  res.send("Hospital Management API is running...");
});

sequelize
  .sync()
  .then(() => console.log("✅ Database synced successfully"))
  .catch((err) => console.error("❌ Database sync error:", err));

export default app;
