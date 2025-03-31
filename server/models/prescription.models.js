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
    treatmentRecordsId: {
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
    deliveryType: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
    deliveryId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    prescriptionDate: {
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
    prescriptionRecordId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    prescriptionId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Prescription,
        key: "prescriptionid",
      },
    },
    medicineName: {
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

Prescription.hasMany(PrescriptionRecords, { foreignKey: "prescriptionId" });
PrescriptionRecords.belongsTo(Prescription, { foreignKey: "prescriptionId" });

const Orders = sequelize.define(
  "Orders",
  {
    orderId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    patientId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "user",
        key: "userid",
      },
    },
    doctorId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "user",
        key: "userid",
      },
    },
    prescriptionId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Prescription,
        key: "prescriptionid",
      },
    },
    orderDate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    deliveryDate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    address: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    mobileNo: {
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
    paymentType: {
      type: DataTypes.STRING(20),
      allowNull: false,
    },
    cardNo: {
      type: DataTypes.STRING(20),
      allowNull: false,
    },
    cvvNo: {
      type: DataTypes.STRING(5),
      allowNull: false,
    },
    expDate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    cardHolder: {
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
