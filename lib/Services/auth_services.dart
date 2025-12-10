import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_model.dart';

class AuthService {
  static const baseUrl = "https://dralitherapy.neonweb.tech/api";

  // ------------------------
  // LOGIN
  // ------------------------
  Future<LoginModel?> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/admin/login");

    try {
      final response = await http.post(
        url,
        headers: {"Accept": "application/json"},
        body: {
          "email": email,
          "password": password,
        },
      );

      final jsonMap = json.decode(response.body);

      if (jsonMap["success"] == true) {
        final loginModel = LoginModel.fromJson(jsonMap);

        final prefs = await SharedPreferences.getInstance();

        // Store token
        await prefs.setString("token", loginModel.data.accessToken);

        // Store full JSON response
        await prefs.setString("login_data", json.encode(jsonMap));

        return loginModel;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // ------------------------
  // LOAD SAVED LOGIN DATA
  // ------------------------
  Future<LoginModel?> loadSavedLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString("login_data");

    if (jsonString == null) return null;

    final jsonMap = json.decode(jsonString);
    return LoginModel.fromJson(jsonMap);
  }

  // ------------------------
  // GET TOKEN
  // ------------------------
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  // ------------------------
  // LOGOUT
  // ------------------------
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("login_data");
  }
}
