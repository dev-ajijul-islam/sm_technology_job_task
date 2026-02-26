// lib/modules/home/controllers/product_form_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:sm_technology_job_task/data/models/product_model.dart';
import 'package:sm_technology_job_task/data/repositories/product_repository.dart';

class ProductFormController extends GetxController {
  final ProductRepository repository;
  ProductFormController({required this.repository});

  final nameC = TextEditingController();
  final priceC = TextEditingController();
  final descC = TextEditingController();
  final weightC = TextEditingController();
  final dimC = TextEditingController();

  // ডিফল্ট ভ্যালুগুলো লিস্টের সাথে মিল রেখে সেট করা হয়েছে
  var selectedCategory = "Electronics".obs;
  var selectedBrand =
      "Apple".obs; // আগে SoundMax ছিল, যা লিস্টে নেই। এখন Apple করা হলো।
  var selectedImagePath = "".obs;
  var isLoading = false.obs;

  void setImage(String path) => selectedImagePath.value = path;

  Future<void> submitProduct() async {
    if (nameC.text.isEmpty || priceC.text.isEmpty) {
      Get.snackbar("Error", "Name and Price are required");
      return;
    }

    isLoading.value = true;
    try {
      final product = ProductModel(
        id: "",
        name: nameC.text,
        description: descC.text,
        price: double.tryParse(priceC.text) ?? 0.0,
        category: selectedCategory.value,
        brand: selectedBrand.value,
        isDiscounted: false,
        isActive: true,
        weight: double.tryParse(weightC.text) ?? 0.0,
        dimensions: dimC.text,
      );

      String token = "YOUR_TOKEN"; // AuthProvider.token ব্যবহার করুন
      File? imageFile = selectedImagePath.value.isNotEmpty
          ? File(selectedImagePath.value)
          : null;

      bool success = await repository.createProduct(
        token: token,
        product: product,
        image: imageFile,
      );
      if (success) {
        Get.back();
        Get.snackbar("Success", "Product created successfully");
      }
    } finally {
      isLoading.value = false;
    }
  }
}
