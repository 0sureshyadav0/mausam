import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/colors/color.dart';
import 'package:weather/widgets/text.dart';

class MainContainer extends StatefulWidget {
  String cityName;
  String countryName;
  String iconName;
  String description;
  String temperature;
  int timeStamp;
  MainContainer({
    super.key,
    required this.cityName,
    required this.countryName,
    required this.iconName,
    required this.description,
    required this.temperature,
    required this.timeStamp,
  });

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  String time = "";

  String formattedTime = "";

  @override
  void initState() {
    super.initState();
    print("Icon Name: ${widget.iconName}");

    getLottieUrl();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            formattedTime =
                DateFormat("hh:mm:ss a").format(DateTime.now()).toString();
          },
        );
      },
    );
  }

  String lottieUrl = "./assets/weatherAssets/loading.json";
  void getLottieUrl() {
    switch (widget.iconName) {
      case "01d":
        setState(() {
          lottieUrl = "./assets/weatherAssets/home.json";
        });
        break;
      case "01n":
        setState(() {
          lottieUrl = "./assets/weatherAssets/night2.json";
        });
        break;
      case "02d":
        setState(() {
          lottieUrl = "./assets/weatherAssets/cloudSun.json";
        });
        break;
      case "02n":
      case "04n":
        setState(() {
          lottieUrl = "./assets/weatherAssets/cloudy_night.json";
        });
        break;
      case "03n":
      case "04d":
        setState(() {
          lottieUrl = "./assets/weatherAssets/cloud.json";
        });
        break;
      case "03d":
        setState(() {
          lottieUrl = "./assets/weatherAssets/cloud.json";
        });
      case "09d":
      case "09n":
      case "10n":
        setState(() {
          lottieUrl = "./assets/weatherAssets/cloud_rain.json";
        });
        break;
      case "10d":
        setState(() {
          lottieUrl = "./assets/weatherAssets/sunCloud1.json";
        });
        break;
      case "11d":
      case "11n":
        setState(() {
          lottieUrl = "./assets/weatherAssets/thunderstorm.json";
        });
        break;
      case "50d":
      case "50n":
        setState(() {
          lottieUrl = "./assets/weatherAssets/wind.json";
        });
        break;

      default:
        setState(() {
          lottieUrl = "./assets/weatherAssets/loading.json";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    String iconUrl = "https://openweathermap.org/img/wn/50n@2x.png";

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.8,
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, bottom: 20.0, top: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Lottie.asset(
                        "./assets/weatherAssets/location.json",
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(widget.cityName, 20, Colors.white),
                        MyText(widget.countryName, 14, Colors.white),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 40.0,
                      width: 50.0,
                      child: Lottie.asset("./assets/weatherAssets/time.json"),
                    ),
                    MyText(formattedTime.toString(), 20, greyColor),
                  ],
                )
              ],
            ),
            SizedBox(
              // height: 280.0,
              // width: 50.0,
              child: Lottie.asset(lottieUrl),
            ),
            // MyText("Hello", 20, Colors.white),
            // MyText("Hello", 20, Colors.white),
            MyText(
                "${widget.description[0].toUpperCase()}${widget.description.substring(1)}",
                18,
                greyColor),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40.0,
                      width: 50.0,
                      child: Lottie.asset(
                          "./assets/weatherAssets/temperature.json"),
                    ),
                    MyText("${double.parse(widget.temperature).toInt()} °C", 50,
                        greyColor),
                  ],
                ),
                MyText("Tuesday, 24 November", 15, greyColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
