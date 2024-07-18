import 'package:flutter/material.dart';
import 'package:hsu_bakery/constants/color.dart';

class SmallButton extends StatelessWidget {
  final Color color;
  final bool isShadow;
  final bool isBorder;
  final bool isDisableTouch;
  final Widget child;
  final VoidCallback onTap;

  const SmallButton({
    super.key,
    required this.color,
    required this.isShadow,
    required this.isBorder,
    required this.child,
    required this.onTap,
    required this.isDisableTouch,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisableTouch ? null : onTap,
      child: Container(
        height: 30,
        width: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: isBorder
              ? Border.all(color: KColor.c48GreyColor, width: 0.5)
              : null,
          color: color,
          boxShadow: isShadow
              ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(5, 5),
                      blurRadius: 10,
                      spreadRadius: 1)
                ]
              : null,
        ),
        child: child,
      ),
    );
  }
}
