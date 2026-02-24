import 'package:get/get.dart';
import 'package:sm_technology_job_task/routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    _goToNextScreen();
    super.onInit();
  }

  void _goToNextScreen()async{
   await Future.delayed(Duration(seconds: 2));
    Get.offAndToNamed(AppRoutes.onboarding);
  }
}