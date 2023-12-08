// Views/LoginScreen.dart
// Colin Ostby 12-8-23
import 'package:flutter/material.dart';
import 'AboutScreen.dart';
import '../DataService.dart';
import '../Models/LoginStructure.dart';

// Primary Login Screen
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController objects for user text input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // DataService object for SecureStorage
  final DataService _dataService = DataService();
  LoginStructure admin = LoginStructure('admin', 'Password1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ostby Mobile App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Please sign in'),
                TextField(
                  // Username TextField input
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  // Password TextField input - obscured
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                // SizedBox used as spacer
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    // Add new user - admin
                    _dataService.AddUser(admin);
                    final username = _usernameController.text;
                    final password = _passwordController.text;
                    // Take user TextField input to attempt login
                    // Shows result of login attempt in snackbar
                    LoginStructure loginAttempt =
                        LoginStructure(username, password);
                    String result = await _dataService.Login(loginAttempt);
                    _showSnackBar(context, result);
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // About TextButton - shows AboutScreen
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutScreen()),
                    );
                  },
                  child: const Text('About'),
                ),
                const Text('Version: 1.0.1'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
