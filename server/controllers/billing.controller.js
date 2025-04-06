import { where } from "sequelize";
import { Billing, BillingRecords } from "../models/billing.models";
import { errorResponse, successResponse } from "../utils/response";

//Creating a New Billing
export const createBill = async (req, res) => {
  try {
    const {
      patientid,
      appointmentid,
      billingdate,
      billingtime,
      discount,
      taxamount,
      discountreason,
      discharge_time,
      discharge_date,
    } = req.body;
    await Billing.create(
      patientid,
      appointmentid,
      billingdate,
      billingtime,
      discount,
      taxamount,
      discountreason,
      discharge_time,
      discharge_date
    );
    return successResponse(res, "New Bill is added", null);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

//Fetching all the Billings
export const getAllBills = async (req, res) => {
  try {
    const bills = await Billing.findAll();
    return successResponse(res, "Got all bills", bills);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

//Fetching a bill by Primary Key
export const getBillById = async (req, res) => {
  try {
    const { id } = req.params;
    const bill = await Billing.findByPk(id);
    if (!bill) {
      return errorResponse(res, "Bill not found", 404);
    }
    return successResponse(res, "Bill found", bill);
  } catch (error) {
    return errorResponse(
      res,
      error.message || "Internal Server Error",
      error.statuscode
    );
  }
};

//Creating new Billing Records
export const createBillingRecord = async (req, res) => {
  try {
    const {
      billingid,
      billing_type_id,
      bill_type,
      bill_amount,
      bill_date,
      status,
    } = req.body;
    await BillingRecords.create(
      billingid,
      billing_type_id,
      bill_type,
      bill_amount,
      bill_date,
      status
    );
    return successResponse(res, "New bill record added", null);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

//Fetching all Billing Records
export const getAllBillingRecords = async (req, res) => {
  try {
    const billingRecords = await BillingRecords.findAll();
    return successResponse(res, "Fetched all Billing Records", billingRecords);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

//Fetch a Billing Record by Id
export const getBillingRecordById = async (req, res) => {
  try {
    const { id } = req.params;
    const billingRecords = await BillingRecords.findByPk(id);
    if (!bill) {
      return errorResponse(res, "Billing Record not found", 404);
    }
    return successResponse(res, "Billing Record found", billingRecords);
  } catch (error) {
    return errorResponse(
      res,
      error.message || "Internal Server Error",
      error.statuscode
    );
  }
};

//Update the Status of Biiling Record
export const updateStatusOfBillingRecord = async (req, res) => {
  try {
    const { id } = req.params;
    const { fieldName, fieldValue } = req.body;
    const updatedValues = { fieldName: fieldValue };
    const updatedBillingRecord = BillingRecords.update(updatedValues, {
      where: { id },
    });
    if (updatedBillingRecord[0] == 0) {
      return errorResponse(res, "Billing Record not found", 404);
    }
    return successResponse(
      res,
      "Successfully updated the status of the Billing Record",
      updatedBillingRecord
    );
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};
