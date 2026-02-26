import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ProductProvider {
  final String baseUrl = "https://product-management-seven-xi.vercel.app/api/v1";

  Future<http.Response> getProducts(String token) async {
    final url = Uri.parse('$baseUrl/products');
    return await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<http.Response> getProductById(String token, String productId) async {
    final url = Uri.parse('$baseUrl/products/$productId');
    return await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
  }
  Future<http.StreamedResponse> createProduct({
    required String token,
    required Map<String, String> fields,
    File? imageFile,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/products'));


    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    });


    request.fields.addAll(fields);


    if (imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
      ));
    }

    return await request.send();
  }


  Future<http.Response> deleteProduct(String token, String productId) async {
    final url = Uri.parse('$baseUrl/products/$productId');
    return await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }
}