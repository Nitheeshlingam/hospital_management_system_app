import 'package:dio/dio.dart';
import 'package:hms_client/models/doctor_model.dart';

class DoctorServiceController {
  // Creating Base Url
  final Dio dio = Dio(BaseOptions(baseUrl: 'http:localhost:5000/api/dotors'));

  // Creating a new Doctor
  Future<void> createDoctor(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post("/", data: data);
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to Create a new Doctor: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Fetch All Doctor Details
  Future<List<DoctorModel>> getAllDoctorDetails() async {
    try {
      Response response = await dio.get("/");
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<DoctorModel> doctors =
            jsonList.map((json) => DoctorModel.fromJSON(json)).toList();
        return doctors;
      }
      throw Exception(
        "Failed to load Doctor details: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Fetch a Particular Doctor
  Future<DoctorModel?> getDoctorDetails(int id) async {
    try {
      Response response = await dio.get("/:id", queryParameters: {"id": id});
      if (response.statusCode == 200) {
        return DoctorModel.fromJSON(response.data);
      }
      throw Exception(
        "Failed to fetch the Doctor Details: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Update the Doctor's Status
  Future<bool?> updateDoctorStatus(int id, Map<String, dynamic> data) async {
    try {
      Response response = await dio.put(
        "/:id",
        data: data,
        queryParameters: {"id": id},
      );
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to update the Doctor field: ${response.data['message']}",
        );
      }
      return true;
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Login Doctor
  Future<DoctorModel?> loginDoctor(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post("/login", data: data);
      if (response.statusCode == 200) {
        return DoctorModel.fromJSON(response.data);
      }
      throw Exception("Failed to Login Doctor: ${response.data['message']}");
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Delete Doctor
  Future<bool?> deleteDoctor(int id) async {
    try {
      Response response = await dio.delete("/:id", queryParameters: {"id": id});
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to delete a Doctor: ${response.data['message']}",
        );
      }
      return true;
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }
}
