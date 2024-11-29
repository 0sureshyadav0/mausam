import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/colors/color.dart';
import 'package:weather/components/bottomSheet.dart';
import 'package:weather/screens/search.dart';
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
                MyText("Search City", 16, Colors.white),
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

Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const SearchScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0); // Start from bottom
      const end = Offset.zero; // End at original position
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
