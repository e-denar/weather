class LoginException implements Exception {
  @override
  String toString() => "Failed to login.";
}

class LogoutException implements Exception {}
