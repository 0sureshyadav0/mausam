import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/colors/color.dart';
import 'package:weather/services/forecast_services.dart';
import 'package:weather/services/weather_services.dart';
import 'package:weather/widgets/text.dart';

class SevenDays extends StatefulWidget {
  const SevenDays({super.key});

  @override
  State<SevenDays> createState() => _SevenDaysState();
}

class _SevenDaysState extends State<SevenDays> {
  //instance
  // ForecastWeather? _forecastWeather;
  final ForecastWeatherService _forecastWeatherService =
      ForecastWeatherService();
  final WeatherService _weatherService = WeatherService();
  //fetch
  List<dynamic> _forecastList = [];
  _fetchForecast() async {
    final cityName = await _weatherService.getCurrentCity();
    try {
      final forecast = await _forecastWeatherService.getForecast(cityName);
      setState(() {
        _forecastList = forecast;
      });
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchForecast();
  }

  @override
  Widget build(BuildContext context) {
    // final deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _forecastList.length,
        itemBuilder: (context, index) {
          final timeStamp = _forecastList[index]['dt'];
          final icon = _forecastList[index]['weather'][0]['icon'];
          final date = DateFormat("dd MMMM yyyy")
              .format(DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000));
          final time = DateFormat("hh:mm a")
              .format(DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000));
          String lottieName = "loading";
          switch (icon) {
            case "01d":
              lottieName = "sun";
              break;
            case "01n":
              lottieName = "night2";
              break;
            case "02d":
              lottieName = "cloudSun";
              break;
            case "02n":
            case "04n":
              lottieName = "cloudy_night";
              break;
            case "03d":
            case "03n":
            case "04d":
              lottieName = "cloud";
              break;
            case "09d":
            case "09n":
            case "10n":
              lottieName = "cloud_rain";
              break;
            case "10d":
              lottieName = "cloudSun1";
              break;
            case "11d":
            case "11n":
              lottieName = "thunderstorm";
              break;
            case "50d":
            case "50n":
              lottieName = "wind";
              break;
            default:
              lottieName = "loading";
              break;
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: darkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child:
                        Lottie.asset("./assets/weatherAssets/$lottieName.json"),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myText(
                            "${_forecastList[index]['weather'][0]['description'][0].toUpperCase()}${_forecastList[index]['weather'][0]['description'].substring(1)}",
                            20,
                            Colors.white),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            myText(date, 12, Colors.white),
                            myText(time, 12, Colors.grey),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
