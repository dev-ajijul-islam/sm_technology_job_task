import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/core/values/app_colors.dart';
import 'package:sm_technology_job_task/data/repositories/auth_repository.dart';
import 'package:sm_technology_job_task/routes/app_routes.dart';

class ResetPasswordController extends GetxController {
  final AuthRepository repository;
  ResetPasswordController({required this.repository});

  final String email = Get.arguments;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;
  var isPassVisible = false.obs;

  Future<void> resetPassword() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    isLoading.value = true;
    try {
      final res = await repository.resetPassword(
        email,
        passwordController.text,
      );
      print("${res.message}==============================================");
      if (res.success) {
        _showResetSuccessDialog();
      }
    } finally {
      isLoading.value = false;
    }
  }

  void _showResetSuccessDialog() {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFF1868F2),
                child: Icon(Icons.check, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 24),
              const Text(
                "Password Changed!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your password has been reset successfully.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed(AppRoutes.signIn),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: const Text(
                    "Back to Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
