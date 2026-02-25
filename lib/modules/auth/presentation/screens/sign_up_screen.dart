import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/core/values/app_colors.dart';
import 'package:sm_technology_job_task/modules/auth/controllers/resgister_controller.dart';

class SignUpView extends GetView<RegisterController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Fill your information below or register with your social media account.",
            ),
            const SizedBox(height: 32),

            _buildLabel("Name"),
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                hintText: "John Doe",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            _buildLabel("Email Address"),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                hintText: "example@gmail.com",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            _buildLabel("Password"),
            Obx(
              () => TextField(
                controller: controller.passwordController,
                obscureText: !controller.isPasswordVisible.value,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () => controller.isPasswordVisible.toggle(),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.signUp(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1868F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  text: "Already have an account ?",
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                      text: "Sign In",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
  );
}
