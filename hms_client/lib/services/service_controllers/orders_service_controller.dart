import 'package:dio/dio.dart';
import 'package:hms_client/models/orders_model.dart';

class OrdersServiceController {
  // Creating a Base URL
  final Dio dio = Dio(BaseOptions(baseUrl: 'http://localhost:5000/api/orders'));

  // Creating a new Order
  Future<void> createOrder(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post("/", data: data);
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to create a Order: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Getting a Particular Order by ID
  Future<OrdersModel?> getOrderById(int id) async {
    try {
      Response response = await dio.get("/:id", queryParameters: {"id": id});
      if (response.statusCode == 200) {
        return OrdersModel.fromJson(response.data);
      }
      throw Exception(
        "Failed to fetch the Orders: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Getting all Orders
  Future<List<OrdersModel>> getAllOrders() async {
    try {
      Response response = await dio.get("/");
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<OrdersModel> orders =
            jsonList.map((json) => OrdersModel.fromJson(json)).toList();
        return orders;
      }
      throw Exception(
        "Failed to fetch the Orders: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Updating the fields in the Orders
  Future<void> updateOrderField(int id, Map<String, dynamic> data) async {
    try {
      Response response = await dio.put(
        "/:id",
        data: data,
        queryParameters: {"id": id},
      );
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to update the Order Field: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Cancelling a Order
  Future<void> deleteOrderById(int id) async {
    try {
      Response response = await dio.delete("/:id", queryParameters: {"id": id});
      if (response.statusCode != 200) {
        throw Exception("Failed to delete a Order: ${response.data['message']}");
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }
}
