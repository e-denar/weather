// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenWeatherResponse _$OpenWeatherResponseFromJson(Map<String, dynamic> json) =>
    OpenWeatherResponse(
      OpenWeatherCity.fromJson(json['city'] as Map<String, dynamic>),
      (json['list'] as List<dynamic>)
          .map((e) => OpenWeatherListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OpenWeatherResponseToJson(
        OpenWeatherResponse instance) =>
    <String, dynamic>{
      'city': instance.city,
      'list': instance.list,
    };

OpenWeatherCity _$OpenWeatherCityFromJson(Map<String, dynamic> json) =>
    OpenWeatherCity(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$OpenWeatherCityToJson(OpenWeatherCity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

OpenWeatherListData _$OpenWeatherListDataFromJson(Map<String, dynamic> json) =>
    OpenWeatherListData(
      OpenWeatherTemperature.fromJson(json['temp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenWeatherListDataToJson(
        OpenWeatherListData instance) =>
    <String, dynamic>{
      'temp': instance.temp,
    };

OpenWeatherTemperature _$OpenWeatherTemperatureFromJson(
        Map<String, dynamic> json) =>
    OpenWeatherTemperature(
      (json['day'] as num).toDouble(),
      (json['night'] as num).toDouble(),
    );

Map<String, dynamic> _$OpenWeatherTemperatureToJson(
        OpenWeatherTemperature instance) =>
    <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
    };
