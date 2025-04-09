import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";

const Prescription = sequelize.define(
  "Prescription",
  {
    prescriptionid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    treatment_records_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "treatment_records",
        key: "treatment_records_id",
      },
    },
    doctorid: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "user",
        key: "userid",
      },
    },
    patientid: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "user",
        key: "userid",
      },
    },
    delivery_type: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
    delivery_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    prescriptiondate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
  },
  {
    tableName: "prescription",
    timestamps: false,
  }
);

const PrescriptionRecords = sequelize.define(
  "PrescriptionRecords",
  {
    prescription_record_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    prescription_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Prescription,
        key: "prescriptionid",
      },
    },
    medicine_name: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    cost: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
    },
    unit: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    dosage: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
  },
  {
    tableName: "prescription_records",
    timestamps: false,
  }
);

const Orders = sequelize.define(
  "Orders",
  {
    orderid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    patientid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    doctorid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    prescriptionid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    orderdate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    deliverydate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    address: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    mobileno: {
      type: DataTypes.STRING(15),
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
    payment_type: {
      type: DataTypes.STRING(20),
      allowNull: false,
    },
    card_no: {
      type: DataTypes.STRING(20),
      allowNull: false,
    },
    cvv_no: {
      type: DataTypes.STRING(5),
      allowNull: false,
    },
    expdate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    card_holder: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
  },
  {
    tableName: "orders",
    timestamps: false,
  }
);

export { Prescription, PrescriptionRecords, Orders };
