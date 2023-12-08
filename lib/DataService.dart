// DataService.dart
// Colin Ostby 12-8-23
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'Models/LoginStructure.dart';
import 'Models/User.dart';
import 'dart:convert';

class DataService {
  // Create SecureStorageObject
  FlutterSecureStorage SecureStorage = const FlutterSecureStorage();

  // converts LoginStructure object into User for SecureStorage
  Future<void> AddUser(LoginStructure user) async {
    try {
      User newUser = User(Username: user.username, Password: user.password);
      saveUser(User(Username: newUser.Username, Password: newUser.Password));
    } catch (error) {
      print(error);
      return;
    }
  }

  // Save User Object to SecureStorage
  Future<void> saveUser(User user) async {
    final jsonString = jsonEncode(user.toJson());
    await SecureStorage.write(key: user.Username, value: jsonString);
  }

  // Load User Object from SecureStorage by username key
  Future<User?> loadUser(String name) async {
    final jsonString = await SecureStorage.read(key: name);
    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString);
      return User.fromJson(jsonMap);
    } else {
      return null;
    }
  }

  // Attempt login based on user entered LoginStructure
  // username and password comparison to User object
  // loaded from SecureStorage (if it exists)
  // returns status message to LoginScreen Snackbar
  Future<String> Login(LoginStructure user) async {
    try {
      User? readObject = await loadUser(user.username);
      if (user.username == readObject?.Username &&
          user.password == readObject?.Password) {
        return ('login success');
      } else if (user.username == readObject?.Username) {
        return ('incorrect password');
      } else {
        return ('username does not exist');
      }
    } catch (error) {
      return ('error');
    }
  }
}
