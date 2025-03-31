import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hms_client/widgets/custom_textfield.dart';
import 'package:hms_client/widgets/custom_button.dart';
import 'package:hms_client/models/user_model.dart';
import 'package:hms_client/widgets/custom_snackbar.dart';
import 'package:hms_client/routes/routenames.dart';

class ForgotPasswordController extends StatefulWidget {
  const ForgotPasswordController({Key? key}) : super(key: key);

  @override
  _ForgotPasswordControllerState createState() =>
      _ForgotPasswordControllerState();
}

class _ForgotPasswordControllerState extends State<ForgotPasswordController> {
  final TextEditingController _inputController = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();
  bool isUsingEmail = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _inputFocusNode.dispose();
    _inputController.dispose();
    super.dispose();
  }

  Future<void> _sendOtp(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    String input = _inputController.text.trim();
    UserModel? user = UserModel.users.firstWhere(
      (u) => isUsingEmail ? u.email == input : u.phoneNumber == input,
      orElse:
          () =>
              UserModel(username: "", password: "", phoneNumber: "", email: ""),
    );

    bool isSuccess = user.username.isNotEmpty;

    setState(() {
      _isLoading = false;
    });

    CustomSnackBar.show(
      context: context,
      message:
          isSuccess
              ? "OTP sent successfully!"
              : "${isUsingEmail ? 'Email' : 'Phone number'} not registered",
      isSuccess: isSuccess,
    );

    if (isSuccess) {
      UserModel.otpStorage[input] = "123456";
      await Future.delayed(const Duration(milliseconds: 500));
      context.push(RouteNames.otpVerification, extra: input);
    }
  }

  void _switchInputMode(bool useEmail) {
    setState(() {
      isUsingEmail = useEmail;
      _inputController.clear();
    });

    _inputFocusNode.unfocus();
    Future.delayed(const Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(_inputFocusNode);
    });
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
                            const SizedBox(height: 12),
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
                              "Forgot Password",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 28, 224, 142),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300],
                              ),
                              child: Stack(
                                children: [
                                  AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                        isUsingEmail
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                    child: Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            isUsingEmail
                                                ? Colors.blue
                                                : Colors.green,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () => _switchInputMode(true),
                                          child: Center(
                                            child: Text(
                                              "Use Email",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    isUsingEmail
                                                        ? Colors.white
                                                        : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () => _switchInputMode(false),
                                          child: Center(
                                            child: Text(
                                              "Use Phone",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    !isUsingEmail
                                                        ? Colors.white
                                                        : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: _inputController,
                              focusNode: _inputFocusNode,
                              label: isUsingEmail ? "Email" : "Phone Number",
                              icon: isUsingEmail ? Icons.email : Icons.phone,
                              keyboardType:
                                  isUsingEmail
                                      ? TextInputType.emailAddress
                                      : TextInputType.phone,
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: "Send OTP",
                              onPressed: () => _sendOtp(context),
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
