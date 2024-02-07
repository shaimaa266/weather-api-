import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:theweather/logic/models/response.dart';

class WeatherApi {
  String apiKay = "a373bddb0203360a0c0bdee774fc0f63";
  Future<WeatherResponse> getApiData(String city) async {
    final http.Response request = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&units=metric&lat=44.34&lon=10.99&appid=$apiKay"));
    if (request.statusCode >= 200 && request.statusCode <= 299) {
      final Map<String, dynamic> jsonbody = jsonDecode(request.body);
      WeatherResponse weatherresponse = WeatherResponse.FromMap(jsonbody);
      return weatherresponse;
    } else {
      throw ('failure' + request.body);
    }
  }
}
