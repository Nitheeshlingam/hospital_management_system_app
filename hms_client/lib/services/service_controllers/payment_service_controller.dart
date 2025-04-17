import 'package:dio/dio.dart';
import 'package:hms_client/models/payment_model.dart';

class PaymentServiceController {
  // Creating a base URL
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:5000/api/billings/payment'),
  );

  // Create a Payment Record
  Future<void> createPayment(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post("/", data: data);
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to create Payment Record: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get All Payment Records
  Future<List<PaymentModel>> getAllPaymentRecords() async {
    try {
      Response response = await dio.get("/");
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<PaymentModel> payments =
            jsonList.map((json) => PaymentModel.fromJson(json)).toList();
        return payments;
      }
      throw Exception(
        "Failed to fetch the Payment Records: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get Payment Record by Id
  Future<PaymentModel?> getPaymentRecordById(int id) async {
    try {
      Response response = await dio.get("/:id", queryParameters: {"id": id});
      if (response.statusCode == 200) {
        return PaymentModel.fromJson(response.data);
      }
      throw Exception(
        "Failed to fetch the Payment Record: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Update Payment Record Status
  Future<void> updateStatusOfPaymentRecord(
    int id,
    Map<String, dynamic> data,
  ) async {
    try {
      Response response = await dio.put(
        "/:id",
        data: data,
        queryParameters: {"id": id},
      );
      if (response.statusCode != 200) {
        throw Exception("Failed to update the status of the Payment Record: ${response.data['message']}");
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }
}
