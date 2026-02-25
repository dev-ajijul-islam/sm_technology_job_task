import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/data/repositories/auth_repository.dart';
import 'package:sm_technology_job_task/routes/app_routes.dart';

class OtpController extends GetxController {
  final AuthRepository repository;
  OtpController({required this.repository});

  final  arg = Get.arguments;
  final otpController = TextEditingController();

  var isLoading = false.obs;
  var timerSeconds = 30.obs;
  Timer? _timer;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    timerSeconds.value = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  Future<void> verify() async {
    if (otpController.text.length < 4) return;

    isLoading.value = true;
    try {
      final res = await repository.verifyOtp(arg["email"], otpController.text);
      if (res.success) {
        _timer?.cancel();
        _showSuccessDialog();
      } else {
        Get.snackbar("Error", res.message);
      }
    } finally {
      isLoading.value = false;
    }
  }

  void _showSuccessDialog() {
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
                "Congratulations!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your account is ready to use. You will be redirected in a moment.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(
        arg["from"] == "forget" ? AppRoutes.resetPassword : AppRoutes.locationScreen,
        arguments: arg["email"]
      ),
    );
  }
}
