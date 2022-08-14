import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odo_tv/features/browser/web_browser_page.dart';
import 'package:odo_tv/features/onboarding/onboarding_card.dart';
import 'package:odo_tv/features/onboarding/util.dart';
import 'package:odo_tv/styles.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.9;
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
              padding: const EdgeInsets.only(bottom: 30),
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CarouselSlider(
                      items: onBoardingInfos.map((e) {
                        return OnBoardingCard(
                          height: height,
                          onBoarding: e,
                        );
                      }).toList(),
                      options: CarouselOptions(
                          height: height,
                          autoPlay: true,
                          scrollPhysics: const PageScrollPhysics(),
                          enlargeCenterPage: true,
                          viewportFraction: 1.0,
                          // aspectRatio: 16 / 9,
                          initialPage: 0),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WebBrowser(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        'Welcome',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      )),
                ],
              )),
        ));
  }
}
