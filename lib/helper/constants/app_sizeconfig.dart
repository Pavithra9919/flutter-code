import 'package:flutter/material.dart';

class sizeconfig {
  late MediaQueryData _mediaQueryData;
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getproportionateScreenHeight(double inputHeight) {
  double screenHeight = sizeconfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

double getproportionateScreenWidth(double inputWidth) {
  double screenWidth = sizeconfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}
