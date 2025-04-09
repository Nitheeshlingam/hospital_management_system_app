import express from "express";
import { createDoctor, getAllDoctorDetails, getDoctorDetails, updateDoctorStatus } from "../controllers/doctor.controller";

const router = express.Router();

router.post("/", createDoctor);
router.get("/", getAllDoctorDetails);
router.get("/:id", getDoctorDetails);
router.put("/:id", updateDoctorStatus);

export default router;