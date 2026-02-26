import 'dart:convert';
import 'dart:io';
import 'package:sm_technology_job_task/data/models/product_model.dart';
import 'package:sm_technology_job_task/data/services/local_db_service.dart';
import 'package:sm_technology_job_task/data/services/product_service.dart';

class ProductRepository {
  final ProductProvider provider;
  final LocalDbService localDb;

  ProductRepository({required this.provider, required this.localDb});

  Future<bool> createProduct({
    required String token,
    required ProductModel product,
    File? image,
  }) async {
    try {
      final Map<String, String> fields = {
        'name': product.name,
        'description': product.description ?? '',
        'price': product.price.toString(),
        'stock': product.stock.toString(),
        'category': product.category ?? '',
        'brand': product.brand ?? '',
        'isDiscounted': product.isDiscounted.toString(),
        'discountPercent': product.discountPercent.toString(),
        'isActive': product.isActive.toString(),
        'weight': product.weight.toString(),
        'dimensions': product.dimensions ?? '',
      };

      final response = await provider.createProduct(
        token: token,
        fields: fields,
        imageFile: image,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("Product Created Successfully");
        return true;
      } else {
        print("Failed to create product: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error in Repository CreateProduct: $e");
      return false;
    }
  }

  Future<List<ProductModel>> fetchAllProducts(String token) async {
    try {
      final response = await provider.getProducts(token);

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['data'];
        List<ProductModel> products = data
            .map((e) => ProductModel.fromJson(e))
            .toList();


        await localDb.saveProducts(products);
        return products;
      } else {
        throw Exception("Server Error");
      }
    } catch (e) {

      print("Offline mode: Loading from Hive...");
      return await localDb.getCachedProducts();
    }
  }
}
