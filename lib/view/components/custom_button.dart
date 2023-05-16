import 'package:flutter/material.dart';
import 'package:wavy/utils/resize.dart';

import '../../utils/colors/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double vertical;
  final double horizontal;
  const CustomButton(
      {required this.onPressed,
      required this.title,
      required this.vertical,
      required this.horizontal,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: CustomColors.blueBorder),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: vertical, horizontal: horizontal),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 14,
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
            ),
          )),
    );
  }
}
