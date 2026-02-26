import 'package:get/get.dart';
import 'package:sm_technology_job_task/data/models/product_model.dart';
import 'package:sm_technology_job_task/data/repositories/product_repository.dart';
import 'package:sm_technology_job_task/data/services/auth_services.dart';

class HomeController extends GetxController {
  final ProductRepository repository;
  HomeController({required this.repository});

  // UI-এর জন্য প্রয়োজনীয় প্রপার্টিসমূহ
  var products = <ProductModel>[].obs;
  var isLoading = true.obs;

  // ট্যাব সুইচিং করার জন্য (Ongoing/Upcoming)
  var selectedTab = "Ongoing".obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  // প্রোডাক্ট লোড করার মেথড
  Future<void> loadProducts() async {
    isLoading(true);
    try {
      // AuthProvider থেকে টোকেন নেওয়া
      String token = AuthProvider.token;

      // রিপোজিটরি থেকে ডেটা ফেচ করা
      var result = await repository.fetchAllProducts(token);

      // ফেচ করা ডেটা 'products' লিস্টে অ্যাসাইন করা
      products.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", "Could not load products: $e");
    } finally {
      isLoading(false);
    }
  }

  // ট্যাব অনুযায়ী প্রোডাক্ট ফিল্টার করার লজিক (প্রয়োজন হলে)
  List<ProductModel> get filteredProducts {
    if (selectedTab.value == "Ongoing") {
      // API বা ডাটা অনুযায়ী ফিল্টার লজিক এখানে হবে
      return products.where((p) => p.isActive == true).toList();
    } else {
      return products.where((p) => p.isActive == false).toList();
    }
  }
}