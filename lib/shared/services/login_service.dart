import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final String loginUrl = 'https://dummyapi.io/login'; // Dummy API endpoint
  final String allowedUsername = 'saumya88';
  final String allowedPassword = '123456';

  Future<bool> login(String username, String password) async {
    if (username == allowedUsername && password == allowedPassword) {
      // Simulate token generation
      const token = 'dummy_token_for_saumya88';
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'token', token); // Store token in shared preferences
      return true;
    }

    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Assuming the API response contains a token
      final token = jsonDecode(response.body)['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'token', token); // Store token in shared preferences
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Remove token from shared preferences
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }
}
