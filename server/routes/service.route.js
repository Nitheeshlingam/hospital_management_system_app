import express from "express";
import { createServiceType, deleteServiceTypeById, getAllServiceTypes, getServiceTypeById, updateServiceTypeField, updateServiceTypeStatus } from "../controllers/service.controller.js";

const router = express.Router();

router.post("/", createServiceType);
router.get("/", getAllServiceTypes);
router.get("/:id", getServiceTypeById);
router.put("/:id", updateServiceTypeStatus);
router.put("/update/:id", updateServiceTypeField);
router.delete("/:id", deleteServiceTypeById);

export default router;