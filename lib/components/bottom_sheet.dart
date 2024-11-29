import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather/colors/color.dart';
import 'package:weather/provider/city_provider.dart';
import 'package:weather/widgets/text.dart';

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({super.key});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  @override
  void initState() {
    super.initState();
    // Load cities using Provider

    Provider.of<CityProvider>(context, listen: false).loadCities();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      decoration: const BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) =>
                        Provider.of<CityProvider>(context, listen: false)
                            .findCity(value),
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18),
                      hintText: "Search city",
                      hintStyle: const TextStyle(
                        color: greyColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: InkWell(
                          child: Lottie.asset(
                              height: 50.0,
                              "./assets/weatherAssets/search.json"),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Consumer(
              builder: (context, cityProvider, child) {
                final cities = cityProvider.filteredCities;
                if (cities.isEmpty) {
                  return Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Lottie.asset("./assets/weatherAssets/nodata.json"),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      final cityData = cities[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: darkColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                myText(cityData['name'], 15, Colors.white),
                                myText("${cityData['id']}", 12, greyColor)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  child: Lottie.asset("./assets/weatherAssets/cross.json"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
