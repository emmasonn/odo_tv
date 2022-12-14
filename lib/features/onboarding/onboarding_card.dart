import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odo_tv/features/model/onBoarding.dart';

class OnBoardingCard extends StatelessWidget {
  final OnBoardingModel onBoarding;
  final double height;
  const OnBoardingCard({
    Key? key,
    required this.height,
    required this.onBoarding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  onBoarding.assetName,
                ),
                fit: BoxFit.cover)),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              onBoarding.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              onBoarding.subTitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      )
    ]);
  }
}
