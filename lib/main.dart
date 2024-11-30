import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/city_provider.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/screens/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CityProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => WeatherProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mausam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
      ),
      home: const HomePage(
        title: "M A U S A M",
      ),
    );
  }
}
