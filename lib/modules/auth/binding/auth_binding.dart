import 'package:get/get.dart';
import 'package:sm_technology_job_task/data/repositories/auth_repository.dart';
import 'package:sm_technology_job_task/data/services/auth_services.dart';
import 'package:sm_technology_job_task/modules/auth/controllers/sign_in_controller.dart';
import 'package:sm_technology_job_task/modules/auth/controllers/forget_password_controller.dart';
import 'package:sm_technology_job_task/modules/auth/controllers/otp_controller.dart';
import 'package:sm_technology_job_task/modules/auth/controllers/reset_password_controller.dart';
import 'package:sm_technology_job_task/modules/auth/controllers/resgister_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () =>
          AuthController(repository: AuthRepository(provider: AuthProvider())),
    );
    Get.lazyPut(
      () => RegisterController(
        repository: AuthRepository(provider: AuthProvider()),
      ),
    );
    Get.lazyPut(
      () => OtpController(repository: AuthRepository(provider: AuthProvider())),
    );
    Get.lazyPut(
      () => ForgotPasswordController(
        repository: AuthRepository(provider: AuthProvider()),
      ),
    );
    Get.lazyPut(
      () => ResetPasswordController(
        repository: AuthRepository(provider: AuthProvider()),
      ),
    );
  }
}
