import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";

const Department = sequelize.define(
  "Department",
  {
    departmentid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    departmentname: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    status: {
      type: DataTypes.ENUM("Active", "Inactive"),
      allowNull: false,
    },
  },
  {
    tableName: "department",
    timestamps: false,
  }
);

export default Department;
