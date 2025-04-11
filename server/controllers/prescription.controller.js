import { PrescriptionRecords, Prescription } from "../models/prescription.models.js";
import { successResponse, errorResponse } from '../utils/response.js';

// Creating a new Prescription
export const createPrescription = async (req, res) => {
    try {
        const { 
            treatment_records_id,
            doctorid,
            patientid,
            delivery_type,
            delivery_id,
            prescriptiondate,
            status
        } = req.body;
        const newPrescription = await Prescription.create({
            treatment_records_id,
            doctorid,
            patientid,
            delivery_type,
            delivery_id,
            prescriptiondate,
            status
        });
        return successResponse(res, "New prescription created", newPrescription);
    } catch (error) {
        return errorResponse(res, error.message);
    }
};

// Get a Particular Prescription by Id
export const getPrescriptionById = async (req, res) => {
    try {
        const { id } = req.params;
        const prescription = await Prescription.findByPk(id);
        if (!prescription) {
            return errorResponse(res, "No Prescription Id found", 404);
        }
        return successResponse(res, "Prescription Id found", prescription);
    } catch (error) {
        return errorResponse(res, error.message);
    }
};

// Get all Prescriptions
export const getAllPrescriptions = async (req, res) => {
    try {
        const prescriptions = await Prescription.findAll();
        if (!prescriptions) {
            return errorResponse(res, "No Prescription Id found", 404);
        }
        return successResponse(res, "Prescription Id found", prescriptions);
    } catch (error) {
        return errorResponse(res, error.message);
    }
};

// Update a field
export const updatePrescriptionField = async (req, res) => {
    try {
        const { id } = req.params;
        const { fieldName, fieldValue } = req.body;
        const updatedValues = {};
        updatedValues[fieldName] = fieldValue ;
        const updatedPrescription = await Prescription.update(updatedValues, { where: { prescriptionid: id } });
        if (updatedPrescription[0] === 0) {
            return errorResponse(res, "No Prescription Id found", 404);
        }
        return successResponse(res, "Updated the Prescription", updatedPrescription);
    } catch (error) {
        return errorResponse(res, error.message);
    }
};

// Delete a Particular Prescription by Id
export const deletePrescriptionById = async (req, res) => {
    try {
        const { id } = req.params;
        await Prescription.destroy({ where: { prescriptionid: id } });
        return successResponse(res, "Successfully deleted the Prescription", null);
    } catch (error) {
        return errorResponse(res, error.message);
    }
};

// Creating a new Prescription Record
export const createPrescriptionRecord = async (req, res) => {
    try {
        const { 
            prescription_id,
            medicine_name,
            cost,
            unit,
            dosage,
            status
         } = req.body;
        const newPrescriptionRecord = await PrescriptionRecords.create({
            prescription_id,
            medicine_name,
            cost,
            unit,
            dosage,
            status
        });
        return successResponse(res, "New Prescription Record Created", newPrescriptionRecord);
    } catch (error) {
        return errorResponse(res, error.message);
    }
};

// Get a Prescription Record by Id
export const getPrescriptionRecordById = async (req, res) => {
    try {
        const { id } = req.params;
        const prescriptionRecord = await PrescriptionRecords.findByPk(id);
        if (!prescriptionRecord) {
            return errorResponse(res, "No Prescription Record Id found", 404);
        }
        return successResponse(res, "Prescription Record Id found", prescriptionRecord);
    } catch (error) {
        return errorResponse(res, error.message);
    }
};

// Get all Prescription Records
export const getAllPrescriptionRecords = async (req, res) => {
    try {
        const prescriptionRecords = await PrescriptionRecords.findAll();
        if (!prescriptionRecords) {
            return errorResponse(res, "No Prescription Id found", 404);
        }
        return successResponse(res, "Prescription Id found", prescriptionRecords);
    } catch (error) {
        return errorResponse(res, error.message);
    }
};

// Delete a Prescription Record by Id
export const deletePrescriptionRecordById = async (req, res) => {
    try {
        const { id } = req.params;
        await PrescriptionRecords.destroy({ where: { prescription_record_id: id } });
        return successResponse(res, "Successfully Deleted the Prescription Record", null);
    } catch (error) {
        return errorResponse(res, error.message);
    }
};
