import express from "express";
import { addUser, findUserById, updateField } from "../controllers/patient.controller.js";

const router = express.Router();

router.post('/', addUser);
router.get('/:id', findUserById);
router.put('/:id', updateField);

export default router;

