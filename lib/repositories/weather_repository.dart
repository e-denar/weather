import 'dart:convert';

import 'package:weather/common/exceptions/exceptions.dart';
import 'package:weather/common/exceptions/weather_exception.dart';
import 'package:weather/models/coordinates.dart';

import '../env.dart';
import '../services/services.dart';
import '../models/models.dart';

abstract class WeatherRepository {
  /// Fetches the [Weather]
  ///
  /// Throws a [WeatherException] upon failure.
  Future<List<Weather>> fetchWeather(String city);
}

//------------------------------------------------------------------------------
class OpenWeatherRepository extends WebService implements WeatherRepository {
  @override
  Future<List<Weather>> fetchWeather(
    String query, {
    int limit = 5,
  }) async {
    try {
      final result = await send(
        'http://api.openweathermap.org/geo/1.0/direct?q=$query&limit=$limit&appid=${EnvConfig.instance.env.weatherApiKey}',
        method: HttpMethod.get,
      );

      final data = jsonDecode(result.body) as List<dynamic>;
      final coordinates = data.map((e) => Coordinates.fromJson(e)).toList();
      final weatherData = await _fetchWeatherData(coordinates.first);

      return [weatherData];
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw WeatherException();
    }
  }

  Future<Weather> _fetchWeatherData(
    Coordinates coordinate,
  ) async {
    try {
      final result = await send(
        'http://api.openweathermap.org/data/2.5/weather?lat=${coordinate.lat}&lon=${coordinate.lon}&cnt=1&units=imperial&appid=${EnvConfig.instance.env.weatherApiKey}',
        method: HttpMethod.get,
      );

      final data = jsonDecode(result.body);
      final weatherData =
          OpenWeatherResponse.fromJson(data as Map<String, dynamic>);
      return Weather(
        temp: weatherData.main.temp.toString(),
        date: weatherData.day,
      );
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw WeatherException();
    }
  }
}
