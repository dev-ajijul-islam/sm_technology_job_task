import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/core/values/app_assets.dart';
import 'package:sm_technology_job_task/core/values/app_colors.dart';
import 'package:sm_technology_job_task/modules/auth/controllers/sign_in_controller.dart';
import 'package:sm_technology_job_task/routes/app_routes.dart';

class SignInScreen extends GetView<AuthController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset(AppAssets.authScreenLogo, width: 80),
            const SizedBox(height: 30),
            const Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text("Please login first to start your Theory Test."),
            const SizedBox(height: 32),

            _buildTextField(
              "Email Address",
              controller.emailController,
              "pristia@gmail.com",
              false,
            ),
            const SizedBox(height: 20),

            Obx(
              () => _buildTextField(
                "Password",
                controller.passwordController,
                "Enter Password",
                !controller.isPasswordVisible.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: controller.togglePassword,
                ),
              ),
            ),

            const SizedBox(height: 24),
            Align(
              alignment: .topRight,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.forgetPassword);
                },
                child: Text(
                  "Forget password ?",
                  style: TextStyle(
                    color: AppColors.primary,
                    decoration: .underline,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.login(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1868F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                ),
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                text: "New to theory test ?",
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(AppRoutes.signUp);
                      },
                    text: "Create Account",
                    style: TextStyle(color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController ctr,
    String hint,
    bool isObscure, {
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          controller: ctr,
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
