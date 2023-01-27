import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/common.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';

part 'home_bloc.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Status.init) Status status,
    List<Weather>? weather,
  }) = _HomeState;

  factory HomeState.init() => const HomeState();
}

//------------------------------------------------------------------------------
abstract class HomeEvent {}

class HomeSearchEvent extends HomeEvent {
  HomeSearchEvent(this.text);

  final String text;
}

class HomeBackEvent extends HomeEvent {}

//------------------------------------------------------------------------------
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._weatherRepository,
  ) : super(HomeState.init()) {
    on<HomeSearchEvent>(_onSearch);
    on<HomeBackEvent>(_onBack);
  }

  final WeatherRepository _weatherRepository;

  Future<void> _onSearch(
    HomeSearchEvent event,
    Emitter<HomeState> emitter,
  ) async {
    try {
      emitter(state.copyWith(status: Status.loading));
      final result = await _weatherRepository.fetchWeather(event.text);
      emitter(
        state.copyWith(status: Status.success, weather: result),
      );
    } catch (e) {
      emitter(state.copyWith(status: Status.error));
    }
  }

  Future<void> _onBack(
    HomeBackEvent event,
    Emitter<HomeState> emitter,
  ) async {
    emitter(state.copyWith(weather: [], status: Status.init));
  }
}
