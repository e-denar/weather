import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_weather_response.g.dart';

@JsonSerializable()
class OpenWeatherResponse {
  OpenWeatherResponse(this.city, this.list);

  final OpenWeatherCity city;
  final List<OpenWeatherListData> list;

  factory OpenWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherResponseFromJson(json);
}

@JsonSerializable()
class OpenWeatherCity {
  OpenWeatherCity(this.id, this.name);

  final int id;
  final String name;

  factory OpenWeatherCity.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherCityFromJson(json);
}

@JsonSerializable()
class OpenWeatherListData {
  OpenWeatherListData(this.temp);

  final OpenWeatherTemperature temp;

  factory OpenWeatherListData.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherListDataFromJson(json);
}

@JsonSerializable()
class OpenWeatherTemperature {
  OpenWeatherTemperature(this.day, this.night);

  final double day;
  final double night;

  factory OpenWeatherTemperature.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherTemperatureFromJson(json);
}
