import 'package:flutter/material.dart';

class ColorManagement {
  static Color primary = HexColor.fromHex("#ED9727");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryWithOpacity70 = HexColor.fromHex("#B3ED9728");
}

//convert string to color
extension HexColor on Color {
  static Color fromHex(String hexString) {
    hexString = hexString.replaceAll("#", "");

    // check if string has no opacity
    if (hexString == 6) {
      hexString = "FF" + hexString; // add 100% opcity
    }

    return Color(int.parse(hexString, radix: 16));
  }
}
