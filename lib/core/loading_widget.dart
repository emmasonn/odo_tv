import 'package:flutter/material.dart';
import 'package:odo_tv/core/dialog/info_dialog.dart';

class InfoDialog {
  //Loading Icons
  static Widget loadingHeart({Color? color}) {
    return Container(
      width: 80.0,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.white24),
      child: SpinKitPumpingHeart(
        size: 30.0,
        itemBuilder: (context, index) {
          return SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                'assets/loading.png',
              ));
        },
      ),
    );
  }
}
