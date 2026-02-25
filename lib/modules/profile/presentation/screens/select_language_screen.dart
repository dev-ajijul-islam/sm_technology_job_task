import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/modules/profile/controllers/profile_setup_controller.dart';

class LanguageView extends GetView<SetupController> {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = ["English", "Spanish", "French", "Bengali"];
    return Scaffold(
      appBar: AppBar(title: const Text("Select Language")),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) => Obx(
          () => RadioListTile(
            title: Text(languages[index]),
            value: languages[index],
            groupValue: controller.selectedLanguage.value,
            onChanged: (val) => controller.selectedLanguage.value = val!,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () => Get.toNamed('/setup-profile'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1868F2),
            minimumSize: const Size(0, 56),
          ),
          child: const Text("Continue", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
