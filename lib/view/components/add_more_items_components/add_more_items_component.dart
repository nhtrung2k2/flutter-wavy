import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/view/components/custom_ouline_button.dart';
import 'package:wavy/view/components/custom_input_field.dart';

class AddMoreItemsComponents extends StatefulWidget{

  final bool isFilledColor;

  const AddMoreItemsComponents({
    this.isFilledColor = false,
    Key? key
  }) : super(key: key);

  @override
  State<AddMoreItemsComponents> createState() => _AddMoreItemsComponentsState();
}

class _AddMoreItemsComponentsState extends State<AddMoreItemsComponents> {

  bool _isAdding = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Visibility(
            visible: _isAdding,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 120,
                      child: Text(
                        'New Item',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0,),
                    Expanded(
                      child: Column(
                        children: const [
                          CustomInputField(
                            inputType: InputType.currency,
                          ),
                          SizedBox(height: 10.0,),
                          CustomInputField(
                            inputType: InputType.dropdown,
                          ),
                        ],
                      )
                    )
                  ],
                ),
                const SizedBox(height: 16.0,),
              ],
            ),
          ),
          SizedBox(
            height: 35,
            width: 130,
            child: CustomOutLineButton(
                title: '+ Add more item',
                vertical: 0,
                horizontal: 0,
                textColor: widget.isFilledColor ? Colors.white : CustomColors.bluetext,
                backgroundColor: widget.isFilledColor ? CustomColors.bluetext : Colors.transparent,
                borderSideColor:  widget.isFilledColor ? Colors.transparent : CustomColors.blueBorder,
                borderRadius: 10.0,
                widthRadius: 1,
                onPressed: (){
                  setState((){
                    _isAdding = !_isAdding;
                  });
                }
            ),
          ),
        ],
      ),
    );
  }
}