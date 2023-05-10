import 'package:flutter/material.dart';
import 'package:wavy/view/components/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final double vertical;
  final double horizontal;
  final double borderRadius;
  final Color textColor;
  final Color backgroundColor;
  final Function onPressed;
  final String title;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.vertical,
    required this.horizontal,
    required this.textColor,
    required this.backgroundColor,
    required this.borderRadius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
          ),
        ),
        child: CustomText(
            title: title,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            lineHeight: 16.41 / 14,
            colorText: textColor)
        //  Text(
        //   title,
        //   style: TextStyle(
        //       color: textColor,
        //       fontWeight: FontWeight.w400,
        //       fontSize: 14,
        //       height: 16 / 14),
        // )
        );
  }
}
