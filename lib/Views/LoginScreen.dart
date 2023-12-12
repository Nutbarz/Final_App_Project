// Views/LoginScreen.dart
// Colin Ostby 12-12-23

import 'package:flutter/material.dart';
import 'AboutScreen.dart';
import '../DataService.dart';
import '../Models/LoginStructure.dart';
import 'ListScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final currentContext = context;

                    _dataService.AddUser(admin);
                    final username = _usernameController.text;
                    final password = _passwordController.text;
                    LoginStructure loginAttempt =
                        LoginStructure(username, password);
                    String result = await _dataService.Login(loginAttempt);
                    _showSnackBar(currentContext, result);

                    if (result == 'login success') {
                      // if login successful, navigate to list screen
                      Navigator.of(currentContext).pushReplacement(
                        MaterialPageRoute(builder: (context) => StarWarsApp()),
                      );
                    }
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutScreen()),
                    );
                  },
                  child: const Text('About'),
                ),
                const Text('Version: 2.0.1'),
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
