import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sm_technology_job_task/data/repositories/user_repository.dart';

class SetupController extends GetxController {
  final UserRepository repository;
  SetupController({required this.repository});

  @override
  void onInit() {
    checkPermission();
    super.onInit();
  }

  // States
  var isLoading = false.obs;
  var selectedLanguage = 'English'.obs;
  var selectedImagePath = ''.obs;

  RxBool hasLocation = false.obs;
  RxBool isPermissionGranted = false.obs;
  RxString locationText = "Checking location permission...".obs;

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

      _showSuccessDialog();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      locationText.value = "Location services are disabled.";
      isPermissionGranted.value = false;
      hasLocation.value = false;
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      locationText.value = "Location permission required.";
      isPermissionGranted.value = false;
      hasLocation.value = false;
      return;
    }

    isPermissionGranted.value = true;
    locationText.value = "Permission granted. Tap to get location.";

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