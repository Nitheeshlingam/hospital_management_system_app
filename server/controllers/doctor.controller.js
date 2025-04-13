import { Doctor } from "../models/user.models.js";
import { errorResponse, successResponse } from "../utils/response.js";

//Create new Doctor
export const createDoctor = async (req, res) => {
  try {
    const {
      doctorname,
      mobileno,
      departmentid,
      loginid,
      password,
      status,
      education,
      experience,
      consultancy_charge,
    } = req.body;
    const doctor = await Doctor.create({
      doctorname,
      mobileno,
      departmentid,
      loginid,
      password,
      status,
      education,
      experience,
      consultancy_charge
    });
    return successResponse(res, "New Doctor created successfully", doctor);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

//Fetch All Doctor Details
export const getAllDoctorDetails = async (req, res) => {
  try {
    const doctors = await Doctor.findAll();
    if (!doctors) {
      return errorResponse(res, "No Doctors Details found", 404);
    }
    return successResponse(res, "Fetching All Doctor's Details", doctors);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

//Fetch the doctor details by Doctor Id
export const getDoctorDetails = async (req, res) => {
  try {
    const { id } = req.body;
    const doctor = await Doctor.findByPk(id);
    if (!doctor) {
      return errorResponse(res, "No Doctor found", 404);
    }
    return successResponse(res, "Doctor found", doctor);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

//Update the Doctor's Status
export const updateDoctorStatus = async (req, res) => {
  try {
    const { id } = req.params;
    const { fieldName, fieldValue } = req.body;
    const updatedValues = {};
    updatedValues[fieldName] = fieldValue;
    const updatedDoctorRecord = await Doctor.update(updatedValues, {
      where: { id },
    });
    if (updatedDoctorRecord[0] === 0) {
      return errorResponse(res, "No Doctor found", 404);
    }
    return successResponse(res, "Doctor Status Updated", updateDoctorStatus);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Login Doctor
export const loginDoctor = async (req, res) => {
  try {
    const { loginid, password } = req.body;
    const doctor = Doctor.findOne({
      where: {
        loginid: loginid,
        password: password
      }
    });
    if (!doctor) {
      return errorResponse(res, "No Doctor found", 404);
    }
    const doctorData = {
      doctorid: doctor.doctorid,
      doctorname: doctor.doctorname,
      mobileno: doctor.mobileno,
      departmentid: doctor.departmentid,
      loginid: loginid,
      password: password,
      status: doctor.status,
      education: doctor.education,
      experience: doctor.experience,
      consultancyCharge: doctor.consultancy_charge
    };
    return successResponse(res, "Doctor found and login successful", doctorData);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Delete a Doctor
export const deleteDoctor = async (req, res) => {
  try {
    const { id } = req.params;
    await Doctor.destroy({ where: { doctorid: id } });
    return successResponse(res, "Successfully Deleted Doctor", null);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};