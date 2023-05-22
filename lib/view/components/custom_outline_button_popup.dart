import 'package:flutter/material.dart';
import 'package:wavy/utils/resize.dart';

import 'custom_text.dart';
import 'dart:developer' as devtool;

class CustomOutLineButtonPopUp extends StatelessWidget {
  final double vertical;
  final double horizontal;
  final Color borderSideColor;
  final double borderRadius;
  final Color textColor;
  final Color backgroundColor;
  final double widthRadius;
  final void Function(String?) onChanged;
  final String selectedValue;
  final List<String> options;

  const CustomOutLineButtonPopUp({
    super.key,
    required this.vertical,
    required this.horizontal,
    required this.textColor,
    required this.backgroundColor,
    required this.borderSideColor,
    required this.borderRadius,
    required this.widthRadius,
    required this.onChanged,
    required this.selectedValue,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        iconSize: 30,
// Adjust the icon size as needed
        // Other DropdownButton properties
        icon: const Center(
          child: SizedBox(
            height:
                30, // Adjust the icon container height to match the desired iconSize
            width:
                30, // Adjust the icon container width to match the desired iconSize
            child: Icon(Icons.keyboard_arrow_down),
          ),
        ),
        items: options
            .map((option) =>
                DropdownMenuItem(value: option, child: Text(option)))
            .toList(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderSideColor, width: widthRadius),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderSideColor, width: widthRadius),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: backgroundColor,
        ),
        value: selectedValue,
        onChanged: onChanged);
  }
}
