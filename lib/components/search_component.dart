import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/colors/color.dart';
import 'package:weather/components/bottom_sheet.dart';
import 'package:weather/widgets/text.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
            context: context,
            builder: (context) {
              return const Bottomsheet();
            });
      },
      child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: darkColor.withAlpha(150),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myText("Search City", 16, Colors.white),
                Lottie.asset(
                    height: 50.0,
                    width: 50.0,
                    "./assets/weatherAssets/search.json"),
              ],
            ),
          )),
    );
  }
}
