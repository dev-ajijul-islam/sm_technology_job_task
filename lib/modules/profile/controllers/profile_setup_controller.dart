import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sm_technology_job_task/data/repositories/user_repository.dart';

class SetupController extends GetxController {
  final UserRepository repository;
  SetupController({required this.repository});

  // States
  var isLoading = false.obs;
  var selectedLanguage = 'English'.obs;
  var selectedImagePath = ''.obs;

  final nameController = TextEditingController();
  final countryController = TextEditingController();

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) selectedImagePath.value = image.path;
  }

  Future<void> submitProfile() async {
    if (selectedImagePath.isEmpty) {
      Get.snackbar("Image Required", "Please select a profile picture");
      return;
    }

    isLoading.value = true;
    try {
      // Logic to call repository.completeProfile goes here
      _showSuccessDialog();
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
              const Icon(Icons.check_circle, color: Color(0xFF1868F2), size: 80),
              const SizedBox(height: 16),
              const Text("Congratulations!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const Text("Your profile has been set up successfully."),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed('/home'),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1868F2)),
                  child: const Text("Go to Home", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}