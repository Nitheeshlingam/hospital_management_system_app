import Department from "../models/department.models.js";
import { successResponse, errorResponse } from "../utils/response.js";

export const getAllDepartments = async (req, res) => {
  try {
    const departments = await Department.findAll();
    return successResponse(
      res,
      "Departments retrieved successfully",
      departments
    );
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

export const getDepartmentById = async (req, res) => {
  try {
    const department = await Department.findByPk(req.params.id);
    if (!department) return errorResponse(res, "Department not found", 404);
    return successResponse(
      res,
      "Department retrieved successfully",
      department
    );
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

export const createDepartment = async (req, res) => {
  try {
    const newDepartment = await Department.create(req.body);
    return successResponse(res, "Department added successfully", newDepartment);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

export const updateDepartment = async (req, res) => {
  try {
    const department = await Department.findByPk(req.params.id);
    if (!department) return errorResponse(res, "Department not found", 404);

    await department.update(req.body);
    return successResponse(res, "Department updated successfully", department);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

export const deleteDepartment = async (req, res) => {
  try {
    const department = await Department.findByPk(req.params.id);
    if (!department) return errorResponse(res, "Department not found", 404);

    await department.destroy();
    return successResponse(res, "Department deleted successfully");
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

export const addDepartments = async (req, res) => {
  try {
    const departments = req.body;

    if (!Array.isArray(departments) || departments.length === 0) {
      return errorResponse(res, "Invalid input data", 400);
    }

    const newDepartments = await Department.bulkCreate(departments);

    return successResponse(
      res,
      "Departments added successfully",
      newDepartments
    );
  } catch (error) {
    return errorResponse(res, error.message);
  }
};
