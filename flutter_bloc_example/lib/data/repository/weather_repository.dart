import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/data/data_provider/weather_data_provider.dart';
import 'package:flutter_bloc_example/model/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository({required this.weatherDataProvider});

  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      final body = await this.weatherDataProvider.getCurrentWeather(cityName);
      final data = jsonDecode(body);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }
      debugPrint("The data is: ${data['list'][0]}");
      return WeatherModel.fromJson(data['list'][0]);
    } catch (e) {
      throw e.toString();
    }
  }
}
