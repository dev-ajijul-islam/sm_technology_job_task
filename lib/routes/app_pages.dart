import 'package:get/get.dart';
import 'package:sm_technology_job_task/routes/app_routes.dart';
import '../modules//onboarding/binding/onboarding_binding.dart';
import '../modules//onboarding/presentation/screens/onboarding_screen.dart';
import '../modules//splash/binding/splash_binding.dart';
import '../modules//splash/presentation/screens/splash_screen.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen(),binding: OnboardingBinding()),
  ];
}
