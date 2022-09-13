import 'package:flutter/material.dart';
import 'package:odo_tv/features/browser/web_browser_page.dart';
import 'package:odo_tv/features/onboarding/onboarding_page.dart';
import 'package:odo_tv/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  runApp(const OdoTVApp());
}

class OdoTVApp extends StatefulWidget {
  const OdoTVApp({Key? key}) : super(key: key);

  @override
  State<OdoTVApp> createState() => _OdoTVAppState();
}

class _OdoTVAppState extends State<OdoTVApp> {
  bool showOnBoarding = true;
  @override
  void initState() {
    super.initState();
    showOnBoarding = prefs.getBool('onboarding') ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OdoTV Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: showOnBoarding ? const OnBoardingPage() : const WebBrowser(),
    );
  }
}
