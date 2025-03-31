import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:hms_client/widgets/custom_button.dart';
import 'package:hms_client/models/user_model.dart';
import 'package:hms_client/widgets/custom_snackbar.dart';
import 'package:hms_client/routes/routenames.dart';
import 'dart:async';

class OTPVerificationController extends StatefulWidget {
  const OTPVerificationController({Key? key, required this.input})
    : super(key: key);

  final String input;

  @override
  _OTPVerificationControllerState createState() =>
      _OTPVerificationControllerState();
}

class _OTPVerificationControllerState extends State<OTPVerificationController> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;
  bool _canResend = false;
  int _timeLeft = 300; // 5 minutes in seconds
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _resendOtp() {
    if (_canResend) {
      setState(() {
        _timeLeft = 300;
        _canResend = false;
      });
      startTimer();

      CustomSnackBar.show(
        context: context,
        message: "OTP resent successfully!",
        isSuccess: true,
      );
    }
  }

  void _verifyOtp(BuildContext context) {
    setState(() {
      _isLoading = true;
    });

    bool isSuccess = _otpController.text == UserModel.otpStorage[widget.input];

    setState(() {
      _isLoading = false;
    });

    CustomSnackBar.show(
      context: context,
      message: isSuccess ? "OTP verified successfully!" : "Invalid OTP",
      isSuccess: isSuccess,
    );

    if (isSuccess) {
      Future.delayed(const Duration(milliseconds: 500), () {
        context.pushReplacement(RouteNames.resetPassword, extra: widget.input);
      });
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
                              "Enter OTP",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 28, 224, 142),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Pinput(
                              length: 6,
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              defaultPinTheme: PinTheme(
                                width: 50,
                                height: 50,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              formatTime(_timeLeft),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomButton(
                              text: "Verify OTP",
                              onPressed: () => _verifyOtp(context),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: _canResend ? _resendOtp : null,
                              child: Text(
                                "Resend OTP",
                                style: TextStyle(
                                  color: _canResend ? Colors.blue : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
