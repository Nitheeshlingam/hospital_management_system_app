import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";

const User = sequelize.define(
  "User",
  {
    userid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    loginname: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING(255),
      allowNull: false,
    },
    patientname: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    mobileno: {
      type: DataTypes.STRING(15),
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    createddateandtime: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: DataTypes.NOW,
    },
  },
  {
    tableName: "user",
    timestamps: false,
  }
);

const Admin = sequelize.define(
  "Admin",
  {
    adminid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    adminname: {
      type: DataTypes.STRING(25),
      allowNull: false,
      unique: true,
    },
    loginid: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
    usertype: {
      type: DataTypes.STRING(30),
      allowNull: false,
    },
  },
  {
    tableName: "admin",
    timestamps: false,
  }
);

const Doctor = sequelize.define(
  "Doctor",
  {
    doctorid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    doctorname: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    mobileno: {
      type: DataTypes.STRING(15),
      allowNull: false,
    },
    departmentid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    loginid: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
    education: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    experience: {
      type: DataTypes.FLOAT(11, 1),
      allowNull: false,
    },
    consultancy_charge: {
      type: DataTypes.FLOAT(10, 2),
      allowNull: false,
    },
  },
  {
    tableName: "doctor",
    timestamps: false,
  }
);

const Patient = sequelize.define(
  "Patient",
  {
    patientid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    patientname: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    admissiondate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    admissiontime: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    address: {
      type: DataTypes.STRING(250),
      allowNull: false,
    },
    mobileno: {
      type: DataTypes.STRING(15),
      allowNull: false,
    },
    city: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    pincode: {
      type: DataTypes.STRING(20),
      allowNull: false,
    },
    loginid: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    bloodgroup: {
      type: DataTypes.STRING(20),
      allowNull: false,
    },
    gender: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
    dob: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
  },
  {
    tableName: "patient",
    timestamps: false,
  }
);

export { User, Admin, Doctor, Patient };
