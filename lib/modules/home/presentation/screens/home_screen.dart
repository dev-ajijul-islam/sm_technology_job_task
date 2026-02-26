import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/core/widgets/primary_button.dart';
import 'package:sm_technology_job_task/modules/home/controllers/home_controller.dart';
import 'package:sm_technology_job_task/modules/home/presentation/widgets/custom_toggle_tab.dart';
import 'package:sm_technology_job_task/modules/home/presentation/widgets/home_header_widget.dart';
import 'package:sm_technology_job_task/modules/home/presentation/widgets/product_grid.dart';
import 'package:sm_technology_job_task/routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HomeHeaderWidget(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "My Services",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  CustomToggleTab(),
                  SizedBox(height: 20),
                  Expanded(child: ProductGrid()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: PrimaryButton(
              text: "Create",
              onPressed: () {
                Get.toNamed(AppRoutes.createProduct);
              },
            ),
          ),
        ],
      ),
    );
  }
}
