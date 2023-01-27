import 'package:auth0_flutter/auth0_flutter.dart';

import '../../common/common.dart';
import '../../env.dart';
import '../../models/models.dart';
import 'auth_service.dart';

class Auth0Service implements AuthService {
  final _service = Auth0(
    EnvConfig.instance.env.authKey,
    EnvConfig.instance.env.authToken,
  );

  @override
  Future<User?> login() async {
    try {
      final result = await _service.webAuthentication().login(
            useEphemeralSession: true,
          );

      return User(
        result.user.name!,
        githubUrl: 'https://github.com/${result.user.nickname}',
      );
    } catch (e) {
      if (e is WebAuthenticationException && e.code == 'USER_CANCELLED') {
        return null;
      } else {
        throw LoginException();
      }
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _service.webAuthentication().logout();
    } catch (e) {
      if (e is WebAuthenticationException && e.code == 'USER_CANCELLED') {
        rethrow;
      } else {
        throw LogoutException();
      }
    }
  }
}
