import 'package:get/get.dart';
import 'package:sm_technology_job_task/modules/auth/binding/auth_binding.dart';
import 'package:sm_technology_job_task/modules/auth/presentation/screens/forget_password_screen.dart';
import 'package:sm_technology_job_task/modules/auth/presentation/screens/otp_screen.dart';
import 'package:sm_technology_job_task/modules/auth/presentation/screens/reset_password_screen.dart';
import 'package:sm_technology_job_task/modules/auth/presentation/screens/sign_in_screen.dart';
import 'package:sm_technology_job_task/modules/auth/presentation/screens/sign_up_screen.dart';
import 'package:sm_technology_job_task/modules/profile/binding/profile_binding.dart';
import 'package:sm_technology_job_task/modules/profile/presentation/screens/location_screen.dart';
import 'package:sm_technology_job_task/modules/profile/presentation/screens/select_language_screen.dart';
import 'package:sm_technology_job_task/modules/profile/presentation/screens/setup_profile_screen.dart';
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
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => SignInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => SignUpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyOtp,
      page: () => OtpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => ResetPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.setupProfile,
      page: () => SetupProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.languageSelect,
      page: () => LanguageView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.locationScreen,
      page: () => LocationView(),
      binding: ProfileBinding(),
    ),
  ];
}
