import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  Future<Weather> getWeather(int id) async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?id=$id&units=metric&appid=982b594dc67d22b99403531058322bc4"));
    if (response.statusCode == 200) {
      print(response.body.toString());
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
