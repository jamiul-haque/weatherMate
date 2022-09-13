import 'dart:convert';

import 'package:weather_app/constant/api_end_point.dart';
import 'package:weather_app/models/weather_date_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<WeatherDataModel?> getCurrentWeather(
      {required double lat, required double lon}) async {
    final response = await http.post(
      Uri.parse(
          "${AppConstants.baseUrl}lat=$lat&lon=$lon&appid=${AppConstants.apiKey}"),
    );
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      return WeatherDataModel.fromMap(jsondata);
    } else {
      return null;
    }
  }
}
