import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/model/weather_data.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/model/weather_data_daily.dart';
import 'package:weatherapp_starter_project/model/weather_data_hourly.dart';
import 'package:weatherapp_starter_project/utils/api_url.dart';

class FetchWeatherApi {
  WeatherData? weatherData;

  //processing the data from response to json

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));
    return weatherData!;
  }
}
