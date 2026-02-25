import 'package:get/get.dart';
import 'package:sm_technology_job_task/data/repositories/user_repository.dart';
import 'package:sm_technology_job_task/data/services/user_services.dart';
import 'package:sm_technology_job_task/modules/profile/controllers/profile_setup_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () =>
          SetupController(repository: UserRepository(provider: UserProvider())),
    );
  }
}
