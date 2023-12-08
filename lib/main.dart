// main.dart
// Colin Ostby 12-8-23
import 'package:flutter/material.dart';
import '../Views/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

// Load initial/home screen - Login
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final App',
      home: LoginScreen(),
    );
  }
}
