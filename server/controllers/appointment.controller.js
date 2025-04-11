import { Appointment } from "../models/appointment.models.js";

// Create new appointment
export const createAppointment = async (req, res) => {
  try {
    const newAppointment = await Appointment.create(req.body);
    res.status(201).json(newAppointment);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get all appointments
export const getAllAppointments = async (req, res) => {
  try {
    const appointments = await Appointment.findAll();
    res.status(200).json(appointments);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get appointment by ID
export const getAppointmentById = async (req, res) => {
  try {
    const appointment = await Appointment.findByPk(req.params.id);
    if (!appointment)
      return res.status(404).json({ message: "Appointment not found" });
    res.status(200).json(appointment);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Update appointment
export const updateAppointment = async (req, res) => {
  try {
    const updated = await Appointment.update(req.body, {
      where: { appointmentid: req.params.id },
    });
    res
      .status(200)
      .json({ message: "Appointment updated successfully", updated });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Delete appointment
export const deleteAppointment = async (req, res) => {
  try {
    await Appointment.destroy({ where: { appointmentid: req.params.id } });
    res.status(200).json({ message: "Appointment deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
