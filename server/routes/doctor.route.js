import express from "express";
import {
  createDoctor,
  getAllDoctorDetails,
  getDoctorDetails,
  loginDoctor,
  updateDoctorStatus,
} from "../controllers/doctor.controller.js";

const router = express.Router();

router.post("/", createDoctor);
router.get("/", getAllDoctorDetails);
router.get("/:id", getDoctorDetails);
router.put("/:id", updateDoctorStatus);
router.post("/login", loginDoctor);

export default router;
