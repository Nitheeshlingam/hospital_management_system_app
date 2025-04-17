import 'package:dio/dio.dart';
import 'package:hms_client/models/billing_records_model.dart';

class BillingRecordsServiceController {
  // Creating a base URL
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:5000/api/billings/records'),
  );

  // Creating a billing Record
  Future<void> createBillingRecord(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post("/", data: data);
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to create Billing Record: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get All Billing Record
  Future<List<BillingRecordsModel>> getAllBillingRecords() async {
    try {
      Response response = await dio.get("/");
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<BillingRecordsModel> billingRecords =
            jsonList.map((json) => BillingRecordsModel.fromJson(json)).toList();
        return billingRecords;
      }
      throw Exception(
        "Failed to fetch the Billing Records:${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get Billing Record by Id
  Future<BillingRecordsModel> getBillingRecordById(int id) async {
    try {
      Response response = await dio.get("/:id", queryParameters: {"id": id});
      if (response.statusCode == 200) {
        return BillingRecordsModel.fromJson(response.data);
      }
      throw Exception(
        "Failed to fetch the Billing Record: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Update Billing Record status
  Future<void> updateStatusOfBillingRecord(
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
        throw Exception("Failed to update the status of Billing Record: ${response.data['message']}");
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }
}
