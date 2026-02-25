class RegisterResponse {
  final bool success;
  final String message;
  final String? userId;

  RegisterResponse({required this.success, required this.message, this.userId});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      userId: json['data'] != null ? json['data']['id'] : null,
    );
  }
}