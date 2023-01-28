// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenWeatherResponse _$OpenWeatherResponseFromJson(Map<String, dynamic> json) =>
    OpenWeatherResponse(
      json['dt'] as int,
      OpenWeatherTemperature.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenWeatherResponseToJson(
        OpenWeatherResponse instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
    };

OpenWeatherTemperature _$OpenWeatherTemperatureFromJson(
        Map<String, dynamic> json) =>
    OpenWeatherTemperature(
      (json['temp'] as num).toDouble(),
    );

Map<String, dynamic> _$OpenWeatherTemperatureToJson(
        OpenWeatherTemperature instance) =>
    <String, dynamic>{
      'temp': instance.temp,
    };
