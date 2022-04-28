import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/style_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryWithOpacity70,
      primaryColorDark: ColorManager.primaryDark,

      // ripple color
      splashColor: ColorManager.primaryWithOpacity70,

      // for disabled buttons
      disabledColor: ColorManager.grey1,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),

      // card theme
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),

      // App bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: AppSize.s4,
        color: ColorManager.primary,
        shadowColor: ColorManager.primaryWithOpacity70,
        titleTextStyle: getRegularTextStyle(
            color: ColorManager.white, fontSize: FontSizeManager.s16),
      ),

      // button theme
      buttonTheme: ButtonThemeData(
        buttonColor: ColorManager.primary,
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        splashColor: ColorManager.primaryWithOpacity70,
      ),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularTextStyle(color: ColorManager.white),
          primary: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
        ),
      ),

      // text theme
      textTheme: TextTheme(
          headline1: getSemiBoldTextStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSizeManager.s16,
          ),
          subtitle1: getMediumTextStyle(
            color: ColorManager.lightGrey,
            fontSize: FontSizeManager.s14,
          ),
          caption: getRegularTextStyle(color: ColorManager.grey1),
          bodyText1: getRegularTextStyle(
            color: ColorManager.grey,
          )),

      // text form field style
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularTextStyle(color: ColorManager.grey1),
        labelStyle: getRegularTextStyle(
          color: ColorManager.darkGrey,
        ),
        errorStyle: getRegularTextStyle(
          color: ColorManager.error,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.circular(AppSize.s8)),
      ));
}
