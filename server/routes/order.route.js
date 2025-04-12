import express from "express";
import { createOrder, deleteOrderById, getAllOrders, getOrderById, updateOrderField } from "../controllers/order.controller.js";

const router = express.Router();

router.post("/", createOrder);
router.get("/", getAllOrders);
router.get("/:id", getOrderById);
router.put("/:id", updateOrderField);
router.delete("/:id", deleteOrderById);

export default router;