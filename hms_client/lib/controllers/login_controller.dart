import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hms_client/widgets/custom_button.dart';
import 'package:hms_client/widgets/custom_password_field.dart';
import 'package:hms_client/widgets/custom_textfield.dart';
import 'package:hms_client/models/user_model.dart';
import 'package:hms_client/widgets/custom_snackbar.dart';
import 'package:hms_client/routes/routenames.dart';

class LoginController extends StatefulWidget {
  const LoginController({super.key});

  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    bool isValidUser = UserModel.users.any(
      (user) =>
          user.username == _usernameController.text.trim() &&
          user.password == _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    CustomSnackBar.show(
      context: context,
      message: isValidUser ? 'Login Successful' : 'Invalid Credentials',
      isSuccess: isValidUser,
    );

    if (isValidUser) {
      await Future.delayed(const Duration(milliseconds: 500));
      context.go(RouteNames.home);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => {context.push(RouteNames.home)},
                              child: Image.asset(
                                'assets/app_logo.png',
                                height: 80,
                                width: 80,
                              ),
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
                              "Login",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 28, 224, 142),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: _usernameController,
                              label: "Username",
                              icon: Icons.person,
                            ),
                            const SizedBox(height: 10),
                            CustomPasswordField(
                              controller: _passwordController,
                              label: "Password",
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value!;
                                        });
                                      },
                                      activeColor: const Color.fromARGB(
                                        255,
                                        35,
                                        192,
                                        126,
                                      ),
                                    ),
                                    const Text("Remember Me"),
                                  ],
                                ),
                                GestureDetector(
                                  onTap:
                                      () => context.push(
                                        RouteNames.forgotPassword,
                                      ),
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomButton(text: "Login", onPressed: _login),
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
