import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";

const Appointment = sequelize.define(
  "Appointment",
  {
    appointmentid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    appointmenttype: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    patientid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    roomid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    departmentid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    appointmentdate: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    appointmenttime: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    doctorid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
    app_reason: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
  },
  {
    tableName: "appointment",
    timestamps: false,
  }
);

const Treatment = sequelize.define(
  "Treatment",
  {
    treatmentid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    treatmenttype: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    treatment_cost: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
    },
    note: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
  },
  {
    tableName: "treatment",
    timestamps: false,
  }
);

const TreatmentRecords = sequelize.define(
  "TreatmentRecords",
  {
    treatment_records_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    treatmentid: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Treatment,
        key: "treatmentid",
      },
    },
    appointmentid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    patientid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    doctorid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    treatment_description: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    uploads: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    treatment_date: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    treatment_time: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
  },
  {
    tableName: "treatment_records",
    timestamps: false,
  }
);

export { Appointment, Treatment, TreatmentRecords };
