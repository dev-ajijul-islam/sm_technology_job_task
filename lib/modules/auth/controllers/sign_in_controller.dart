import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/data/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController({required this.repository});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  void togglePassword() => isPasswordVisible.value = !isPasswordVisible.value;

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    try {
      final result = await repository.login(
        emailController.text,
        passwordController.text,
      );
      if (result.success) {
        Get.offAllNamed('/home');
      } else {
        Get.snackbar("Login Failed", result.message);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
}
