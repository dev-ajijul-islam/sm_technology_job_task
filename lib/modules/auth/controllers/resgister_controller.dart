import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/data/repositories/auth_repository.dart';
import 'package:sm_technology_job_task/routes/app_routes.dart';

class RegisterController extends GetxController {
  final AuthRepository repository;
  RegisterController({required this.repository});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  Future<void> signUp() async {
    if (passwordController.text.length < 8) {
      Get.snackbar("Error", "Password must be at least 8 characters");
      return;
    }

    isLoading.value = true;
    try {
      final res = await repository.register(
        nameController.text,
        emailController.text,
        passwordController.text,
      );
      if (res.success) {
        Get.toNamed(AppRoutes.verifyOtp, arguments: {"email" : emailController.text});
      } else {
        Get.snackbar("Error", res.message);
      }
    } catch (e) {
      Get.snackbar("Error", "Registration failed");
    } finally {
      isLoading.value = false;
    }
  }
}
