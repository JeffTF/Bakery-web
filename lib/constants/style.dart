import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class KStyle {
  static TextStyle t24TextStyle = GoogleFonts.lato(
    color: KColor.c48GreyColor,
    fontSize: 20,
  );

  static TextStyle t20TextStyle = GoogleFonts.lato(
    color: KColor.c48GreyColor,
    fontSize: 20,
  );

  static TextStyle tTitleTextStyle = GoogleFonts.lato(
    color: KColor.cWhiteColor,
    fontSize: 16,
  );

  static TextStyle t16TextStyle = GoogleFonts.lato(
    color: KColor.c48GreyColor,
    fontSize: 16,
  );

  static TextStyle t14TextStyle = GoogleFonts.lato(
    color: KColor.c48GreyColor,
    fontSize: 14,
  );

  static TextStyle t12TextStyle = GoogleFonts.lato(
    color: KColor.c48GreyColor,
    fontSize: 12,
  );

  static TextStyle t10TextStyle = GoogleFonts.lato(
    color: KColor.c48GreyColor,
    fontSize: 10,
  );

  static TextStyle tButtonTextStyle = GoogleFonts.lato(
    color: KColor.cWhiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle tNavSelectedTextStyle = GoogleFonts.lato(
    color: KColor.cPrimaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static TextStyle tNavUnSelectedTextStyle = GoogleFonts.lato(
    color: KColor.c48GreyColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle kTextFieldErrorTextStyle = GoogleFonts.lato(
    fontSize: 10,
    letterSpacing: 0.3,
    color: KColor.cF4RedColor,
  );

  static TextStyle kAlertContentTextStyle = GoogleFonts.poppins(
    color: KColor.c48GreyColor,
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );
}
