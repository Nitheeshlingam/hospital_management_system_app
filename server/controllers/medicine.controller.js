import Medicine from "../models/medicine.model.js";
import { successResponse, errorResponse } from "../utils/response.js";

export const getAllMedicines = async (req, res) => {
  try {
    const medicines = await Medicine.findAll();
    return successResponse(res, "Medicines retrieved successfully", medicines);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

export const getMedicineById = async (req, res) => {
  try {
    const medicine = await Medicine.findByPk(req.params.id);
    if (!medicine) return errorResponse(res, "Medicine not found", 404);
    return successResponse(res, "Medicine retrieved successfully", medicine);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

export const createMedicine = async (req, res) => {
  try {
    const newMedicine = await Medicine.create(req.body);
    return successResponse(res, "Medicine added successfully", newMedicine);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

export const updateMedicine = async (req, res) => {
  try {
    const medicine = await Medicine.findByPk(req.params.id);
    if (!medicine) return errorResponse(res, "Medicine not found", 404);

    await medicine.update(req.body);
    return successResponse(res, "Medicine updated successfully", medicine);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

export const deleteMedicine = async (req, res) => {
  try {
    const medicine = await Medicine.findByPk(req.params.id);
    if (!medicine) return errorResponse(res, "Medicine not found", 404);

    await medicine.destroy();
    return successResponse(res, "Medicine deleted successfully");
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

export const bulkInsertMedicines = async (req, res) => {
  try {
    const medicines = req.body;

    if (!Array.isArray(medicines) || medicines.length === 0) {
      return res.status(400).json({
        success: false,
        message: "Invalid data format. Expected an array of medicines.",
      });
    }

    await Medicine.bulkCreate(medicines);

    return res.status(201).json({
      success: true,
      message: "Medicines added successfully",
    });
  } catch (error) {
    console.error("Error inserting medicines:", error);
    return res.status(500).json({
      success: false,
      message: "Failed to add medicines",
      error: error.message,
    });
  }
};
