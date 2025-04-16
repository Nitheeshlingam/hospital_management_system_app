import 'package:dio/dio.dart';
import 'package:hms_client/models/billing_model.dart';

class BillingServiceController {
  // Creating Base Url
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:5000/api/billings'),
  );

  // Creating a new Bill
  Future<void> createBill(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post('/', data: data);
      if (response.statusCode != 200) {
        throw Exception("Failed to Create Admin: ${response.data['message']}");
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get All Billings
  Future<List<BillingModel>> getAllBills() async {
    try {
      Response response = await dio.get("/");
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<BillingModel> bills =
            jsonList.map((json) => BillingModel.fromJson(json)).toList();
        return bills;
      }
      throw Exception("Failed to fetch the Bills: ${response.data['message']}");
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get Bill by ID
  Future<BillingModel?> getBillById(int id) async {
    try {
      Response response = await dio.get("/:id", queryParameters: {"id": id});
      if (response.statusCode != 200) {
        throw Exception("Failed to fetch bill: ${response.data['message']}");
      }
      return BillingModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }
}
