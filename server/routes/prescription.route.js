import express from "express";
import {
  createPrescription,
  createPrescriptionRecord,
  deletePrescriptionById,
  deletePrescriptionRecordById,
  getAllPrescriptionRecords,
  getAllPrescriptions,
  getPrescriptionById,
  getPrescriptionRecordById,
  updatePrescriptionField,
} from "../controllers/prescription.controller.js";

const router = express.Router();

router.post("/", createPrescription);
router.get("/", getAllPrescriptions);
router.get("/:id", getPrescriptionById);
router.put("/:id", updatePrescriptionField);
router.delete("/:id", deletePrescriptionById);

router.post("/records", createPrescriptionRecord);
router.get("/records", getAllPrescriptionRecords);
router.get("/records/:id", getPrescriptionRecordById);
router.delete("/records/:id", deletePrescriptionRecordById);

export default router;
