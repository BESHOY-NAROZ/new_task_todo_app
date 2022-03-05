import 'package:flutter/material.dart';

class SizeConfig {
  double screenWidth;
  double screenHeight;
  static double defaultSize;
  static Orientation orientation;
  static double defaultWidthSize;
  static double defaultHeightSize;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight * .024
        : screenWidth * .024;
    defaultHeightSize = screenHeight;
    defaultWidthSize = screenWidth;
  }
}
