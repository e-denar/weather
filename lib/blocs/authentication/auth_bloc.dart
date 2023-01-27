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
  }

  final AuthService _authService;

  Future<void> _onLogin(
    AuthLoginEvent event,
    Emitter<AuthState> emitter,
  ) async {
    try {
      emitter(state.copyWith(status: Status.loading));

      final result = await _authService.login();

      if (result != null) {
        emitter(state.copyWith(status: Status.success));
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
}
