import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_weather_response.g.dart';

@JsonSerializable()
class OpenWeatherResponse {
  OpenWeatherResponse(this.dt, this.main);

  final int dt;
  final OpenWeatherTemperature main;

  DateTime get day => DateTime.fromMillisecondsSinceEpoch(dt);

  factory OpenWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherResponseFromJson(json);
}

@JsonSerializable()
class OpenWeatherTemperature {
  OpenWeatherTemperature(this.temp);

  final double temp;

  factory OpenWeatherTemperature.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherTemperatureFromJson(json);
}
