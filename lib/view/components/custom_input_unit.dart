import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wavy/utils/resize.dart';

class CustomInputUnit extends StatefulWidget {
  const CustomInputUnit(
      {super.key,
      required this.borderColor,
      required this.onChanged,
      required this.textAlign,
      required this.unit,
      required this.inititialValue});
  final Color borderColor;
  final Function(String? value) onChanged;
  final TextAlign textAlign;
  final String unit;
  final String inititialValue;
  @override
  State<CustomInputUnit> createState() => _CustomInputUnitState();
}

class _CustomInputUnitState extends State<CustomInputUnit> {
  TextEditingController _textFieldController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _textFieldController.text = widget.inititialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerRight, children: [
      TextField(
        controller: _textFieldController,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: widget.onChanged,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        textAlign: widget.textAlign,
        decoration: InputDecoration(
            suffixIconConstraints:
                const BoxConstraints(minHeight: 16, minWidth: 16),
            isCollapsed: true,
            contentPadding: EdgeInsets.only(
                right: ((14 * widget.unit.length).toDouble()),
                top: 8,
                bottom: 8),
            constraints: const BoxConstraints(
              maxHeight: 32.0,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: widget.borderColor),
                borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: widget.borderColor),
                borderRadius: BorderRadius.circular(8))),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(widget.unit))
    ]);
  }
}
