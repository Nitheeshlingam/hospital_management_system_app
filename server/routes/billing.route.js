import express from "express";
import {
  createBill,
  createBillingRecord,
  createPayment,
  getAllBillingRecords,
  getAllBills,
  getAllPaymentRecords,
  getBillById,
  getBillingRecordById,
  getPaymentRecordId,
  updateStatusOfBillingRecord,
  updateStatusOfPaymentRecord,
} from "../controllers/billing.controller.js";

const router = express.Router();

router.post("/records", createBillingRecord);
router.get("/records", getAllBillingRecords);
router.get("/records/:id", getBillingRecordById);
router.put("/records/:id", updateStatusOfBillingRecord);

router.post("/payment", createPayment);
router.get("/payment", getAllPaymentRecords);
router.get("/payment/:id", getPaymentRecordId);
router.put("/payment/:id", updateStatusOfPaymentRecord);

router.post("/", createBill);
router.get("/", getAllBills);
router.get("/:id", getBillById);

export default router;
