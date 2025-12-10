import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/all_patient_model.dart';

class PatientService {
  static const baseUrl = "https://dralitherapy.neonweb.tech/api";

  // ---------------------------
  // GET ALL PATIENTS
  // ---------------------------
  static Future<AllPatientModel> getAllPatients(String token) async {
    final url = Uri.parse("$baseUrl/admin/patients");

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AllPatientModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load patients: ${response.body}");
    }
  }

  // ---------------------------
  // GET SINGLE PATIENT
  // ---------------------------
  Future<Map<String, dynamic>?> getPatientById(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null) return null;

    final url = Uri.parse("$baseUrl/admin/patient/$id");

    try {
      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      final jsonMap = json.decode(response.body);

      if (jsonMap["success"] == true) {
        return jsonMap["data"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
