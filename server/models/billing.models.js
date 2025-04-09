import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";

const Billing = sequelize.define(
  "Billing",
  {
    billingid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    patientid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    appointmentid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    billingdate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    billingtime: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    discount: {
      type: DataTypes.FLOAT(10, 2),
      allowNull: false,
    },
    taxamount: {
      type: DataTypes.FLOAT(10, 2),
      allowNull: false,
    },
    discountreason: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    discharge_time: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    discharge_date: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
  },
  {
    tableName: "billing",
    timestamps: false,
  }
);

const BillingRecords = sequelize.define(
  "BillingRecords",
  {
    billingservice_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    billingid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    bill_type_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      comment: "id of service charge or treatment charge",
    },
    bill_type: {
      type: DataTypes.STRING(250),
      allowNull: false,
    },
    bill_amount: {
      type: DataTypes.FLOAT(10, 2),
      allowNull: false,
    },
    bill_date: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
  },
  {
    tableName: "billing_records",
    timestamps: false,
  }
);

const Payment = sequelize.define(
  "Payment",
  {
    paymentid: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    patientid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    appointmentid: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    paiddate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    paidtime: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    paidamount: {
      type: DataTypes.FLOAT(10, 2),
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
    cardholder: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    cardnumber: {
      type: DataTypes.BIGINT,
      allowNull: false,
    },
    cvvno: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    expdate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
  },
  {
    tableName: "payment",
    timestamps: false,
  }
);

export { Billing, BillingRecords, Payment };
