import 'package:weather/models/models.dart';

abstract class AuthService {
  /// Logs out User using Auth service
  /// Returns [User] if succesful
  /// Returns [null] if cancelled
  /// Throws a [LoginException] upon failure.
  Future<User?> login();

  /// Logs out User using auAuthth service
  ///
  /// Throws a [LogoutException] upon failure.
  Future<void> logout();
}
