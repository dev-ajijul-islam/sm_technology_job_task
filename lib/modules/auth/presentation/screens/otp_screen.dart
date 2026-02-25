import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/core/values/app_colors.dart';
import 'package:sm_technology_job_task/modules/auth/controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              "Verification Code",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "We have sent the code verification to ${controller.arg["email"]}",
            ),
            const SizedBox(height: 32),

            TextField(
              controller: controller.otpController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, letterSpacing: 20),
              decoration: InputDecoration(
                hintText: "0000",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 32),
            Obx(
              () => TextButton(
                onPressed: controller.timerSeconds.value == 0
                    ? () => controller.startTimer()
                    : null,
                child: Text(
                  controller.timerSeconds.value == 0
                      ? "Resend Code"
                      : "Resend code in ${controller.timerSeconds.value}s",
                  style: const TextStyle(color: Color(0xFF1868F2)),
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
                      : () => controller.verify(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: AppColors.white)
                      : const Text(
                          "Verify",
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
