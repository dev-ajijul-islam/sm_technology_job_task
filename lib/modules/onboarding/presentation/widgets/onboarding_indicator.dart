import 'package:flutter/material.dart';
import 'package:sm_technology_job_task/core/values/app_colors.dart';


class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;

  const OnboardingIndicator({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == index ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index ? AppColors.primary : AppColors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}