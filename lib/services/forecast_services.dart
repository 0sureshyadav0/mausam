import 'dart:convert';

import 'package:http/http.dart' as http;

class ForecastWeatherService {
  Future<List> getForecast(String cityName) async {
    final url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=982b594dc67d22b99403531058322bc4";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> foreCastList = data['list'];
      return foreCastList;
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
