import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hms_client/widgets/custom_password_field.dart';
import 'package:hms_client/widgets/custom_button.dart';
import 'package:hms_client/models/user_model.dart';
import 'package:hms_client/widgets/custom_snackbar.dart';
import 'package:hms_client/routes/routenames.dart';

class ResetPasswordController extends StatefulWidget {
  const ResetPasswordController({super.key});

  @override
  _ResetPasswordControllerState createState() =>
      _ResetPasswordControllerState();
}

class _ResetPasswordControllerState extends State<ResetPasswordController> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;

  void _resetPassword(BuildContext context, String input) {
    setState(() {
      _isLoading = true;
    });

    String newPassword = _newPasswordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    bool isSuccess = false;
    String message = "";

    if (newPassword.length < 4) {
      message = "Password must be at least 4 characters long";
    } else if (newPassword.isEmpty || confirmPassword.isEmpty) {
      message = "Fields cannot be empty";
    } else if (newPassword != confirmPassword) {
      message = "Passwords do not match";
    } else {
      int userIndex = UserModel.users.indexWhere(
        (user) => user.phoneNumber == input || user.email == input,
      );

      if (userIndex != -1) {
        UserModel updatedUser = UserModel(
          username: UserModel.users[userIndex].username,
          phoneNumber: UserModel.users[userIndex].phoneNumber,
          email: UserModel.users[userIndex].email,
          password: newPassword,
        );

        UserModel.users[userIndex] = updatedUser;
        isSuccess = true;
        message = "Password reset successfully!";
      } else {
        message = "User not found!";
      }
    }

    setState(() {
      _isLoading = false;
    });

    CustomSnackBar.show(
      context: context,
      message: message,
      isSuccess: isSuccess,
    );

    if (isSuccess) {
      Future.delayed(const Duration(milliseconds: 500), () {
        context.go(RouteNames.home);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String input = GoRouterState.of(context).extra as String? ?? '';

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 232, 255, 243),
                  Color.fromARGB(255, 200, 255, 229),
                ],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/app_logo.png',
                              height: 80,
                              width: 80,
                            ),
                            const Text(
                              "Hospital Management System",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Reset Password",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 28, 224, 142),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomPasswordField(
                              controller: _newPasswordController,
                              label: "New Password",
                            ),
                            const SizedBox(height: 15),
                            CustomPasswordField(
                              controller: _confirmPasswordController,
                              label: "Confirm Password",
                            ),
                            const SizedBox(height: 20),
                            CustomButton(
                              text: "Reset Password",
                              onPressed: () => _resetPassword(context, input),
                            ),
                          ],
                        ),
                      ),
                      if (_isLoading)
                        const Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.transparent,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 28, 224, 142),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
