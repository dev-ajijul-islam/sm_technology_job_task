import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/core/values/app_colors.dart';
import 'package:sm_technology_job_task/modules/auth/controllers/forget_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Forgot Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter your email address to receive a verification code.",
            ),
            const SizedBox(height: 32),
            const Text(
              "Email Address",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                hintText: "example@gmail.com",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.sendOtp(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: AppColors.white)
                      : const Text(
                          "Send Code",
                          style: TextStyle(color: AppColors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
