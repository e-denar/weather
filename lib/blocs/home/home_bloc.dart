import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/common.dart';

part 'home_bloc.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Status.init) Status status,
  }) = _HomeState;

  factory HomeState.init() => const HomeState();
}

//------------------------------------------------------------------------------
abstract class HomeEvent {}

class HomeSearchEvent extends HomeEvent {
  HomeSearchEvent(this.text);

  final String text;
}

//------------------------------------------------------------------------------
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.init()) {
    on<HomeSearchEvent>(_onSearch);
  }

  Future<void> _onSearch(
    HomeSearchEvent event,
    Emitter<HomeState> emitter,
  ) async {
    try {
      emitter(state.copyWith(status: Status.loading));
      // TODO: add api call here
      await Future<void>.delayed(const Duration(seconds: 2));
      emitter(state.copyWith(status: Status.success));
    } catch (e) {
      emitter(state.copyWith(status: Status.error));
    }
  }
}
