import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/data/repositories/auth_repository.dart';
import 'package:sm_technology_job_task/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final AuthRepository repository;
  ForgotPasswordController({required this.repository});

  final emailController = TextEditingController();
  var isLoading = false.obs;

  Future<void> sendOtp() async {
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar("Invalid Email", "Please enter a valid email address");
      return;
    }

    isLoading.value = true;
    try {
      final res = await repository.forgotPassword(emailController.text);
      if (res.success) {
        Get.toNamed(
          AppRoutes.verifyOtp,
          arguments: {"email": emailController.text, "from": "forget"},
        );
      }
    } finally {
      isLoading.value = false;
    }
  }
}
