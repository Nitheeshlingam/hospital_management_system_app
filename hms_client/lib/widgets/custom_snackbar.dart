import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    required bool isSuccess,
    Duration duration = const Duration(seconds: 2),
  }) {
    // Dismiss any existing snackbars
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Show new snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.error,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: isSuccess
            ? const Color.fromARGB(255, 28, 224, 142)
            : const Color.fromARGB(255, 255, 76, 76),
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        elevation: 6,
      ),
    );
  }
}
