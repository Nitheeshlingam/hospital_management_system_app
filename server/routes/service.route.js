import express from "express";
import {
  createServiceType,
  deleteServiceTypeById,
  getAllServiceTypes,
  getServiceTypeById,
  updateServiceTypeField,
  updateServiceTypeStatus,
} from "../controllers/service.controller.js";

const router = express.Router();

// Order from most specific to least specific
router.post("/", createServiceType);
router.get("/", getAllServiceTypes);
router.put("/update/:id", updateServiceTypeField); // More specific route first
router.put("/:id", updateServiceTypeStatus); // Less specific route after
router.get("/:id", getServiceTypeById);
router.delete("/:id", deleteServiceTypeById);

export default router;
