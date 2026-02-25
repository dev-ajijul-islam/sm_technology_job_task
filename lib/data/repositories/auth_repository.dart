import 'dart:convert';
import 'package:sm_technology_job_task/data/models/otp_model.dart';
import 'package:sm_technology_job_task/data/models/register_model.dart';
import 'package:sm_technology_job_task/data/services/auth_services.dart';

import '../models/sign_in_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final AuthProvider provider;
  AuthRepository({required this.provider});

  Future<AuthResponse> login(String email, String password) async {
    final response = await provider.login(email, password);
    final data = jsonDecode(response.body);
    final authRes = AuthResponse.fromJson(data);

    if (authRes.success && authRes.token != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', authRes.token!);
    }
    return authRes;
  }

  Future<RegisterResponse> register(
    String name,
    String email,
    String pass,
  ) async {
    final response = await provider.register(
      fullName: name,
      email: email,
      password: pass,
    );
    final data = jsonDecode(response.body);
    return RegisterResponse.fromJson(data);
  }

  Future<OtpResponse> verifyOtp(String email, String otp) async {
    final response = await provider.verifyOtp(email, otp);
    return OtpResponse.fromJson(jsonDecode(response.body));
  }

  Future<OtpResponse> forgotPassword(String email) async {
    final response = await provider.forgotPassword(email);
    final data = jsonDecode(response.body);
    return OtpResponse.fromJson(data);
  }

  Future<AuthResponse> resetPassword(String email, String password) async {
    final response = await provider.resetPassword(email, password);
    final data = jsonDecode(response.body);
    return AuthResponse.fromJson(data);
  }
}
