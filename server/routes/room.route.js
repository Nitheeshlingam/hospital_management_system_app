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

// Order routes from most specific to least specific
router.post("/", createRoom);
router.get("/", getAllRooms);
router.put("/update/:id", updateTheRoomField); // More specific route first
router.put("/:id", updateRoomStatus); // Less specific route after
router.get("/:id", getRoomById);
router.delete("/:id", deleteRoomById);

export default router;
