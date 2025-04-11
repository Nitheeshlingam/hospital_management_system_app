import { Orders } from '../models/prescription.models.js';
import { errorResponse, successResponse } from '../utils/response.js';

// Creating a new Order
export const createOrder = async (req, res) => {
    try {
        const {
            patientid,
            doctorid,
            prescriptionid,
            orderdate,
            deliverydate,
            address,
            mobileno,
            note,
            status,
            payment_type,
            card_no,
            cvv_no,
            expdate,
            card_holder
        } = req.body;
        const newOrder = await Orders.create({
            patientid,
            doctorid,
            prescriptionid,
            orderdate,
            deliverydate,
            address,
            mobileno,
            note,
            status,
            payment_type,
            card_no,
            cvv_no,
            expdate,
            card_holder
        });
        return successResponse(res, "New order is created", newOrder);
    } catch (error) {
        return errorResponse(res, error.message || "Internal Server Error");
    }
};

// Getting a Particular Order by Id
export const getOrderById = async (req, res) => {
    try {
        const { id } = req.params;
        const order = await Orders.findByPk(id);
        if (!order) {
            return errorResponse(res, "No Order found", 404);           
        }
        return successResponse(res, "Order found", order);
    } catch (error) {
        return errorResponse(res, error.message || "Internal Server Error");
    }
};

// Getting all Orders
export const getAllOrders = async (req, res) => {
    try {
        const orders = await Orders.findAll();
        if (!orders) {
            return errorResponse(res, "No orders are there", 404);
        }
        return successResponse(res, "Orders details fetched", orders);
    } catch (error) {
        return errorResponse(res, error.message || "Internal Server Error");
    }
};

// Updating the fields in the Orders
export const updateOrderField = async (req, res) => {
    try {
        const { id } = req.params;
        const { fieldName, fieldValue } = req.body;
        const updatedValues = {};
        updatedValues[fieldName] = fieldValue;
        const updatedOrder = await Orders.update(updatedValues, { where: { orderid: id } });
        if (updatedOrder[0] === 0) {
            return errorResponse(res, "No Order found", 404);
        }
        return successResponse(res, "Order updated successfully", updatedOrder);
    } catch (error) {
        return errorResponse(res, error.message || "Internal Server Error");
    }
};

// Cancelling a Order
export const deleteOrderById = async (req, res) => {
    try {
        const { id } = req.params;
        await Orders.destroy({ where: { orderid: id } });
        return successResponse(res, "Order deleted successfully", null);
    } catch (error) {
        return errorResponse(res, error.message || "Internal Server Error");
    }
};