import 'package:dio/dio.dart';
import 'package:hms_client/models/prescription_model.dart';

class PrescriptionServiceController {
  // Creating a Bsae URL
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:5000/api/prescriptions'),
  );

  // Creating a new Prescription
  Future<void> createPrescription(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post("/", data: data);
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to create a Prescription: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get a Particular Prescription by Id
  Future<PrescriptionModel?> getPrescriptionById(int id) async {
    try {
      Response response = await dio.get("/:id", queryParameters: {"id": id});
      if (response.statusCode == 200) {
        return PrescriptionModel.fromJson(response.data);
      }
      throw Exception(
        "Failed to fetch the Prescription: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get all Prescriptions
  Future<List<PrescriptionModel>> getAllPrescriptions() async {
    try {
      Response response = await dio.get("/");
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<PrescriptionModel> prescriptions =
            jsonList.map((json) => PrescriptionModel.fromJson(json)).toList();
        return prescriptions;
      }
      throw Exception(
        "Failed to fetch the Prescriptions: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Update a field
  Future<void> updatePrescriptionField(
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
        throw Exception(
          "Failed to update the Prescription Field: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Delete a Particular Prescription by Id
  Future<void> deletePrescriptionById(int id) async {
    try {
      Response response = await dio.delete("/:id", queryParameters: {"id": id});
      if (response.statusCode != 200) {
        throw Exception("Failed to delete the Prescription: ${response.data['message']}");
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }
}
