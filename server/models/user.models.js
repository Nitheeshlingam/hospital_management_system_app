import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";

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

const User = sequelize.define(
  "User",
  {
    userId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    loginName: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING(255), // For hashed passwords
      allowNull: false,
    },
    patientName: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    mobileNo: {
      type: DataTypes.STRING(15),
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING(50),
      allowNull: false,
      validate: {
        isEmail: true, // Ensures valid email format
      },
    },
    createdDateTime: {
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

const Patient = sequelize.define(
  "Patient",
  {
    patientid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    patientName: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    admissionDate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    admissionTime: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    address: {
      type: DataTypes.STRING(250),
      allowNull: false,
    },
    mobileNo: {
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
    loginId: {
      type: DataTypes.STRING(50),
      allowNull: false,
      unique: true,
    },
    password: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    bloodGroup: {
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

export default Patient;

export { User, Doctor, Admin, Patient };
