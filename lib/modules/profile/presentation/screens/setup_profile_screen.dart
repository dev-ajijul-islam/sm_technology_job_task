import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/modules/profile/controllers/profile_setup_controller.dart';

class SetupProfileView extends GetView<SetupController> {
  const SetupProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fill Your Profile"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Stack(
              children: [
                Obx(
                  () => CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: controller.selectedImagePath.isEmpty
                        ? null
                        : FileImage(File(controller.selectedImagePath.value)),
                    child: controller.selectedImagePath.isEmpty
                        ? const Icon(Icons.person, size: 60, color: Colors.grey)
                        : null,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: controller.pickImage,
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xFF1868F2),
                      child: Icon(Icons.edit, color: Colors.white, size: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildInput("Full Name", controller.nameController),
            const SizedBox(height: 16),
            _buildInput("Country", controller.countryController),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.submitProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1868F2),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Start Now",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController ctr) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: ctr,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
