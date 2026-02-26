

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/modules/home/controllers/home_controller.dart';
import 'package:sm_technology_job_task/modules/home/controllers/product_form_controller.dart';
import 'package:sm_technology_job_task/modules/home/presentation/widgets/product_card.dart';

class ProductGrid extends GetView<HomeController> {
   const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(() {
      // লোডিং স্টেট হ্যান্ডেল করা
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      // ডেটা না থাকলে মেসেজ দেখানো
      if (controller.products.isEmpty) {
        return const Center(child: Text("No products found."));
      }

      return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // ২ কলামের গ্রিড
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.72, // স্ক্রিনশট অনুযায়ী কার্ডের সাইজ ঠিক রাখা
        ),
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          final product = controller.products[index];
          return ProductCard(product: product); // ডাইনামিক ডেটা পাস করা
        },
      );
    });
  }
}