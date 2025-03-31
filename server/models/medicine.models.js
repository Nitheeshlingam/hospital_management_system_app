import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";

const Medicine = sequelize.define(
  "Medicine",
  {
    medicineid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    medicinename: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    medicinecost: {
      type: DataTypes.FLOAT(10, 2),
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
    timestamps: false,
    tableName: "medicine",
  }
);

export default Medicine;
