import express from "express";
import {
  createDoctorTiming,
  getAllDoctorTimings,
  getDoctorTimingById,
  updateDoctorTiming,
  deleteDoctorTiming,
} from "../controllers/doctortimings.controller.js";

const router = express.Router();

router.post("/", createDoctorTiming);
router.get("/", getAllDoctorTimings);
router.get("/:id", getDoctorTimingById);
router.put("/:id", updateDoctorTiming);
router.delete("/:id", deleteDoctorTiming);

export default router;
