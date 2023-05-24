import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wavy/model/item.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/view/components/custom_ouline_button.dart';
import 'package:wavy/view/components/custom_input_field.dart';

class AddMoreItemsComponents extends StatefulWidget{

  final bool isFilledColor;
  final Function(int, int, int) onAddedNewItem;
  final List itemList;

  const AddMoreItemsComponents({
    this.isFilledColor = false,
    required this.onAddedNewItem,
    required this.itemList,
    Key? key
  }) : super(key: key);

  @override
  State<AddMoreItemsComponents> createState() => _AddMoreItemsComponentsState();
}

class _AddMoreItemsComponentsState extends State<AddMoreItemsComponents> {

  final TextEditingController priceTextEdittingController = TextEditingController();
  bool _isAdding = false;
  late InputDropdownItem _selectedItem;
  final InputDropdownItem _selectedOptionItem = InputDropdownItem(id: itemOption.first['id'], content: itemOption.first['name']);


  @override
  void initState() {
    super.initState();
    _selectedItem = InputDropdownItem(id: widget.itemList.first['id'], content: widget.itemList.first['name']);
  }

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
                    SizedBox(
                      width: 120,
                      child: CustomInputField(
                        inputType: InputType.dropdown,
                        dropdownItemList: widget.itemList.map((e) => InputDropdownItem(
                            id: e['id'],
                            content: e['name']
                        )).toList(),
                        onChanged: (item){
                          setState((){
                            _selectedItem = item;
                          });
                        },
                        child: Text(
                          _selectedItem.content,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0,),
                    Expanded(
                      child: Column(
                        children: [
                          CustomInputField(
                            controller: priceTextEdittingController,
                            inputType: InputType.currency,
                          ),
                          const SizedBox(height: 10.0,),
                          CustomInputField(
                            inputType: InputType.dropdown,
                            dropdownItemList: itemOption.map((e) => InputDropdownItem(
                                id: e['id'],
                                content: e['name']
                            )).toList(),
                            onChanged: (item){

                            },
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
          _isAdding
          ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 35,
                width: 130,
                child: CustomOutLineButton(
                    title: 'Save',
                    vertical: 0,
                    horizontal: 0,
                    textColor: Colors.white,
                    backgroundColor: CustomColors.bluetext,
                    borderSideColor:  Colors.transparent,
                    borderRadius: 10.0,
                    widthRadius: 1,
                    onPressed: (){
                      widget.onAddedNewItem(_selectedItem.id, int.parse(priceTextEdittingController.text.replaceAll(',', '')), _selectedOptionItem.id);
                      setState((){
                        _isAdding = false;
                        priceTextEdittingController.clear();
                      });
                    }
                ),
              ),
              const SizedBox(width: 16.0,),
              SizedBox(
                height: 35,
                width: 130,
                child: CustomOutLineButton(
                    title: 'Clear',
                    vertical: 0,
                    horizontal: 0,
                    textColor: widget.isFilledColor ? Colors.white : CustomColors.bluetext,
                    backgroundColor: widget.isFilledColor ? CustomColors.bluetext : Colors.transparent,
                    borderSideColor:  widget.isFilledColor ? Colors.transparent : CustomColors.blueBorder,
                    borderRadius: 10.0,
                    widthRadius: 1,
                    onPressed: (){
                      setState((){
                        _isAdding = false;
                      });
                    }
                ),
              )
            ],
          )
          : SizedBox(
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
                    _isAdding = true;
                  });
                }
            ),
          ),
        ],
      ),
    );
  }
}