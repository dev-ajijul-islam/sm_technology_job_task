import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/routes/app_routes.dart';
import 'package:sm_technology_job_task/routes/app_pages.dart';

class JobTask extends StatelessWidget {
  const JobTask({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
