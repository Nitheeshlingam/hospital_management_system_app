import express from "express";
import {
  getAllDepartments,
  getDepartmentById,
  createDepartment,
  updateDepartment,
  deleteDepartment,
  addDepartments,
} from "../controllers/department.controller.js";

const router = express.Router();

router.get("/", getAllDepartments);
router.get("/:id", getDepartmentById);
router.post("/", createDepartment);
router.put("/:id", updateDepartment);
router.delete("/:id", deleteDepartment);
router.post("/bulk", addDepartments);

export default router;
