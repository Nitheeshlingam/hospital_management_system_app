import express from "express";
import { addUser, findUserById, getAllPatients, updateField } from "../controllers/patient.controller.js";

const router = express.Router();

router.post('/', addUser);
router.get('/', getAllPatients);
router.get('/:id', findUserById);
router.put('/:id', updateField);

export default router;

