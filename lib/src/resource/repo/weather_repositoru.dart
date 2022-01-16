import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/src/resource/model/weahter_model.dart';
import 'package:flutter_app/src/utils/utils.dart';

import '../resource.dart';

class WeatherRepository {
  WeatherRepository._();

  static WeatherRepository? _instance;

  factory WeatherRepository() {
    if (_instance == null) _instance = WeatherRepository._();
    return _instance!;
  }

  Future<WeatherModel> getWeatherByLocation(String lat, String long) async {
    try {
      String api =
          "https://api.darksky.net/forecast/f239be76270725c04a026ec92e4c443e/$lat,$long";
      // "https://api.darksky.net/forecast/f239be76270725c04a026ec92e4c443e/42.3601,-71.0589";

      Response response = await AppClients().get(api);
      print(response.data);
      return WeatherModel.fromJson(response.data);
    } on DioError catch (e) {
      return WeatherModel();
    }
  }
}
