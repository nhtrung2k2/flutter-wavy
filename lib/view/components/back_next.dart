import 'dart:core';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/utils/resize.dart';

import '../../utils/colors/custom_colors.dart';
import 'custom_elevated_button.dart';
import 'custom_ouline_button.dart';

class BackNext extends StatelessWidget {
  const BackNext({
    super.key,
    required this.horizontalPadding,
    required this.firstButton,
    required this.secondButton,
    required this.verticalfirstButton,
    required this.horizontalfirstButton,
    required this.verticalsecondButton,
    required this.horizontalsecondButton,
    required this.onPressedButtonFirst,
    required this.onPressedButtonSecond,
  });
  final double horizontalPadding;
  final String firstButton;
  final String secondButton;
  final double verticalfirstButton;
  final double horizontalfirstButton;
  final double verticalsecondButton;
  final double horizontalsecondButton;
  final Function onPressedButtonFirst;
  final Function onPressedButtonSecond;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomOutLineButton(
          title: firstButton,
          vertical: verticalfirstButton,
          horizontal: horizontalfirstButton,
          textColor: CustomColors.blueBorder,
          backgroundColor: Colors.white,
          borderSideColor: CustomColors.blueBorder,
          borderRadius: 8,
          widthRadius: 1,
          onPressed: () {
            onPressedButtonFirst();
          },
        ),
        CustomElevatedButton(
          title: secondButton,
          vertical: verticalsecondButton,
          horizontal: horizontalsecondButton,
          textColor: Colors.white,
          backgroundColor: CustomColors.blueBorder,
          borderRadius: 8,
          onPressed: () {
            onPressedButtonSecond();
          },
        )
      ]),
    );
  }
}
