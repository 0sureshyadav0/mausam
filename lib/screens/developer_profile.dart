import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather/colors/color.dart';
import 'package:weather/widgets/text.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class DeveloperProfile extends StatefulWidget {
  const DeveloperProfile({super.key});

  @override
  State<DeveloperProfile> createState() => _DeveloperProfileState();
}

class _DeveloperProfileState extends State<DeveloperProfile> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkColor.withOpacity(0.7),
        title: Text("Developer",
            style: TextStyle(
              fontFamily: GoogleFonts.playfairDisplay().fontFamily,
              color: Colors.white,
            )),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.asset(
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height,
                "./assets/images/splash.jpeg"),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Opacity(
                  opacity: 0.4,
                  child:
                      Lottie.asset("./assets/weatherAssets/developer2.json"))),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: deviceWidth,
              decoration: const BoxDecoration(
                  // color: darkColor.withOpacity(0.6),
                  ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: deviceHeight / 3.2,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Colors.transparent,
                            blurRadius: 12.0,
                            // offset: Offset(5, 5),
                            spreadRadius: 5.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "./assets/images/myImg2.jpg",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20, left: 10, right: 10, bottom: 20),
                      height: deviceHeight / 3,
                      width: deviceWidth,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: deviceWidth,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Hero(
                                          tag: "Hero",
                                          child: Lottie.asset(
                                              height: 30,
                                              "./assets/weatherAssets/developer1.json")),
                                      const SizedBox(width: 10),
                                      myText("Suresh Yadav", 20, Colors.white),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Full Stack Developer",
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.lato().fontFamily,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            myText("Contact", 20, Colors.white),
                            IconButton(
                              onPressed: () {
                                launchWhatsApp();
                              },
                              icon: Row(
                                children: [
                                  const FaIcon(FontAwesomeIcons.whatsapp,
                                      color: Colors.green, size: 40.0),
                                  const SizedBox(width: 10),
                                  myText("Whatsapp ", 20, Colors.green),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                launchGithub();
                              },
                              icon: Row(
                                children: [
                                  const FaIcon(FontAwesomeIcons.github,
                                      color: Colors.purple, size: 40.0),
                                  const SizedBox(width: 10),
                                  myText("Github", 20, Colors.white),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> launchWhatsApp() async {
    const link = WhatsAppUnilink(
      phoneNumber: "+977-9763878278",
      text: "Hi, I need some help. Please, respond in your free time...",
    );
    try {
      await launchUrl(link.asUri());
    } catch (e) {
      Get.snackbar("Error", "Failed to contact",
          duration: const Duration(seconds: 3));
    }
  }

  Future<void> launchGithub() async {
    const url = "https://www.github.com/0sureshyadav0/";
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      Get.snackbar("Error", "Failed to contact",
          duration: const Duration(seconds: 3));
    }
  }
}
