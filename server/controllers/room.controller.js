import Room from "../models/room.models.js";
import { errorResponse, successResponse } from "../utils/response.js";

// Creating a new Room
export const createRoom = async (req, res) => {
  try {
    const { roomtype, roomno, noofbeds, room_tariff, status } = req.body;
    const newRoom = await Room.create({
      roomtype,
      roomno,
      noofbeds,
      room_tariff,
      status,
    });
    return successResponse(res, "New Room created", newRoom);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Get a Particular Room by a Id
export const getRoomById = async (req, res) => {
  try {
    const { id } = req.params;
    const room = await Room.findByPk(id);
    if (!room) {
      return errorResponse(res, "Room not found", 404);
    }
    return successResponse(res, "Room found", room);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Get all the Rooms
export const getAllRooms = async (req, res) => {
  try {
    const rooms = await Room.findAll();
    if (!rooms) {
      return errorResponse(res, "No rooms found", 404);
    }
    return successResponse(res, "Fetched all Rooms", rooms);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Update the status of the Room
export const updateRoomStatus = async (req, res) => {
  try {
    const { id } = req.params;
    const { status } = req.body;
    const updatedValue = {};
    updatedValue["status"] = status;
    const updatedRoomStatus = await Room.update(updatedValue, {
      where: { roomid: id },
    });
    if (updateRoomStatus[0] === 0) {
      return errorResponse(res, "No room found", 404);
    }
    return successResponse(
      res,
      "Room Status updated successfully",
      updateRoomStatus
    );
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Update the field in the Room (Optional)
export const updateTheRoomField = async (req, res) => {
  try {
    const { id } = req.params;
    const { fieldName, fieldValue } = req.body;

    // First check if room exists
    const room = await Room.findByPk(id);
    if (!room) {
      return errorResponse(res, "Room not found", 404);
    }

    // Validate if fieldName is a valid column in Room model
    const validFields = [
      "roomtype",
      "roomno",
      "noofbeds",
      "room_tariff",
      "status",
    ];
    if (!validFields.includes(fieldName)) {
      return errorResponse(res, "Invalid field name", 400);
    }

    const updatedValue = {
      [fieldName]: fieldValue,
    };

    const updatedRoomField = await Room.update(updatedValue, {
      where: { roomid: id },
      returning: true, // This will return the updated record
    });

    // Fetch the updated room to return in response
    const updatedRoom = await Room.findByPk(id);

    return successResponse(res, "Room Field updated successfully", updatedRoom);
  } catch (error) {
    console.error("Error updating room field:", error);
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Delete a Room
export const deleteRoomById = async (req, res) => {
  try {
    const { id } = req.params;
    await Room.destroy({ where: { roomid: id } });
    return successResponse(res, "Room deleted successfully", null);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};
