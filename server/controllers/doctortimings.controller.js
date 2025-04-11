import DoctorTimings from "../models/doctortimings.models.js";

// Create doctor timing
export const createDoctorTiming = async (req, res) => {
  try {
    const newTiming = await DoctorTimings.create(req.body);
    res.status(201).json(newTiming);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get all doctor timings
export const getAllDoctorTimings = async (req, res) => {
  try {
    const timings = await DoctorTimings.findAll();
    res.status(200).json(timings);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get timing by ID
export const getDoctorTimingById = async (req, res) => {
  try {
    const timing = await DoctorTimings.findByPk(req.params.id);
    if (!timing)
      return res.status(404).json({ message: "Doctor timing not found" });
    res.status(200).json(timing);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Update timing
export const updateDoctorTiming = async (req, res) => {
  try {
    const updated = await DoctorTimings.update(req.body, {
      where: { doctor_timings_id: req.params.id },
    });
    res.status(200).json({ message: "Doctor timing updated", updated });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Delete timing
export const deleteDoctorTiming = async (req, res) => {
  try {
    await DoctorTimings.destroy({
      where: { doctor_timings_id: req.params.id },
    });
    res.status(200).json({ message: "Doctor timing deleted" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
