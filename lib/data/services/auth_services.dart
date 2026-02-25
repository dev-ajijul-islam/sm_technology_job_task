import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sm_technology_job_task/core/values/app_urls.dart';

class AuthProvider {
  Future<http.Response> login(String email, String password) async {
    final url = Uri.parse(AppUrls.loginUrl);
    return await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "email": email,
        "password": password,
        "fcmToken": "optional-token",
      }),
    );
  }

  Future<http.Response> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(AppUrls.registerUrl);
    return await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "fullName": fullName,
        "email": email,
        "password": password,
        "fcmToken": "optional-fcm-token",
      }),
    );
  }

  Future<http.Response> verifyOtp(String email, String otp) async {
    return await http.post(
      Uri.parse(AppUrls.verifyOtp),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "otp": int.parse(otp)}),
    );
  }

  Future<http.Response> resendOtp(String email) async {
    return await http.post(
      Uri.parse(AppUrls.resendOtp),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email}),
    );
  }

  Future<http.Response> forgotPassword(String email) async {
    return await http.post(
      Uri.parse(AppUrls.forgetPassword),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email}),
    );
  }

  Future<http.Response> resetPassword(String email, String password) async {
    return await http.post(
      Uri.parse(AppUrls.resetPassword),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );
  }
}
