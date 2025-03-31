import 'package:flutter/material.dart';
import 'package:hms_client/routes/routes.dart';

void main() {
  runApp(const HMSApp());
}

class HMSApp extends StatelessWidget {
  const HMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: appRouter,
    );
  }
}
