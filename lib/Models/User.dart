// Models/User.dart
// Colin Ostby 12-8-23
class User {
  String Username;
  String Password;

  User({required this.Username, required this.Password});

  //convert User object to JSON format
  Map<String, dynamic> toJson() {
    return {
      'username': Username,
      'password': Password,
    };
  }

  // Create user object from a JSON format
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      Username: json['username'],
      Password: json['password'],
    );
  }
}
