import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/core/values/app_colors.dart';
import 'package:sm_technology_job_task/core/widgets/primary_button.dart';

import '../../controllers/onboarding_controller.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  children: List.generate(controller.onBoardinList.length, (
                    index,
                  ) {
                    final Map<String, dynamic> data =
                        controller.onBoardinList[index];
                    return OnboardingPage(
                      image: data["image"],
                      title: data["title"],
                      subtitle: data["subtitle"],
                    );
                  }),
                ),
              ),

              SizedBox(height: 30),
              Obx(
                () => OnboardingIndicator(
                  currentIndex: controller.currentIndex.value,
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => PrimaryButton(
                    text: controller.currentIndex.value == 1
                        ? "Get Started"
                        : "Next",
                    onPressed: controller.nextPage,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),

          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: controller.skip,
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
