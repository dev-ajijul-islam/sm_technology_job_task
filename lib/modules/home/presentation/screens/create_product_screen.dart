import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/modules/home/controllers/product_form_controller.dart';
import 'package:sm_technology_job_task/modules/home/presentation/widgets/custom_dropdown_widget.dart';
import 'package:sm_technology_job_task/modules/home/presentation/widgets/upload_photo_widget.dart';

class CreateProductView extends GetView<ProductFormController> {
  const CreateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Product"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            const UploadPhotoWidget(),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: "Product Name"),
              controller: controller.nameC,
            ),

            // Category Dropdown
            CustomDropdown(
              label: "Select Category",
              items: const ["Electronics", "Fashion", "Gadgets"],
              selectedValue: controller.selectedCategory,
            ),

            TextField(
              decoration: InputDecoration(labelText: "Description"),
              controller: controller.descC,
              maxLines: 4,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Price"),
              controller: controller.priceC,
              keyboardType: TextInputType.number,
            ),

            CustomDropdown(
              label: "Brand",
              items: const ["Apple", "Samsung", "Sony", "SoundMax"],
              selectedValue: controller.selectedBrand,
            ),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "Weight"),
                    controller: controller.weightC,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "Dimension"),
                    controller: controller.dimC,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.submitProduct(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1868F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
