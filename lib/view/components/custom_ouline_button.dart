import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomOutLineButton extends StatelessWidget {
  final double vertical;
  final double horizontal;
  final Color borderSideColor;
  final double borderRadius;
  final Color textColor;
  final Color backgroundColor;
  final double widthRadius;
  final Function onPressed;
  final String title;
  const CustomOutLineButton(
      {super.key,
      required this.title,
      required this.vertical,
      required this.horizontal,
      required this.textColor,
      required this.backgroundColor,
      required this.borderSideColor,
      required this.borderRadius,
      required this.widthRadius,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          onPressed();
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          side: BorderSide(color: borderSideColor, width: widthRadius),
          padding:
              EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        ),
        child: CustomText(
            title: title,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            lineHeight: 16 / 14,
            colorText: textColor));
  }
}
