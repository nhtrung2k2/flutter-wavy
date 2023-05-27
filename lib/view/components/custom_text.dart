import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    required this.fontWeight,
    required this.fontSize,
    required this.lineHeight,
    required this.colorText,
    required this.textAlign,
  });
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final double lineHeight;
  final Color colorText;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        overflow: TextOverflow.visible,
        maxLines: 2,
        style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: fontWeight,
            fontSize: fontSize,
            height: lineHeight,
            color: colorText));
  }
}
