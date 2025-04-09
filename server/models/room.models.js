import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";

const Room = sequelize.define(
  "Room",
  {
    roomid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    roomtype: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    roomno: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    noofbeds: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    room_tariff: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
  },
  {
    tableName: "room",
    timestamps: false,
  }
);

export default Room;
