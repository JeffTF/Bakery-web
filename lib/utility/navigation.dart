import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Navigation {
  void popAndPushScreen(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeftWithFade, child: screen));
  }

  void pushScreen(BuildContext context, Widget screen) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeftWithFade, child: screen));
  }

  void popAllAndPushScreen(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeftWithFade, child: screen),
        (route) => false);
  }

  void popUntil(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
