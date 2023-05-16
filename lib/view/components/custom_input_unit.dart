import 'package:flutter/material.dart';
import 'package:wavy/utils/resize.dart';

class CustomInputUnit extends StatelessWidget {
  const CustomInputUnit(
      {super.key,
      required this.borderColor,
      required this.onChanged,
      required this.textAlign,
      required this.unit});
  final Color borderColor;
  final Function(String? value) onChanged;
  final TextAlign textAlign;
  final String unit;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      maxLines: 1,
      textAlignVertical: TextAlignVertical.center,
      textAlign: textAlign,
      decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(
              minHeight: 16.resizeheight(context),
              minWidth: 16.resizewidth(context)),
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: ((10 * 2 + 14 * unit.length).toDouble())
                  .resizewidth(context)),
          constraints: BoxConstraints(
            maxHeight: 32.0.resizeheight(context),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
