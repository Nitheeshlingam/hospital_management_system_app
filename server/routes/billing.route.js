import express from "express";
import { createBill, createBillingRecord, getAllBillingRecords, getAllBills, getBillById, getBillingRecordById, updateStatusOfBillingRecord } from "../controllers/billing.controller";

const router = express.Router();

router.post("/", createBill);
router.get("/", getAllBills);
router.get("/:id", getBillById);
router.post("/records", createBillingRecord);
router.get("/records", getAllBillingRecords);
router.get("/records/:id", getBillingRecordById);
router.put("/records/:id", updateStatusOfBillingRecord);


export default router;