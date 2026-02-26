import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/modules/home/controllers/home_controller.dart';

class CustomToggleTab extends GetView<HomeController> {
  CustomToggleTab({super.key});

  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        children: [
          _buildTabButton(
            "Ongoing",
            _homeController.selectedTab.value == "Ongoing",
          ),
          const SizedBox(width: 12),
          _buildTabButton(
            "Upcoming",
            controller.selectedTab.value == "Upcoming",
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, bool isActive) {
    return GestureDetector(
      onTap: () => controller.selectedTab.value = title,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF1868F2) : const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}