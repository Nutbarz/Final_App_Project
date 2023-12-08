// Views/AboutScreen.dart
// Colin Ostby 12-8-23
import 'package:flutter/material.dart';

// About information screen
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('About'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // About the app
            Text(
              "Welcome to our incredible Flutter app! This feature-rich application seamlessly combines intuitive design with robust functionality to provide users with an exceptional experience. The streamlined interface allows for effortless navigation, while the login feature, fortified by advanced security measures, guarantees a safe and personalized experience. But that's not all – our app goes beyond the basics! Explore its capabilities, from a beautifully crafted user interface to efficient data storage, all contributing to a delightful user journey. Whether you're a tech enthusiast or a casual user, our app promises to deliver a seamless, secure, and enjoyable experience for everyone. Dive in and discover the extraordinary features that make this app truly amazing!",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Developed By: Colin Ostby for CMSC 2204",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
