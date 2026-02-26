import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/core/values/app_colors.dart';
import 'package:sm_technology_job_task/modules/profile/controllers/profile_setup_controller.dart';
import 'package:sm_technology_job_task/routes/app_routes.dart';

class LocationView extends GetView<SetupController> {
  LocationView({super.key});
  final SetupController _setupController = Get.find<SetupController>();
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
              child: Icon(
                Icons.location_on,
                size: 60,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Enable Location",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "We need your location to show you local theory test materials and centers.",
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: (){
                  Get.toNamed(AppRoutes.setupProfile);
                },
                style: ElevatedButton.styleFrom(

                  backgroundColor: AppColors.primary,
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
