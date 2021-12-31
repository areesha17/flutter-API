import 'dart:convert';
import 'package:myapp/models/home_model.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/screens/home_screen.dart';

getuser() async {
  final queryParameters = {
    'q': city,
    'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
    'units': 'imperial'
  };

  var response = await http.get(Uri.https(
      "api.openweathermap.org", '/data/2.5/weather', queryParameters));
  var jsData = jsonDecode(response.body);
  return WeatherData.fromJson(jsData);
}