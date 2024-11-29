import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/colors/color.dart';
import 'package:weather/widgets/text.dart';

class ExtraWeatherInfo extends StatefulWidget {
  final String feelsLike;
  final String humidity;
  final String windSpeed;
  final String iconName;
  const ExtraWeatherInfo({
    super.key,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.iconName,
  });

  @override
  State<ExtraWeatherInfo> createState() => _ExtraWeatherInfoState();
}

class _ExtraWeatherInfoState extends State<ExtraWeatherInfo> {
  @override
  Widget build(BuildContext context) {
    String lottieName = "loading";
    switch (widget.iconName) {
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
        lottieName = "sunCloud1";
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

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 145.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: darkColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40.0,
                    child:
                        Lottie.asset("./assets/weatherAssets/$lottieName.json"),
                  ),
                  Column(children: [
                    myText("${double.parse(widget.feelsLike).toInt()} °C", 15.0,
                        Colors.white),
                    myText("Feels Like", 15, greyColor),
                  ])
                ],
              ),
            ),
            Container(height: 140, width: 1, color: Colors.blue),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child:
                        Lottie.asset("./assets/weatherAssets/humidity1.json"),
                  ),
                  Column(
                    children: [
                      myText("${widget.humidity} %", 15, Colors.white),
                      myText("Humidity", 15, greyColor),
                    ],
                  )
                ],
              ),
            ),
            Container(height: 140, width: 1, color: Colors.blue),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: Lottie.asset("./assets/weatherAssets/wind.json"),
                  ),
                  Column(
                    children: [
                      myText("${widget.windSpeed} Km/h", 15, Colors.white),
                      myText("Wind", 15, greyColor),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
