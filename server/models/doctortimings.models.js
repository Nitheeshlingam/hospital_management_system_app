import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";

const DoctorTimings = sequelize.define(
  "DoctorTimings",
  {
    doctor_timings_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    doctorid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    start_time: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    end_time: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    available_day: {
      type: DataTypes.STRING(15),
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
  },
  {
    tableName: "doctor_timings",
    timestamps: false,
  }
);

export default DoctorTimings;
