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
              "This app is a Flutter-based mobile application that interfaces with the Star Wars API (SWAPI) to retrieve and display information about characters from the Star Wars universe. The app features a visually appealing user interface with a list view showcasing key details such as character names, gender, skin color, hair color, and eye color. Each list item is presented in an individual light blue box with a gradient background. The app includes a reload button at the top, allowing users to refresh the character list. Additionally, tapping on a character opens a detailed page displaying an image and comprehensive attributes, as well as a back button to return to the main list view. The design incorporates a consistent light blue color scheme, creating a cohesive and engaging user experience for Star Wars enthusiasts.",
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
