import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/modules/profile/controllers/profile_setup_controller.dart';

class LocationView extends GetView<SetupController> {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFFE8F1FF),
                child: Icon(Icons.location_on, size: 60, color: Color(0xFF1868F2))
            ),
            const SizedBox(height: 32),
            const Text("Enable Location", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text("We need your location to show you local theory test materials and centers.", textAlign: TextAlign.center),
            const Spacer(),
            SizedBox(
              width: double.infinity, height: 56,
              child: ElevatedButton(
                onPressed: () => Get.toNamed('/select-language'),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1868F2)),
                child: const Text("Allow Location", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}