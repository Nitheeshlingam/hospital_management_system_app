import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";

const ServiceType = sequelize.define(
  "ServiceType",
  {
    service_type_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    service_type: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    servicecharge: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
  },
  {
    tableName: "service_type",
    timestamps: false,
  }
);

export default ServiceType;
