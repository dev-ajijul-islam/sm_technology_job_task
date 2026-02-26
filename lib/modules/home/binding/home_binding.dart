import 'package:get/get.dart';
import 'package:sm_technology_job_task/data/repositories/product_repository.dart';
import 'package:sm_technology_job_task/data/services/local_db_service.dart';
import 'package:sm_technology_job_task/data/services/product_service.dart';
import 'package:sm_technology_job_task/modules/home/controllers/home_controller.dart';
import 'package:sm_technology_job_task/modules/home/controllers/product_form_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        repository: ProductRepository(
          provider: ProductProvider(),
          localDb: LocalDbService(),
        ),
      ),
    );
    Get.lazyPut(
      () => ProductFormController(
        repository: ProductRepository(
          provider: ProductProvider(),
          localDb: LocalDbService(),
        ),
      ),
    );
  }
}
