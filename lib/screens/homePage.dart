import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/colors/color.dart';
import 'package:weather/components/extraWeatherInfo.dart';
import 'package:weather/components/mainContainer.dart';
import 'package:weather/components/searchComponent.dart';
import 'package:weather/components/sevenDays.dart';
import 'package:weather/models/weatherModel.dart';
import 'package:weather/services/weatherService.dart';
import 'package:weather/widgets/text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //api key
  final WeatherService _weatherService =
      WeatherService("982b594dc67d22b99403531058322bc4");
  Weather? _weather;
  String? _country;
  //fetch weather
  _fetchWeather() async {
    try {
      print("inside try");
      final weather = await _weatherService.getWeather();
      final countryName = await _weatherService.getCurrentCity();
      print("after weather : $weather");
      setState(() {
        _weather = weather;
        _country = countryName;
        print(_weather);
      });
    } catch (e) {
      // throw new Exception("Fetch weather failed");
      print("Fetch weather failed");
    }
  }

  //weather animation

  @override
  void initState() {
    super.initState();
    _weatherService.getCurrentCity();
    _fetchWeather();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;
    String? description = _weather?.description;
    String iconUrl = "https://openweathermap.org/img/wn/01d@2x.png";
    return Scaffold(
      backgroundColor: lightColor,
      body: _weather == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                      height: 200.0, "./assets/weatherAssets/loading.json"),
                  // MyText("Loading...", 20, Colors.white),
                ],
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // if (_weather?.icon != null)
                      MainContainer(
                        cityName: "${_weather?.cityName}",
                        countryName: _country ?? "",
                        iconName: _weather?.icon ?? "01d",
                        description: "$description",
                        temperature: _weather?.temperature ?? "",
                        timeStamp: _weather?.timeStamp ?? 0,
                      ),
                      // Image.network(iconUrl),
                      // MyText("${_weather?.cityName}", 10, Colors.white),
                      const ExtraWeatherInfo(),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: MyText("7 Days Forecast", 18, Colors.white),
                          )),
                      const SizedBox(
                        height: 110,
                        child: SevenDays(),
                      ),
                      const SizedBox(height: 5.0),
                      const Search(),
                    ],
                  ),
                ),
              ),
            ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
