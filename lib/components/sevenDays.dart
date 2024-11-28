import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/colors/color.dart';
import 'package:weather/widgets/text.dart';

class SevenDays extends StatefulWidget {
  const SevenDays({super.key});

  @override
  State<SevenDays> createState() => _SevenDaysState();
}

class _SevenDaysState extends State<SevenDays> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                color: darkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Lottie.asset(
                      "./assets/weatherAssets/cloud.json",
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          "Cloudy",
                          15,
                          Colors.white,
                        ),
                        MyText("Mon", 12, Colors.white),
                        MyText("04:36 PM", 12, Colors.white),
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
