import 'package:flutter/material.dart';

// Abstract class defining the contract for app themes
abstract class AppTheme {
 late Color scaffoldBackGroundColor;
 late Color gradientFirstColor;
late Color gradientSecondColor;
 late Color largeTextColor;
 late Color mediumTextColor;
 late Color buttonTextColor;
 late Color buttonColor;
 late Color unSelectedTextColor;
 late Color focusTextColor;

}

// Factory class to create appropriate theme instances
class AppThemeFactory {
  static AppTheme getAppThemeFactory(bool isBlack) {
    if (isBlack) {
      return DarkTheme();
    } else {
      return WhiteTheme();
    }
  }
}

// Implementation of WhiteTheme
class WhiteTheme implements AppTheme {
  @override
  Color buttonTextColor = Colors.white;

  @override
  Color focusTextColor = Colors.black12;

  @override
  Color gradientFirstColor = Color(0xff81BCF0);

  @override
  Color gradientSecondColor = Color(0xff497ADD);

  @override
  Color largeTextColor = Colors.black;

  @override
  Color mediumTextColor = Colors.black45;

  @override
  Color scaffoldBackGroundColor = Colors.white;

  @override
  Color unSelectedTextColor = Colors.black45;

  @override
  Color buttonColor = Colors.black;


}

// Implementation of DarkTheme
class DarkTheme implements AppTheme {
  @override
  Color buttonTextColor = Colors.white;

  @override
  Color focusTextColor = Colors.black12;

  @override
  Color gradientFirstColor = Color(0xff81BCF0);

  @override
  Color gradientSecondColor = Color(0xff497ADD);

  @override
  Color largeTextColor = Colors.white;

  @override
  Color mediumTextColor = Colors.black45;

  @override
  Color scaffoldBackGroundColor = Colors.black;

  @override
  Color unSelectedTextColor = Colors.black45;

  @override
  Color buttonColor = Colors.white;

}
