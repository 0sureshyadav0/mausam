import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/colors/color.dart';
import 'package:weather/widgets/text.dart';

class ExtraWeatherInfo extends StatefulWidget {
  const ExtraWeatherInfo({super.key});

  @override
  State<ExtraWeatherInfo> createState() => _ExtraWeatherInfoState();
}

class _ExtraWeatherInfoState extends State<ExtraWeatherInfo> {
  @override
  Widget build(BuildContext context) {
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
                    child: Lottie.asset("./assets/weatherAssets/cloud.json"),
                  ),
                  Container(
                    child: Column(children: [
                      MyText("25 °C", 15.0, Colors.white),
                      MyText("Feels Like", 15, greyColor),
                    ]),
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
                    child:
                        Lottie.asset("./assets/weatherAssets/humidity1.json"),
                  ),
                  Container(
                    child: Column(
                      children: [
                        MyText("20 %", 15, Colors.white),
                        MyText("Humidity", 15, greyColor),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(height: 140, width: 1, color: Colors.blue),
            Expanded(
              // width: 100.0,
              // height: 100.0,
              // decoration: BoxDecoration(
              //   color: Colors.yellow,
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: Lottie.asset("./assets/weatherAssets/wind.json"),
                  ),
                  Container(
                    child: Column(
                      children: [
                        MyText("1.02 Km/h", 15, Colors.white),
                        MyText("Wind", 15, greyColor),
                      ],
                    ),
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
