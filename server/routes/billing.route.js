import express from "express";
import { createBill, createBillingRecord, createPayment, getAllBillingRecords, getAllBills, getAllPaymentRecords, getBillById, getBillingRecordById, getPaymentRecordId, updateStatusOfBillingRecord, updateStatusOfPaymentRecord } from "../controllers/billing.controller";

const router = express.Router();

router.post("/", createBill);
router.get("/", getAllBills);
router.get("/:id", getBillById);
router.post("/records", createBillingRecord);
router.get("/records", getAllBillingRecords);
router.get("/records/:id", getBillingRecordById);
router.put("/records/:id", updateStatusOfBillingRecord);
router.post("/payment", createPayment);
router.get("/payment", getAllPaymentRecords);
router.get("/payment/:id", getPaymentRecordId);
router.put("/payment/:id", updateStatusOfPaymentRecord);

export default router;