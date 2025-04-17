import 'package:dio/dio.dart';
import 'package:hms_client/models/prescription_records_model.dart';

class PrescriptionRecordsServiceController {
  // Creating a Base URL
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:5000/api/prescriptions/records'),
  );

  // Creating a Prescription Record
  Future<void> createPrescription(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post("/", data: data);
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to create a Prescription Record: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get a Particular Prescription by Id
  Future<PrescriptionRecordsModel?> getPrescriptionRecordById(int id) async {
    try {
      Response response = await dio.get("/:id", queryParameters: {"id": id});
      if (response.statusCode == 200) {
        return PrescriptionRecordsModel.fromJson(response.data);
      }
      throw Exception(
        "Failed to fetcht the Prescription Record: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get all Prescription Records
  Future<List<PrescriptionRecordsModel>> getAllPrescriptionRecords() async {
    try {
      Response response = await dio.get("/");
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<PrescriptionRecordsModel> prescriptionRecords =
            jsonList
                .map((json) => PrescriptionRecordsModel.fromJson(json))
                .toList();
        return prescriptionRecords;
      }
      throw Exception(
        "Failed to fetch the Prescription Records: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Delete a Prescription Record by Id
  Future<void> deletePrescriptionRecordById(int id) async {
    try {
      Response response = await dio.delete("/:id", queryParameters: {"id": id});
      if (response.statusCode != 200) {
        throw Exception("Failed to delete a Prescription Record: ${response.data['message']}");
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }
}
