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
    return successResponse(
      res,
      "Fetched all Service Type records",
      serviceTypes
    );
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

    // First check if service exists
    const serviceType = await ServiceType.findByPk(id);
    if (!serviceType) {
      return errorResponse(res, "Service Type not found", 404);
    }

    await ServiceType.update({ status }, { where: { service_type_id: id } });

    // Fetch the updated record
    const updatedService = await ServiceType.findByPk(id);

    return successResponse(
      res,
      "Service Type status updated successfully",
      updatedService
    );
  } catch (error) {
    console.error("Error updating service type status:", error);
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Update the Particular Field in the Service Type
export const updateServiceTypeField = async (req, res) => {
  try {
    const { id } = req.params;

    // First check if service exists
    const serviceType = await ServiceType.findByPk(id);
    if (!serviceType) {
      return errorResponse(res, "Service Type not found", 404);
    }

    // Handle both single field update and full object update
    let updateData;
    if (req.body.fieldName && req.body.fieldValue) {
      // Single field update
      const { fieldName, fieldValue } = req.body;
      // Validate field name
      const validFields = [
        "service_type",
        "servicecharge",
        "description",
        "status",
      ];
      if (!validFields.includes(fieldName)) {
        return errorResponse(res, "Invalid field name", 400);
      }
      updateData = { [fieldName]: fieldValue };
    } else {
      // Full object update
      const { service_type, servicecharge, description, status } = req.body;
      updateData = {
        ...(service_type && { service_type }),
        ...(servicecharge && { servicecharge }),
        ...(description && { description }),
        ...(status && { status }),
      };
    }

    // Perform the update
    await ServiceType.update(updateData, {
      where: { service_type_id: id },
    });

    // Fetch the updated record
    const updatedService = await ServiceType.findByPk(id);

    return successResponse(
      res,
      "Service Type updated successfully",
      updatedService
    );
  } catch (error) {
    console.error("Error updating service type:", error);
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
