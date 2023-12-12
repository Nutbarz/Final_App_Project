import 'dart:convert';
import 'package:http/http.dart' as http;
import './Models/Post.dart';

class ApiService {
  final String apiUrl;
  ApiService({required this.apiUrl});

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['results'];
      return List<Post>.from(data.map((json) => Post.fromJson(json)));
    } else {
      throw Exception('Failed to load results');
    }
  }
}
