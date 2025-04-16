import 'package:dio/dio.dart';
import 'package:hms_client/models/department_model.dart';

class DepartmentServiceController {
  // Creating base url
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:5000/api/doctors'),
  );

  // Create new Department
  Future<void> createDepartment(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post('/', data: data);
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to create Department: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get all Departments
  Future<List<DepartmentModel>> getAllDepartments() async {
    try {
      Response response = await dio.get("/");
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<DepartmentModel> departments =
            jsonList.map((json) => DepartmentModel.fromJson(json)).toList();
        return departments;
      }
      throw Exception(
        "Failed to fetch the Departments: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get Department By Id
  Future<DepartmentModel?> getDepartmentById(int id) async {
    try {
      Response response = await dio.get("/:id", queryParameters: {"id": id});
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to fetch the Department: ${response.data['message']}",
        );
      }
      return DepartmentModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Update the Department
  Future<void> updateDepartment(int id, Map<String, dynamic> data) async {
    try {
      Response response = await dio.post(
        "/:id",
        data: data,
        queryParameters: {"id": id},
      );
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to update the Department: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Delete Department
  Future<void> deleteDepartment(int id) async {
    try {
      Response response = await dio.delete("/:id");
      if (response.statusCode != 200) {
        throw Exception(
          "Failed to delete the Department: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Add Departments
  Future<void> addDepartments(List<Map<String, dynamic>> data) async {
    try {
      Response response = await dio.post("/bulk", data: data);
      if (response.statusCode != 200) {
        throw Exception("Failed to create Departments: ${response.data['messasge']}");
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }
}
