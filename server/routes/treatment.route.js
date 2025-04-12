import express from "express";
import {
  getAllTreatments,
  getTreatmentById,
  createTreatment,
  updateTreatment,
  deleteTreatment,
  getAllTreatmentRecords,
  getTreatmentRecordById,
  createTreatmentRecord,
  updateTreatmentRecord,
  deleteTreatmentRecord,
} from "../controllers/treatment.controller.js";

const router = express.Router();

// Treatment Records routes (place these BEFORE the /:id route)
router.get("/records", getAllTreatmentRecords);
router.get("/records/:id", getTreatmentRecordById);
router.post("/records", createTreatmentRecord);
router.put("/records/:id", updateTreatmentRecord);
router.delete("/records/:id", deleteTreatmentRecord);

// Treatment routes
router.get("/", getAllTreatments);
router.post("/", createTreatment);
router.get("/:id", getTreatmentById); // Move this after /records routes
router.put("/:id", updateTreatment);
router.delete("/:id", deleteTreatment);

export default router;
