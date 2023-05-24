import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wavy/utils/colors/custom_colors.dart';

enum InputType{
  number,
  currency,
  string,
  dropdown
}

class CustomInputField extends StatefulWidget{

  final InputType inputType;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final String? hintText;
  final String? verticalLabel;
  final bool isRequiredField;
  final int maxLines;
  final Function(dynamic)? onChanged;
  final List<InputDropdownItem>? dropdownItemList;
  final bool isNoDecoration;
  final Widget? child;

  const CustomInputField({
    this.controller,
    this.inputType = InputType.string,
    this.textAlign,
    this.hintText = '',
    this.verticalLabel,
    this.maxLines = 1,
    this.isRequiredField = false,
    this.onChanged,
    this.dropdownItemList,
    this.isNoDecoration = false,
    this.child,
    Key? key
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {

  InputDropdownItem? _selectedItem;

  @override
  Widget build(BuildContext context) {

    final textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
          color: CustomColors.blueBorder,
          width: 1
      ),
    );

    List<TextInputFormatter> inputFormatter = [];
    if(widget.inputType==InputType.number){
      inputFormatter = [
        FilteringTextInputFormatter.digitsOnly,
      ];
    }
    else if(widget.inputType==InputType.currency){
      inputFormatter = [
        FilteringTextInputFormatter.digitsOnly,
        _ThousandsSeparatorInputFormatter(),
      ];
    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.verticalLabel!=null,
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.verticalLabel ?? '',
                      style: const TextStyle(
                          color: CustomColors.gray,
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(
                          color: CustomColors.redText,
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ]
                )
              ),
              const SizedBox(height: 8.0,),
            ],
          ),
        ),
        widget.inputType == InputType.dropdown
        ? _showPopupMenu(widget.dropdownItemList ?? [])
        : TextFormField(
          controller: widget.controller,
          textAlign: widget.textAlign ?? (widget.inputType == InputType.currency ? TextAlign.end : TextAlign.start),
          inputFormatters: inputFormatter,
          maxLines: widget.maxLines,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: "Roboto",
          ),
          decoration: InputDecoration(
            suffix: widget.inputType==InputType.currency
              ? const Text(
                'VND',
                style: TextStyle(
                  color: Colors.black
                ),
              )
              : null,
            hintText: widget.hintText,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            enabledBorder: textFieldBorder,
            focusedBorder: textFieldBorder,
            border: textFieldBorder
          ),
          onChanged: (value){
            if(widget.onChanged!=null) widget.onChanged!(value);
          },
        ),
      ],
    );
  }

  _showPopupMenu(List<InputDropdownItem> list){
    return PopupMenuButton<InputDropdownItem>(
      onSelected: (item){
        setState((){
          _selectedItem = item;
        });
        if(widget.onChanged!=null) widget.onChanged!(item);
      },
      itemBuilder: (BuildContext context) => list.map((item) => PopupMenuItem<InputDropdownItem>(
        value: item,
        child: Text(item.content),
      )).toList(),
      child: widget.child ?? Container(
        height: 35.0,
        padding: const EdgeInsets.only(left: 10.0, right: 4.0),
        decoration: widget.isNoDecoration
          ? null
          : BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: CustomColors.blueBorder,
              width: 1.0
            )
          ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _selectedItem?.content ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: "Roboto",
                ),
              )
            ),
            Visibility(
              visible: !widget.isNoDecoration,
              child: const Icon(Icons.keyboard_arrow_down)
            )
          ],
        ),
      ),
    );
  }
}

class _ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ',';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    return newValue;
  }
}

class InputDropdownItem {
  dynamic id;
  dynamic content;
  InputDropdownItem({
    required this.id,
    required this.content
  });
}