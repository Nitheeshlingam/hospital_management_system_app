import { where } from "sequelize";
import ServiceType from "../models/service.models.js";
import { errorResponse, successResponse } from "../utils/response.js";

// Creating a new Service Type
export const createServiceType = async (req, res) => {
  try {
    const { service_type, servicecharge, description, status } = req.body;
    const newServiceType = await ServiceType.create({
      service_type,
      servicecharge,
      description,
      status,
    });
    return successResponse(res, "New Service Type Created", newServiceType);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Get all Service Types
export const getAllServiceTypes = async (req, res) => {
  try {
    const serviceTypes = await ServiceType.findAll();
    if (!serviceTypes) {
        return errorResponse(res, "No Service Types found", 404);
    }
    return successResponse(res, "Fetched all Service Type records", serviceTypes);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Get a Particular Service Type by Id
export const getServiceTypeById = async (req, res) => {
  try {
    const { id } = req.params;
    const serviceType = await ServiceType.findByPk(id);
    if (!serviceType) {
        return errorResponse(res, "No Service Type found", 404);
    }
    return successResponse(res, "Service Type record found", serviceType);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Update the Status of the Service Type
export const updateServiceTypeStatus = async (req, res) => {
  try {
    const { id } = req.params;
    const { status } = req.body;
    const updatedValue = {};
    updatedValue["status"] = status;
    const updatedServiceTypeRecord = await ServiceType.update(updatedValue, { where: { service_type_id: id } });
    if (updatedServiceTypeRecord[0] === 0) {
        return errorResponse(res, "No Service Type Record found", 404);
    }
    return successResponse(res, "Updated the Service Type Status Successfully", updatedServiceTypeRecord);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Update the Particular Field in the Service Type
export const updateServiceTypeField = async (req, res) => {
  try {
    const { id } = req.params;
    const { fieldName, fieldValue } = req.body;
    const updatedValue = {};
    updatedValue[fieldName] = fieldValue;
    const updatedServiceTypeRecord = await ServiceType.update(updatedValue, { where: { service_type_id: id } });
    if (updatedServiceTypeRecord[0] === 0) {
        return errorResponse(res, "No Service Type Record found", 404);
    }
    return successResponse(res, "Updated the Service Type Status Successfully", updatedServiceTypeRecord);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Delete a Particualr Service Type by Id
export const deleteServiceTypeById = async (req, res) => {
  try {
    const { id } = req.params;
    await ServiceType.destroy({ where: { service_type_id: id } });
    return successResponse(res, "Deleted the Service Type Successfully", null);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};
