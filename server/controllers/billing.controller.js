import { Billing, BillingRecords, Payment } from "../models/billing.models.js";
import { errorResponse, successResponse } from "../utils/response.js";

// Create a new Billing
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

    if (
      !patientid ||
      !appointmentid ||
      !billingdate ||
      !billingtime ||
      discount == null ||
      taxamount == null ||
      !discountreason ||
      !discharge_time ||
      !discharge_date
    ) {
      return errorResponse(res, "All billing fields are required", 400);
    }

    const bill = await Billing.create({
      patientid,
      appointmentid,
      billingdate,
      billingtime,
      discount,
      taxamount,
      discountreason,
      discharge_time,
      discharge_date,
    });

    return successResponse(res, "New Bill is added", bill);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

// Get all Billings
export const getAllBills = async (req, res) => {
  try {
    const bills = await Billing.findAll();
    return successResponse(res, "Got all bills", bills);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

// Get Bill by ID
export const getBillById = async (req, res) => {
  try {
    const { id } = req.params;
    const bill = await Billing.findByPk(id);
    if (!bill) return errorResponse(res, "Bill not found", 404);
    return successResponse(res, "Bill found", bill);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Create a Billing Record
export const createBillingRecord = async (req, res) => {
  try {
    const {
      billingid,
      bill_type_id,
      bill_type,
      bill_amount,
      bill_date,
      status,
    } = req.body;

    if (
      !billingid ||
      !bill_type_id ||
      !bill_type ||
      bill_amount == null ||
      !bill_date ||
      !status
    ) {
      return errorResponse(res, "All billing record fields are required", 400);
    }

    const billingRecord = await BillingRecords.create({
      billingid: parseInt(billingid),
      bill_type_id: parseInt(bill_type_id),
      bill_type,
      bill_amount: parseFloat(bill_amount),
      bill_date,
      status,
    });
    return successResponse(res, "New bill record added", billingRecord);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Get all Billing Records
export const getAllBillingRecords = async (req, res) => {
  try {
    const billingRecords = await BillingRecords.findAll();
    console.log(billingRecords);
    return successResponse(res, "Fetched all Billing Records", billingRecords);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Get Billing Record by ID
export const getBillingRecordById = async (req, res) => {
  try {
    const { id } = req.params;
    const billingRecord = await BillingRecords.findByPk(id);
    if (!billingRecord)
      return errorResponse(res, "Billing Record not found", 404);
    return successResponse(res, "Billing Record found", billingRecord);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Update Billing Record status
export const updateStatusOfBillingRecord = async (req, res) => {
  try {
    const { id } = req.params;
    const { fieldValue } = req.body;

    const updated = await BillingRecords.update(
      { status: fieldValue },
      {
        where: { billingservice_id: parseInt(id) },
      }
    );

    if (updated[0] === 0)
      return errorResponse(res, "Billing Record not found", 404);

    return successResponse(res, "Billing Record status updated", updated);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Create Payment Record
export const createPayment = async (req, res) => {
  try {
    const {
      patientid,
      appointmentid,
      paiddate,
      paidtime,
      paidamount,
      status,
      cardholder,
      cardnumber,
      cvvno,
      expdate,
    } = req.body;

    if (
      !patientid ||
      !appointmentid ||
      !paiddate ||
      !paidtime ||
      paidamount == null ||
      !status ||
      !cardholder ||
      !cardnumber ||
      !cvvno ||
      !expdate
    ) {
      return errorResponse(res, "All payment fields are required", 400);
    }

    const payment = await Payment.create({
      patientid,
      appointmentid,
      paiddate,
      paidtime,
      paidamount,
      status,
      cardholder,
      cardnumber,
      cvvno,
      expdate,
    });

    return successResponse(res, "Payment created", payment);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

// Get all Payment Records
export const getAllPaymentRecords = async (req, res) => {
  try {
    const payments = await Payment.findAll();
    return successResponse(res, "Payment records fetched", payments);
  } catch (error) {
    return errorResponse(res, error.message);
  }
};

// Get Payment Record by ID
export const getPaymentRecordId = async (req, res) => {
  try {
    const { id } = req.params;
    const payment = await Payment.findByPk(id);
    if (!payment) return errorResponse(res, "Payment Record not found", 404);
    return successResponse(res, "Payment Record found", payment);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};

// Update Payment Record status
export const updateStatusOfPaymentRecord = async (req, res) => {
  try {
    const { id } = req.params;
    const { fieldValue } = req.body;

    const updated = await Payment.update(
      { status: fieldValue },
      { where: { paymentid: id } }
    );

    if (updated[0] === 0)
      return errorResponse(res, "Payment Record not found", 404);
    return successResponse(res, "Payment Record status updated", updated);
  } catch (error) {
    return errorResponse(res, error.message || "Internal Server Error");
  }
};
