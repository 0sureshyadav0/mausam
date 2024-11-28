import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/colors/color.dart';
import 'package:weather/widgets/text.dart';

class MainContainer extends StatefulWidget {
  String cityName;
  String countryName;
  String description;
  MainContainer(
      {super.key,
      required this.cityName,
      required this.countryName,
      required this.description,
      required});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  String time = "";
  void initState() {
    super.initState();
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(
          () {
            time = DateTime.now().toString().split(' ')[1];
          },
        );
      },
    );
  }

  Widget build(BuildContext context) {
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
                    MyText(time.toString(), 20, greyColor),
                  ],
                )
              ],
            ),
            SizedBox(
              // height: 280.0,
              // width: 50.0,
              child: Lottie.asset("./assets/weatherAssets/cloud.json"),
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
                    MyText("20 °C", 50, greyColor),
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
