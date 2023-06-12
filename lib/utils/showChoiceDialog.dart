import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/salary_bloc.dart';
import 'package:wavy/event/salary_event.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/convert_id_to_name.dart';
import 'package:wavy/view/components/custom_elevated_button.dart';

import '../model/item_salary.dart';
import 'dart:developer' as devtool;

void showChoiceDialog(BuildContext context, List<ItemSalary> list) {
  showDialog(
    context: context,
    builder: (BuildContext dialogcontext) {
      final salaryBloc = context.read<SalaryBloc>();
      return AlertDialog(
        title: Text('chooseAnOption'.tr()),
        content: SingleChildScrollView(
          child: ListBody(
              children: list
                  .map((item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomElevatedButton(
                            title: convertIdToName(item.id),
                            vertical: 8,
                            horizontal: 16,
                            textColor: Colors.white,
                            backgroundColor: CustomColors.blueBorder,
                            borderRadius: 16,
                            onPressed: () {
                              devtool.log(item.toString());
                              salaryBloc.add(AddItem(item: item));
                              GoRouter.of(dialogcontext).pop();
                            }),
                      ))
                  .toList()),
        ),
      );
    },
  );
}
