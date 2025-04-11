import { Admin } from "../models/user.models.js";
import { successResponse, errorResponse } from "../utils/response.js";

// Get all admins
export const getAllAdmins = async (req, res) => {
  try {
    const admins = await Admin.findAll({
      attributes: { exclude: ["password"] },
    });
    successResponse(res, "Admins retrieved successfully", admins);
  } catch (error) {
    console.error("Error retrieving admins:", error);
    errorResponse(res, "Failed to retrieve admins", 500);
  }
};

// Get admin by ID
export const getAdminById = async (req, res) => {
  try {
    const { id } = req.params;
    const admin = await Admin.findByPk(id, {
      attributes: { exclude: ["password"] },
    });

    if (!admin) {
      return errorResponse(res, "Admin not found", 404);
    }

    successResponse(res, "Admin retrieved successfully", admin);
  } catch (error) {
    console.error("Error retrieving admin:", error);
    errorResponse(res, "Failed to retrieve admin", 500);
  }
};

// Create new admin
export const createAdmin = async (req, res) => {
  try {
    const { adminname, loginid, password, status, usertype } = req.body;

    // Check if admin name already exists
    const existingAdmin = await Admin.findOne({ where: { adminname } });
    if (existingAdmin) {
      return errorResponse(res, "Admin name already exists", 409);
    }

    // Directly store the password without hashing
    const newAdmin = await Admin.create({
      adminname,
      loginid,
      password, // Directly storing the password
      status,
      usertype,
    });

    const adminWithoutPassword = {
      adminid: newAdmin.adminid,
      adminname: newAdmin.adminname,
      loginid: newAdmin.loginid,
      status: newAdmin.status,
      usertype: newAdmin.usertype,
    };

    successResponse(res, "Admin created successfully", adminWithoutPassword);
  } catch (error) {
    console.error("Error creating admin:", error);
    errorResponse(res, "Failed to create admin", 500);
  }
};

// Update admin
export const updateAdmin = async (req, res) => {
  try {
    const { id } = req.params;
    const { adminname, loginid, password, status, usertype } = req.body;

    const admin = await Admin.findByPk(id);
    if (!admin) {
      return errorResponse(res, "Admin not found", 404);
    }

    // Check if updating adminname and if it already exists
    if (adminname && adminname !== admin.adminname) {
      const existingAdmin = await Admin.findOne({ where: { adminname } });
      if (existingAdmin) {
        return errorResponse(res, "Admin name already exists", 409);
      }
    }

    // Update fields
    const updateData = { adminname, loginid, password, status, usertype }; // Directly updating password

    await admin.update(updateData);

    const updatedAdmin = await Admin.findByPk(id, {
      attributes: { exclude: ["password"] },
    });

    successResponse(res, "Admin updated successfully", updatedAdmin);
  } catch (error) {
    console.error("Error updating admin:", error);
    errorResponse(res, "Failed to update admin", 500);
  }
};

// Delete admin
export const deleteAdmin = async (req, res) => {
  try {
    const { id } = req.params;

    const admin = await Admin.findByPk(id);
    if (!admin) {
      return errorResponse(res, "Admin not found", 404);
    }

    await admin.destroy();
    successResponse(res, "Admin deleted successfully", null);
  } catch (error) {
    console.error("Error deleting admin:", error);
    errorResponse(res, "Failed to delete admin", 500);
  }
};

// Admin login
export const adminLogin = async (req, res) => {
  try {
    const { loginid, password } = req.body;

    const admin = await Admin.findOne({ where: { loginid } });
    if (!admin) {
      return errorResponse(res, "Invalid credentials", 401);
    }

    // Directly compare passwords without hashing
    if (password !== admin.password) {
      return errorResponse(res, "Invalid credentials", 401);
    }

    const adminData = {
      adminid: admin.adminid,
      adminname: admin.adminname,
      loginid: admin.loginid,
      status: admin.status,
      usertype: admin.usertype,
    };

    successResponse(res, "Login successful", adminData);
  } catch (error) {
    console.error("Error during login:", error);
    errorResponse(res, "Login failed", 500);
  }
};
