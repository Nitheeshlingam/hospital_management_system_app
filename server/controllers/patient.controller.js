import { Patient } from "../models/user.models.js";
import { errorResponse, successResponse } from "../utils/response.js";

export const addUser = async (req, res) => {
  try {
    const {
      patientname,
      admissiondate,
      admissiontime,
      address,
      mobileno,
      city,
      pincode,
      loginid,
      password,
      bloodgroup,
      gender,
      dob,
      status,
    } = req.body;

    const newPatient = await Patient.create({
      patientname,
      admissiondate,
      admissiontime,
      address,
      mobileno,
      city,
      pincode,
      loginid,
      password,
      bloodgroup,
      gender,
      dob,
      status,
    });

    return successResponse(res, "New patient added successfully!", newPatient);
  } catch (error) {
    errorResponse(res, error.message);
  }
};

export const getAllPatients = async (req, res) => {
  try {
    const patients = await Patient.findAll();
    if (!patients) {
      return errorResponse(res, "No patients found!", 404);
    }
    return successResponse(res, "Patients found", patients);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

export const findUserById = async (req, res) => {
  try {
    const { id } = req.params;
    const patient = await Patient.findByPk(id);
    if (!patient) {
      return errorResponse(res, "User not found", 404);
    }
    return successResponse(res, "User found", patient);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

export const updateField = async (req, res) => {
  try {
    const { id } = req.params;
    const { fieldName, fieldValue } = req.body;

    // Create dynamic update object
    const updatedData = {};
    updatedData[fieldName] = fieldValue;

    const updatedPatient = await Patient.update(updatedData, {
      where: { patientid: id },
    });

    if (updatedPatient[0] === 0) {
      return errorResponse(res, "User not found", 404);
    }

    return successResponse(res, "Updated the field", null);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};
