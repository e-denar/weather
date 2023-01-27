import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/common.dart';
import '../../models/models.dart';
import '../../services/services.dart';

part 'auth_bloc.freezed.dart';

//------------------------------------------------------------------------------
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(Status.init) Status status,
    Message? errorMessage,
    User? user,
  }) = _AuthState;

  factory AuthState.init() => const AuthState();
}

//------------------------------------------------------------------------------
abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {}

class AuthLogoutEvent extends AuthEvent {}

//------------------------------------------------------------------------------
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    AuthService? authService,
  })  : _authService = authService ?? Auth0Service(),
        super(AuthState.init()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthLogoutEvent>(_onLogout);
  }

  final AuthService _authService;

  Future<void> _onLogin(
    AuthLoginEvent event,
    Emitter<AuthState> emitter,
  ) async {
    try {
      emitter(state.copyWith(status: Status.loading));

      final user = await _authService.login();

      if (user != null) {
        emitter(state.copyWith(
          status: Status.success,
          user: user,
        ));
      } else {
        emitter(state.copyWith(status: Status.init));
      }
    } catch (e) {
      emitter(
        state.copyWith(
          status: Status.error,
          errorMessage: Message(
            e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> _onLogout(
    AuthLogoutEvent event,
    Emitter<AuthState> emitter,
  ) async {
    try {
      emitter(state.copyWith(status: Status.loading));
      await _authService.logout();
      emitter(state.copyWith(status: Status.init));
    } catch (e) {
      if (e is WebAuthenticationException && e.code == 'USER_CANCELLED') {
        return;
      }

      emitter(
        state.copyWith(
          status: Status.error,
          errorMessage: Message(
            e.toString(),
          ),
        ),
      );
    }
  }
}
