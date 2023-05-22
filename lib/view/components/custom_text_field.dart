import 'package:flutter/material.dart';

import '../../utils/colors/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  final Function(String value) onChanged;
  final double vertical;
  final double horizontal;
  final double maxHeightConstraint;
  final TextAlign textAlign;
  const CustomTextField(
      {super.key,
      required this.onChanged,
      required this.vertical,
      required this.horizontal,
      required this.maxHeightConstraint,
      required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      maxLines: 1,
      textAlignVertical: TextAlignVertical.center,
      textAlign: textAlign,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
          constraints: BoxConstraints(
            maxHeight: maxHeightConstraint,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: CustomColors.blueBorder),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: CustomColors.blueBorder),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
