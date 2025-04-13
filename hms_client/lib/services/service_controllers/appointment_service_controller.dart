import 'package:dio/dio.dart';
import 'package:hms_client/models/appointment_model.dart';

class AppointmentServiceController {
  
  // Creating Base Endpoint
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:5000/api/appointments'),
  );

  // Create new appointment
  Future<AppointmentModel?> createAppointment(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post('/', data: data);
      if (response.statusCode == 200) {
        return AppointmentModel.fromJson(response.data);
      }
      throw Exception(
        "Failed to Create Appointment: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception('Error Creating Appointment: $e');
    }
  }

  // Get all appointments
  Future<List<AppointmentModel>> getAllAppointments() async {
    try {
      Response response = await dio.get('/');
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<AppointmentModel> appointments =
            jsonList.map((json) => AppointmentModel.fromJson(json)).toList();
        return appointments;
      }
      throw Exception(
        "Failed to load Appointments: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Loading Appointments: $e");
    }
  }

  // Get appointment by ID
  Future<AppointmentModel?> getAppointmentById(int id) async {
    try {
      Response response = await dio.get('/:id', queryParameters: {"id": id});
      if (response.statusCode == 200) {
        return AppointmentModel.fromJson(response.data);
      }
      throw Exception(
        "Failed to get Appointment data: ${response.data['message']}",
      );
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Update appointment
  Future<void> updateAppointment(
    int id,
    String fieldName,
    var fieldValue,
  ) async {
    try {
      Response response = await dio.put(
        '/:id',
        data: {fieldName: fieldValue},
        queryParameters: {"id": id},
      );
      if (response.statusCode == 404) {
        throw Exception(
          "Updating Appointment Field Failed: ${response.data['message']}",
        );
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

  // Delete appointment
  Future<void> deleteAppointment(int id) async {
    try {
      Response response = await dio.delete('/:id', queryParameters: {"id": id});
      if (response.statusCode == 404) {
        throw Exception("Deleting Appointment Failed: ${response.data['message']}");
      }
    } catch (e) {
      throw Exception("Error Fetching Data: $e");
    }
  }

}
