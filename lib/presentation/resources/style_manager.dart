import 'package:flutter/material.dart';

import 'font_manager.dart';

// basic text style
TextStyle _getTextStyle({
  required String fontFamily,
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// regular text style
TextStyle getRegularTextStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManager.regular,
      color: color);
}

// bold text style
TextStyle getBoldTextStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManager.bold,
      color: color);
}

// semi-bold text style
TextStyle getSemiBoldTextStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManager.semiBold,
      color: color);
}

// medium text style
TextStyle getMediumTextStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManager.medium,
      color: color);
}

// light text style
TextStyle getLightTextStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManager.light,
      color: color);
}
