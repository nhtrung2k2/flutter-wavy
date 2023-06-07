import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/view/components/custom_elevated_button.dart';
import 'package:wavy/view/components/custom_ouline_button.dart';

class AddMoreItemsComponents extends StatefulWidget {
  final bool isFilledColor;
  final List itemList;
  final bool enable;
  final Function(dynamic) onPicked;

  const AddMoreItemsComponents(
      {this.isFilledColor = false,
      required this.itemList,
      required this.onPicked,
      this.enable = true,
      Key? key})
      : super(key: key);

  @override
  State<AddMoreItemsComponents> createState() => _AddMoreItemsComponentsState();
}

class _AddMoreItemsComponentsState extends State<AddMoreItemsComponents> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 35,
            width: 130,
            child: CustomOutLineButton(
                title: '+ ${'addMoreItems'.tr()}',
                vertical: 0,
                horizontal: 0,
                textColor: widget.enable
                    ? (widget.isFilledColor
                        ? Colors.white
                        : CustomColors.bluetext)
                    : CustomColors.blueLight,
                backgroundColor: widget.isFilledColor
                    ? CustomColors.bluetext
                    : Colors.transparent,
                borderSideColor: widget.enable
                    ? (widget.isFilledColor
                        ? Colors.transparent
                        : CustomColors.blueBorder)
                    : CustomColors.blueLight,
                borderRadius: 10.0,
                widthRadius: 1,
                onPressed: () {
                  if (widget.enable) {
                    _pickTypeItem(context, widget.itemList, (item) {
                      widget.onPicked(item);
                    });
                  }
                }),
          )
        ],
      ),
    );
  }

  void _pickTypeItem(
      BuildContext context, List list, Function(dynamic) onPicked) {
    showDialog(
      context: context,
      builder: (BuildContext dialogcontext) {
        return AlertDialog(
          title: const Text('Choose an Option'),
          content: SingleChildScrollView(
            child: ListBody(
                children: list
                    .map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CustomElevatedButton(
                              title: '${item['name']}'.tr(),
                              vertical: 8,
                              horizontal: 16,
                              textColor: Colors.white,
                              backgroundColor: CustomColors.blueBorder,
                              borderRadius: 16,
                              onPressed: () {
                                onPicked(item);
                                GoRouter.of(dialogcontext).pop();
                              }),
                        ))
                    .toList()),
          ),
        );
      },
    );
  }
}
