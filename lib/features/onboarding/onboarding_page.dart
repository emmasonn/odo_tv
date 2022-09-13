import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odo_tv/features/browser/web_browser_page.dart';
import 'package:odo_tv/features/onboarding/onboarding_card.dart';
import 'package:odo_tv/features/onboarding/util.dart';
import 'package:odo_tv/main.dart';
import 'package:odo_tv/styles.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 58.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text(
                            'Skip',
                            style: GoogleFonts.montserrat(
                                fontSize: 16, color: Colors.white),
                          ),
                          onPressed: () {
                            prefs.setBool('onboarding', false);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WebBrowser(),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: CarouselSlider(
                      carouselController: carouselController,
                      items: onBoardingInfos.map((e) {
                        return OnBoardingCard(
                          height: 470,
                          onBoarding: e,
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 500,
                        autoPlay: false,
                        scrollPhysics: const PageScrollPhysics(),
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        initialPage: currentIndex,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (currentIndex == onBoardingInfos.length - 1) {
                              prefs.setBool('onboarding', false);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WebBrowser(),
                                  ));
                            } else {
                              setState(() {
                                currentIndex = currentIndex += 1;
                              });
                              carouselController.nextPage();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Row(
                            children: [
                              Text(
                                'Next',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              const Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              )),
        ));
  }
}
