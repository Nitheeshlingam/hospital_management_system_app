import express from "express";
import { addUser, findUserById, getAllPatients, loginPatient, updateField } from "../controllers/patient.controller.js";

const router = express.Router();

router.post('/', addUser);
router.get('/', getAllPatients);
router.get('/:id', findUserById);
router.put('/:id', updateField);
router.post('/login', loginPatient);

export default router;

