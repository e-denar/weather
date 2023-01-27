import 'package:weather/models/models.dart';

abstract class AuthService {
  /// Logs out User using Auth service
  ///
  /// Throws a [LoginExceptioneption]
  Future<User> login();

  /// Logs out User using auAuthth service
  ///
  /// Throws a [LogoutException] upon failure.
  Future<void> logout();
}
