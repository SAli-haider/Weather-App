import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/Model/daily_model.dart';
import 'package:weatherapp_starter_project/Model/hourl_model.dart';

import '../Model/currentWeather_Model.dart';

class Api {
  Future currentWeatherApi(latitude, longitude) async {
    final link =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=put here your api id&units=metric";
    final response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      // print(response.body);
      return currentWeatherFromJson(response.body);
    } else {
      print("Fallied");
    }
  }

  Future hourlyWeatherApi(latitude, longitude) async {
    final link =
        "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=put here your api id&units=metric";
    final response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      // print(response.body);
      return hourlyWeatherFromJson(response.body);
    } else {
      print("Fallied");
    }
  }

  Future dailyWeatherApi(latitude, longitude) async {
    final link =
        "https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=$longitude&exclude=hourly,currently,alerts,minutely &appid=put here your api id&units=metric";
    final response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      print(response.body);
      return dailyWeatherFromJson(response.body);
    } else {
      print("Fallied");
    }
  }
}
