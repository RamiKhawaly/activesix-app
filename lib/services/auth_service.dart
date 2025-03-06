// lib/services/auth_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';
import '../config/app_config.dart';

class AuthService {
 Future<User?> login(String username, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$serverUrl$loginService'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'expiresInMins': 30,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      // Improved error handling: include the response body in the exception
      throw Exception('Login failed: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    // Catch any network errors or exceptions during the process
    throw Exception('Login failed: $e');
  }
}

}
