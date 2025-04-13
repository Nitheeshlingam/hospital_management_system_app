import 'package:dio/dio.dart';
import 'package:hms_client/models/admin_model.dart';

class AdminServiceController {
  // Creating Base Url
  final Dio dio = Dio(BaseOptions(baseUrl: 'http://localhost:5000/api/admins'));

  // Create new admin
  Future<AdminModel?> createAdmin(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post('/', data: data);
      if (response.statusCode == 200) {
        return AdminModel.fromJSON(response.data);
      }
      throw Exception("Failed to Create Admin: ${response.data['message']}");
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get admin by ID
  Future<AdminModel?> getAdminById(int id) async {
    try {
      Response response = await dio.get('/:id', queryParameters: {"id": id});
      if (response.statusCode == 200) {
        return AdminModel.fromJSON(response.data);
      }
      throw Exception(
        "Failed to fetch the Admin data: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Get all admins
  Future<List<AdminModel>> getAllAdmins() async {
    try {
      Response response = await dio.get('/');
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<AdminModel> admins =
            jsonList.map((json) => AdminModel.fromJSON(json)).toList();
        return admins;
      }
      throw Exception(
        "Failed to fetch the Admins: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Update admin
  Future<void> updateAdmin(int id, Map<String, dynamic> data) async {
    try {
      Response response = await dio.put(
        '/:id',
        data: data,
        queryParameters: {"id": id},
      );
      if (response.statusCode == 404) {
        throw Exception(
          "Failed to update the Admin: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Delete admin
  Future<void> deleteAdmin(int id) async {
    try {
      Response response = await dio.delete('/:id', queryParameters: {"id": id});
      if (response.statusCode == 404) {
        throw Exception("Failed to delete Admin: ${response.data['message']}");
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Admin login
  Future<bool> adminLogin(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post('/login', data: data);
      if (response.statusCode == 200) {
        return true;
      }
      throw Exception("Failed to Login through admin: ${response.data['message']}");
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

}
