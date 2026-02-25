import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/core/values/app_colors.dart';
import 'package:sm_technology_job_task/modules/auth/controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

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
              "Reset Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text("Set your new password to login to your account."),
            const SizedBox(height: 32),
            _buildPassField("New Password", controller.passwordController),
            const SizedBox(height: 20),
            _buildPassField(
              "Confirm Password",
              controller.confirmPasswordController,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.resetPassword(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: const Text(
                    "Reset Password",
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

  Widget _buildPassField(String label, TextEditingController ctr) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          controller: ctr,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Enter password",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
