class AppUrls {
  static const String _baseUrl = "https://product-management-seven-xi.vercel.app/api/v1";
  static const String loginUrl = "$_baseUrl/auth/login";
  static const String registerUrl = "$_baseUrl/users/register";
  static const String verifyOtp = "$_baseUrl/auth/verify-otp";
  static const String resendOtp = "$_baseUrl/auth/resend-otp";
  static const String forgetPassword = "$_baseUrl/auth/forgot-password";
  static const String resetPassword = "$_baseUrl/auth/reset-password";
}