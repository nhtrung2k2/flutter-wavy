import 'package:flutter/material.dart';

class Screen {
  static double resizewidth(BuildContext context, double value) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenDesignWidth = 375;
    return (screenWidth * value) / screenDesignWidth;
  }

  static double resizeheight(BuildContext context, double value) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenReferenceHeight = 812; // iPhone X screen height in points
    return (screenHeight * value) / screenReferenceHeight;
  }

}

extension NumExtension on num {
  double resizewidth(BuildContext context) =>
      Screen.resizewidth(context, toDouble());
  double resizeheight(BuildContext context) =>
      Screen.resizeheight(context, toDouble());
}
