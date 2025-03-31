import express from "express";
import {
  getAllMedicines,
  getMedicineById,
  createMedicine,
  updateMedicine,
  deleteMedicine,
  bulkInsertMedicines,
} from "../controllers/medicine.controller.js";

const router = express.Router();

router.get("/", getAllMedicines);
router.get("/:id", getMedicineById);
router.post("/", createMedicine);
router.put("/:id", updateMedicine);
router.delete("/:id", deleteMedicine);
router.post("/bulk", bulkInsertMedicines);

export default router;
