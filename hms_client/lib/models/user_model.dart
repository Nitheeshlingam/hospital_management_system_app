class UserModel {
  final String username;
  final String password;
  final String phoneNumber;
  final String email;

  UserModel({
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.email,
  });

  static List<UserModel> users = [
    UserModel(
        username: "admin",
        password: "admin123",
        phoneNumber: "7695834209",
        email: "admin@gmail.com"),
    UserModel(
        username: "doctor",
        password: "docpass",
        phoneNumber: "9876543222",
        email: "doctor@gmail.com"),
    UserModel(
        username: "patient",
        password: "patientpass",
        phoneNumber: "9876543233",
        email: "patient@yahoo.com"),
  ];

  static Map<String, String> otpStorage = {};
}
