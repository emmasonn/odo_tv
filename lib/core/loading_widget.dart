import 'package:flutter/material.dart';
import 'package:odo_tv/core/dialog/info_dialog.dart';

class InfoDialog {
  //Loading Icons
  static Widget loadingHeart({Color? color}) {
    return Container(
      width: 80.0,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.black12),
      child: SpinKitPumpingHeart(
        size: 30.0,
        color: color,
      ),
    );
  }
}
