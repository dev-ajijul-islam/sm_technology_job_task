import 'package:sm_technology_job_task/data/services/user_services.dart';

class UserRepository {
  final UserProvider provider;
  UserRepository({required this.provider});

  Future<bool> completeProfile(String token, String name, String country, String path) async {
    final response = await provider.completeProfile(
        token: token,
        fullName: name,
        country: country,
        imagePath: path
    );
    return response.statusCode == 200;
  }
}