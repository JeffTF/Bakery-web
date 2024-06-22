import 'package:flutter/material.dart';

import '../constants/color.dart';

class AppTheme {
  ThemeData getAppTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: KColor.cF2WhiteColor,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide.none,
            ),
          ),
          overlayColor: MaterialStateProperty.all(const Color(0xFF8A745F)),
          backgroundColor: MaterialStateProperty.all(
            KColor.cPrimaryColor,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: KColor.cPrimaryColor),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
