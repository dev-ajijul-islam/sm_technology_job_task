import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sm_technology_job_task/core/values/app_assets.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  RxInt currentIndex = 0.obs;

  List<Map<String, dynamic>> onBoardinList = [
    {
      "title": "Best online courses in the world",
      "subtitle":
      "Now you can learn anywhere, anytime, even if there is no internet access!",
      "image": AppAssets.onboard1,
    },
    {
      "title": "Explore your new skill today",
      "subtitle":
      "Our platform is designed to help you explore new skills. Let’s learn & grow with Eduline!",
      "image": AppAssets.onboard2,
    }
  ];

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value < 1
    ) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      goSignIn();
    }
  }

  void skip() {
    goSignIn();
  }

  void goSignIn() {

  }
}