import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odo_tv/features/model/onBoarding.dart';
import 'package:odo_tv/features/onboarding/onboarding_page.dart';
import 'package:odo_tv/styles.dart';

void main() {
  runApp(const OdoTVApp());
}

class OdoTVApp extends StatelessWidget {
  const OdoTVApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odoh Tv',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: const OnBoardingPage(),
    );
  }
}

// Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Odoh Tv',
//             style: GoogleFonts.montserrat(
//                 fontSize: 18, fontWeight: FontWeight.w600),
//           ),
//           centerTitle: false,
//         ),