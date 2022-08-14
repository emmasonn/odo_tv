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
    return Container(
      height: height,
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Container(
          height: height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    onBoarding.assetName,
                  ),
                  fit: BoxFit.cover)),
        ),
        Container(
          color: Colors.black26,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                onBoarding.title,
                style: GoogleFonts.montserrat(
                    color: Colors.blue,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                onBoarding.subTitle,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      ]),
    );
  }
}
