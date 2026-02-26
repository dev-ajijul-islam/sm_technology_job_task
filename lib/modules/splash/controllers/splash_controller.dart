import 'package:get/get.dart';
import 'package:sm_technology_job_task/data/services/auth_services.dart';
import 'package:sm_technology_job_task/routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    _goToNextScreen();
    super.onInit();
  }

  void _goToNextScreen()async{
    print("${AuthProvider.token}===========================================");
    await Future.delayed(Duration(seconds: 2));
    if(AuthProvider.isLoggedIn){
      Get.offAndToNamed(AppRoutes.homeScreen);

    }else{
      Get.offAndToNamed(AppRoutes.locationScreen);
    }
  }
}