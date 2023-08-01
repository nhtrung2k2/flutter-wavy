import 'package:flutter/material.dart';
import 'package:wavy/utils/colors/custom_colors.dart';

const defaultWidth = 17.0;
const defaultHeight = 17.0;
const defaultIconSize = 13.0;

class CustomRadiusCheckbox extends StatefulWidget {
  final bool value;
  final double width;
  final double height;
  final double iconSize;
  final Function(bool)? onChanged;
  final bool enable;

  const CustomRadiusCheckbox(
      {required this.value,
      this.width = defaultWidth,
      this.height = defaultHeight,
      this.iconSize = defaultIconSize,
      this.onChanged,
      this.enable = true,
      Key? key})
      : super(key: key);

  @override
  State<CustomRadiusCheckbox> createState() => _CustomRadiusCheckboxState();
}

class _CustomRadiusCheckboxState extends State<CustomRadiusCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.enable) {
          setState(() {
            isChecked = !isChecked;
          });
          if (widget.onChanged != null) widget.onChanged!.call(isChecked);
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.enable
                    ? CustomColors.blueBorder
                    : CustomColors.blueLight,
                width: 1.5),
            color: (isChecked
                ? (widget.enable
                    ? CustomColors.blueBorder
                    : CustomColors.blueLight)
                : Colors.transparent),
            borderRadius: BorderRadius.circular(4.0)),
        child: Visibility(
          visible: isChecked,
          child: Icon(
            Icons.check,
            size: widget.iconSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
