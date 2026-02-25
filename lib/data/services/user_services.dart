import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider {
  final String baseUrl = "https://product-management-seven-xi.vercel.app/api/v1";

  Future<http.StreamedResponse> completeProfile({
    required String token,
    required String fullName,
    required String country,
    required String imagePath,
  }) async {
    var request = http.MultipartRequest('PUT', Uri.parse('$baseUrl/users/complete-profile'));

    request.headers.addAll({'Authorization': 'Bearer $token'});

    // API expects "data" as a JSON string field
    request.fields['data'] = jsonEncode({
      "fullName": fullName,
      "country": country,
    });

    // Add the image file
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));

    return await request.send();
  }
}