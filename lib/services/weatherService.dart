import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'package:weather/models/weatherModel.dart';

class WeatherService {
  static const BASE_URL = "http://api.openweathermap.org/data/2.5/weather";
  static const url =
      "https://api.open-meteo.com/v1/forecast?latitude=27.811&longitude=82.5417&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,showers,snowfall,weather_code,cloud_cover,pressure_msl,surface_pressure,wind_speed_10m,wind_direction_10m,wind_gusts_10m&hourly=temperature_2m,relative_humidity_2m,rain,weather_code,visibility,wind_speed_10m,wind_speed_180m,wind_direction_10m,wind_direction_180m&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,daylight_duration,sunshine_duration,precipitation_sum,precipitation_hours";
  final String apiKey;
  WeatherService(this.apiKey);
  Future<Weather> getWeather() async {
    // final response =
    //     await http.get(Uri.parse("$BASE_URL?q=$cityName&appid=$apiKey"));
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
    final latitude = position.latitude;
    final longitude = position.longitude;
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=dang&units=metric&appid=982b594dc67d22b99403531058322bc4"));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception("City not found");
    } else {
      throw Exception("Failed to load weather data");
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // fetch the current location
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
    final latitude = position.latitude;
    final longitude = position.longitude;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // print(placemarks);
    String? city = placemarks[0].street;
    String? country = placemarks[0].country;
    return country ?? "Your Country";
  }
}
