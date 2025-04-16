import 'package:dio/dio.dart';
import 'package:hms_client/models/medicine_model.dart';

class MedicineServiceController {
  // Creating Base url
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:5000/api/medicines'),
  );

  // Create Medicine
  Future<void> createMedicine(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post("/", data: data);
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to create Medicine: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get All Medicines
  Future<List<MedicineModel>> getAllMedicines() async {
    try {
      Response response = await dio.get("/");
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<MedicineModel> medicines =
            jsonList.map((json) => MedicineModel.fromJson(json)).toList();
        return medicines;
      }
      throw Exception(
        "Failed to fetch the Medicines: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get Medicine By Id
  Future<MedicineModel?> getMedicineById(int id) async {
    try {
      Response response = await dio.get("/:id");
      if (response.statusCode == 200) {
        return MedicineModel.fromJson(response.data);
      }
      throw Exception(
        "Failed to fetch the Medicine: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Update the Medicine
  Future<void> updateMedicine(int id, Map<String, dynamic> data) async {
    try {
      Response response = await dio.put(
        "/:id",
        data: data,
        queryParameters: {"id": id},
      );
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to update the Medicine: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Delete the Medicine
  Future<void> deleteMedicine(int id) async {
    try {
      Response response = await dio.delete("/:id");
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to delete Medicine: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Bulk Insertion Medicine
  Future<void> bulkInsertionMedicines(List<Map<String, dynamic>> data) async {
    try {
      Response response = await dio.post("/bulk", data: data);
      if (response.statusCode != 200) {
        throw Exception("Failed to create bulk Medicines: ${response.data['message']}");
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }
}
