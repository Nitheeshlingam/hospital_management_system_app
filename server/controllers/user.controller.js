import { User } from "../models/user.models.js";
import { successResponse, errorResponse } from "../utils/response.js";

// Get all users
export const getAllUsers = async (req, res) => {
  try {
    const users = await User.findAll({
      attributes: { exclude: ["password"] },
    });
    successResponse(res, "Users retrieved successfully", users);
  } catch (error) {
    console.error("Error retrieving users:", error);
    errorResponse(res, "Failed to retrieve users", 500);
  }
};

// Get user by ID
export const getUserById = async (req, res) => {
  try {
    const { id } = req.params;
    const user = await User.findByPk(id, {
      attributes: { exclude: ["password"] },
    });

    if (!user) {
      return errorResponse(res, "User not found", 404);
    }

    successResponse(res, "User retrieved successfully", user);
  } catch (error) {
    console.error("Error retrieving user:", error);
    errorResponse(res, "Failed to retrieve user", 500);
  }
};

// Create new user (register)
export const registerUser = async (req, res) => {
  try {
    const { loginname, password, patientname, mobileno, email } = req.body;

    // Check if loginname already exists
    const existingUser = await User.findOne({ where: { loginname } });
    if (existingUser) {
      return errorResponse(res, "Username already exists", 409);
    }

    // Check if email already exists
    const existingEmail = await User.findOne({ where: { email } });
    if (existingEmail) {
      return errorResponse(res, "Email already exists", 409);
    }

    // Directly store the password without hashing
    const newUser = await User.create({
      loginname,
      password, // Directly storing the password
      patientname,
      mobileno,
      email,
      createddateandtime: new Date(),
    });

    const userWithoutPassword = {
      userid: newUser.userid,
      loginname: newUser.loginname,
      patientname: newUser.patientname,
      mobileno: newUser.mobileno,
      email: newUser.email,
      createddateandtime: newUser.createddateandtime,
    };

    successResponse(res, "User registered successfully", userWithoutPassword);
  } catch (error) {
    console.error("Error registering user:", error);
    errorResponse(res, "Failed to register user", 500);
  }
};

// Update user
export const updateUser = async (req, res) => {
  try {
    const { id } = req.params;
    const { patientname, mobileno, email, password } = req.body;

    const user = await User.findByPk(id);
    if (!user) {
      return errorResponse(res, "User not found", 404);
    }

    // Check if updating email and if it already exists
    if (email && email !== user.email) {
      const existingEmail = await User.findOne({ where: { email } });
      if (existingEmail) {
        return errorResponse(res, "Email already exists", 409);
      }
    }

    // Update fields
    const updateData = { patientname, mobileno, email, password }; // Directly updating password

    await user.update(updateData);

    const updatedUser = await User.findByPk(id, {
      attributes: { exclude: ["password"] },
    });

    successResponse(res, "User updated successfully", updatedUser);
  } catch (error) {
    console.error("Error updating user:", error);
    errorResponse(res, "Failed to update user", 500);
  }
};

// Delete user
export const deleteUser = async (req, res) => {
  try {
    const { id } = req.params;

    const user = await User.findByPk(id);
    if (!user) {
      return errorResponse(res, "User not found", 404);
    }

    await user.destroy();
    successResponse(res, "User deleted successfully", null);
  } catch (error) {
    console.error("Error deleting user:", error);
    errorResponse(res, "Failed to delete user", 500);
  }
};

// User login
export const loginUser = async (req, res) => {
  try {
    const { loginname, password } = req.body;

    const user = await User.findOne({ where: { loginname } });
    if (!user) {
      return errorResponse(res, "Invalid credentials", 401);
    }

    // Directly compare passwords without hashing
    if (password !== user.password) {
      return errorResponse(res, "Invalid credentials", 401);
    }

    const userData = {
      userid: user.userid,
      loginname: user.loginname,
      patientname: user.patientname,
      mobileno: user.mobileno,
      email: user.email,
      createddateandtime: user.createddateandtime,
    };

    successResponse(res, "Login successful", userData);
  } catch (error) {
    console.error("Error during login:", error);
    errorResponse(res, "Login failed", 500);
  }
};
