import { Treatment, TreatmentRecords } from "../models/appointment.models.js";
import { successResponse, errorResponse } from "../utils/response.js";

// Get all treatments
export const getAllTreatments = async (req, res) => {
  try {
    const treatments = await Treatment.findAll();
    successResponse(res, "Treatments retrieved successfully", treatments);
  } catch (error) {
    console.error("Error retrieving treatments:", error);
    errorResponse(res, "Failed to retrieve treatments", 500);
  }
};

// Get treatment by ID
export const getTreatmentById = async (req, res) => {
  try {
    const { id } = req.params;
    const treatment = await Treatment.findByPk(id);

    if (!treatment) {
      return errorResponse(res, "Treatment not found", 404);
    }

    successResponse(res, "Treatment retrieved successfully", treatment);
  } catch (error) {
    console.error("Error retrieving treatment:", error);
    errorResponse(res, "Failed to retrieve treatment", 500);
  }
};

// Create new treatment
export const createTreatment = async (req, res) => {
  try {
    const { treatmenttype, treatment_cost, note, status } = req.body;

    const newTreatment = await Treatment.create({
      treatmenttype,
      treatment_cost,
      note,
      status,
    });

    successResponse(res, "Treatment created successfully", newTreatment);
  } catch (error) {
    console.error("Error creating treatment:", error);
    errorResponse(res, "Failed to create treatment", 500);
  }
};

// Update treatment
export const updateTreatment = async (req, res) => {
  try {
    const { id } = req.params;
    const { treatmenttype, treatment_cost, note, status } = req.body;

    const treatment = await Treatment.findByPk(id);
    if (!treatment) {
      return errorResponse(res, "Treatment not found", 404);
    }

    await treatment.update({
      treatmenttype,
      treatment_cost,
      note,
      status,
    });

    const updatedTreatment = await Treatment.findByPk(id);
    successResponse(res, "Treatment updated successfully", updatedTreatment);
  } catch (error) {
    console.error("Error updating treatment:", error);
    errorResponse(res, "Failed to update treatment", 500);
  }
};

// Delete treatment
export const deleteTreatment = async (req, res) => {
  try {
    const { id } = req.params;

    const treatment = await Treatment.findByPk(id);
    if (!treatment) {
      return errorResponse(res, "Treatment not found", 404);
    }

    await treatment.destroy();
    successResponse(res, "Treatment deleted successfully", null);
  } catch (error) {
    console.error("Error deleting treatment:", error);
    errorResponse(res, "Failed to delete treatment", 500);
  }
};

// Treatment Records Controllers

// Get all treatment records
export const getAllTreatmentRecords = async (req, res) => {
  try {
    const records = await TreatmentRecords.findAll();
    successResponse(res, "Treatment records retrieved successfully", records);
  } catch (error) {
    console.error("Error retrieving treatment records:", error);
    errorResponse(res, "Failed to retrieve treatment records", 500);
  }
};

// Get treatment record by ID
export const getTreatmentRecordById = async (req, res) => {
  try {
    const { id } = req.params;
    const record = await TreatmentRecords.findByPk(id);

    if (!record) {
      return errorResponse(res, "Treatment record not found", 404);
    }

    successResponse(res, "Treatment record retrieved successfully", record);
  } catch (error) {
    console.error("Error retrieving treatment record:", error);
    errorResponse(res, "Failed to retrieve treatment record", 500);
  }
};

// Create new treatment record
export const createTreatmentRecord = async (req, res) => {
  try {
    const {
      treatmentid,
      appointmentid,
      patientid,
      doctorid,
      treatment_description,
      uploads,
      treatment_date,
      treatment_time,
      status,
    } = req.body;

    const newRecord = await TreatmentRecords.create({
      treatmentid,
      appointmentid,
      patientid,
      doctorid,
      treatment_description,
      uploads,
      treatment_date,
      treatment_time,
      status,
    });

    successResponse(res, "Treatment record created successfully", newRecord);
  } catch (error) {
    console.error("Error creating treatment record:", error);
    errorResponse(res, "Failed to create treatment record", 500);
  }
};

// Update treatment record
export const updateTreatmentRecord = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      treatmentid,
      appointmentid,
      patientid,
      doctorid,
      treatment_description,
      uploads,
      treatment_date,
      treatment_time,
      status,
    } = req.body;

    const record = await TreatmentRecords.findByPk(id);
    if (!record) {
      return errorResponse(res, "Treatment record not found", 404);
    }

    await record.update({
      treatmentid,
      appointmentid,
      patientid,
      doctorid,
      treatment_description,
      uploads,
      treatment_date,
      treatment_time,
      status,
    });

    const updatedRecord = await TreatmentRecords.findByPk(id);
    successResponse(
      res,
      "Treatment record updated successfully",
      updatedRecord
    );
  } catch (error) {
    console.error("Error updating treatment record:", error);
    errorResponse(res, "Failed to update treatment record", 500);
  }
};

// Delete treatment record
export const deleteTreatmentRecord = async (req, res) => {
  try {
    const { id } = req.params;

    const record = await TreatmentRecords.findByPk(id);
    if (!record) {
      return errorResponse(res, "Treatment record not found", 404);
    }

    await record.destroy();
    successResponse(res, "Treatment record deleted successfully", null);
  } catch (error) {
    console.error("Error deleting treatment record:", error);
    errorResponse(res, "Failed to delete treatment record", 500);
  }
};
