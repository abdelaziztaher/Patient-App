import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user.dart';
import '../utils/constants.dart';

class ApiService {
  static Future<Map<String, dynamic>?> login(String identifier, String password) async {
    final url = Uri.parse(ApiConstants.loginEndpoint);
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'identifier': identifier, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.containsKey('access_token')) {
          // احفظ التوكن باستخدام SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', data['access_token']);
          return data;
        } else {
          return {'error': 'Token not found in response'};
        }
      } else {
        final error = json.decode(response.body)['message'] ?? 'Unknown error';
        return {'error': error};
      }
    } catch (e) {
      print("Login Error: $e");
      return {'error': 'Server connection error'};
    }
  }

  static Future<Map<String, dynamic>?> register(User user) async {
    final url = Uri.parse(ApiConstants.registerEndpoint);
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(user.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        print("Full Register Response: ${response.body}");
        // Return the entire response body as an error for debugging purposes
        return {'error': response.body};
      }
    } catch (e) {
      print("Register Error: $e");
      return {'error': 'Server connection error'};
    }
  }
}
