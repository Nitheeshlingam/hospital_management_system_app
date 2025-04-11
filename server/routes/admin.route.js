import express from "express";
import {
  getAllAdmins,
  getAdminById,
  createAdmin,
  updateAdmin,
  deleteAdmin,
  adminLogin,
} from "../controllers/admin.controller.js";

const router = express.Router();

// Get all admins
router.get("/", getAllAdmins);

// Get admin by ID
router.get("/:id", getAdminById);

// Create new admin
router.post("/", createAdmin);

// Admin login
router.post("/login", adminLogin);

// Update admin
router.put("/:id", updateAdmin);

// Delete admin
router.delete("/:id", deleteAdmin);

export default router;
