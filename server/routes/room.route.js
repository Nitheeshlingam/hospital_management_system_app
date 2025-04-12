import express from "express";
import {
  createRoom,
  deleteRoomById,
  getAllRooms,
  getRoomById,
  updateRoomStatus,
  updateTheRoomField,
} from "../controllers/room.controller.js";

const router = express.Router();

router.post("/", createRoom);
router.get("/:id", getRoomById);
router.get("/", getAllRooms);
router.put("/:id", updateRoomStatus);
router.put("/update/:id", updateTheRoomField);
router.delete("/:id", deleteRoomById);

export default router;
