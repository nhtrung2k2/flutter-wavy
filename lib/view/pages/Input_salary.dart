import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/salary_bloc.dart';
import 'package:wavy/event/salary_event.dart';
import 'package:wavy/utils/convert_id_to_name.dart';
import 'package:wavy/utils/form_submission_status.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/utils/showChoiceDialog.dart';
import 'package:wavy/view/components/custom_elevated_button.dart';
import 'package:wavy/view/components/custom_input_unit.dart';
import 'package:wavy/view/components/custom_outline_button_popup.dart';

import '../../model/item_salary.dart';
import '../../state/salary_state.dart';
import '../../utils/colors/custom_colors.dart';
import '../components/back_next.dart';
import '../components/begin_to_match_new_babysiter.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_text.dart';
import 'dart:developer' as devtool;

class InputSalaryPage extends StatelessWidget {
  const InputSalaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          nameTitle: "registerNewBabysitter".tr(),
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: const InputSalaryView(),
    );
  }
}

class InputSalaryView extends StatelessWidget {
  const InputSalaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final blocSalary = context.read<SalaryBloc>();

    return BlocListener<SalaryBloc, SalaryInputState>(
      listener: (context, state) {
        if (state.formStatus == FormSubmissionStatus.submissionsuccess) {
          context.goNamed('register_baby_sister_basic_settings');
          blocSalary.add(ResetSucess());
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const BeginToMatchBabySister(),
              SizedBox(
                height: 32.resizeheight(context),
              ),
              CustomText(
                title: "pleaseInputSalary".tr(),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                lineHeight: (18 / 16),
                colorText: CustomColors.blacktext,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16.resizeheight(context)),
              const InputSalaryForm(),
              SizedBox(
                height: 139.resizeheight(context),
              ),
              BackNext(
                horizontalPadding: 10.resizewidth(context),
                firstButton: "back".tr(),
                secondButton: "next".tr(),
                verticalfirstButton: 16,
                horizontalfirstButton: 38.5,
                verticalsecondButton: 16,
                horizontalsecondButton: 38.5,
                onPressedButtonFirst: () {
                  GoRouter.of(context).pop();
                },
                onPressedButtonSecond: () {
                  if (blocSalary.state.formStatus !=
                      FormSubmissionStatus.formsubmitting) {
                    blocSalary.add(OnSubmmited(
                        listItemSalary:
                            blocSalary.state.inputSalary.itemSalary));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputSalaryForm extends StatelessWidget {
  const InputSalaryForm({super.key});
  @override
  Widget build(BuildContext context) {
    List<ItemSalary> listItem =
        context.select((SalaryBloc bloc) => bloc.state.inputSalary.itemSalary);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: ItemSalaryRowNonSlidable(
            title: "wage".tr(),
          ),
        ),
        SizedBox(
          height: 16.resizeheight(context),
        ),
        ...listItem
            .map((item) => Container(
                margin: EdgeInsets.only(bottom: 16.resizeheight(context)),
                child: ItemSalaryRowSlidable(item: item)))
            .toList(),
        CustomElevatedButton(
            title: 'addMoreItem'.tr(),
            vertical: 8,
            horizontal: 16,
            textColor: Colors.white,
            backgroundColor: CustomColors.blueBorder,
            borderRadius: 8,
            onPressed: () {
              showChoiceDialog(context, const [
                ItemSalary(id: 1, price: 0, option: 2),
                ItemSalary(id: 2, price: 0, option: 2),
                ItemSalary(id: 3, price: 0, option: 2),
                ItemSalary(id: 4, price: 0, option: 2),
              ]);
            }),
      ],
    );
  }
}

enum EnumType {
  month,
  day,
}

extension EnumTypeX on EnumType {
  String get content {
    switch (this) {
      case EnumType.day:
        return "oncePerDay".tr();
      case EnumType.month:
        return "oncePerMonth".tr();
    }
  }

  int get indexEnum {
    switch (this) {
      case EnumType.day:
        return 2;
      case EnumType.month:
        return 1;
    }
  }
}

class OptionModel {
  final EnumType enumtype;

  OptionModel(this.enumtype);
}

int convertOption(String option) {
  devtool.log("convertOption");
  if (option == EnumType.day.content) {
    devtool.log(EnumType.day.indexEnum.toString());
    devtool.log(EnumType.day.content);
    return EnumType.day.indexEnum;
  } else {
    devtool.log(EnumType.month.indexEnum.toString());
    devtool.log(EnumType.month.content);
    return EnumType.month.indexEnum;
  }
}

class ItemSalaryRowSlidable extends StatelessWidget {
  ItemSalaryRowSlidable({
    super.key,
    required this.item,
  });

  final ItemSalary item;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SalaryBloc>();
    return Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
              label: 'delete'.tr(),
              icon: Icons.cancel,
              onPressed: (context) {
                bloc.add(OnDeleteItem(item.id));
              })
        ]),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: Colors.white70,
          elevation: 16,
          shadowColor: CustomColors.grayShadow,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: 120.resizewidth(
                          context), // Set your desired minimum width
                    ),
                    child: CustomText(
                      title: convertIdToName(item.id),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      lineHeight: 18 / 14,
                      colorText: CustomColors.blacktext,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomInputUnit(
                          borderColor: CustomColors.blueBorder,
                          onChanged: (value) {
                            if (value != null) {
                              final money = int.tryParse(value);
                              if (money != null) {
                                bloc.add(OnChangedValueItem(money, item.id));
                              }
                            }
                          },
                          textAlign: TextAlign.end,
                          unit: 'VND',
                          inititialValue: item.price.toString()),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 32,
                        child: CustomOutLineButtonPopUp(
                            vertical: 2,
                            horizontal: 6,
                            textColor: CustomColors.blacktext,
                            backgroundColor: Colors.white,
                            borderSideColor: CustomColors.blueBorder,
                            borderRadius: 8,
                            widthRadius: 1,
                            onChanged: (value) {
                              if (value != null) {
                                bloc.add(OnChangedOption(
                                    option: convertOption(value), id: item.id));
                              }
                            },
                            selectedValue: "oncePerDay".tr(),
                            options: ["oncePerDay".tr(), "oncePerMonth".tr()]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

extension IndexExtension on OptionModel {}

class ItemSalaryRowNonSlidable extends StatelessWidget {
  ItemSalaryRowNonSlidable({
    super.key,
    required this.title,
  });

  final String title;
  final List<OptionModel> listOption = [
    OptionModel(EnumType.day),
    OptionModel(EnumType.month)
  ];
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SalaryBloc>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            constraints: BoxConstraints(
              minWidth:
                  120.resizewidth(context), // Set your desired minimum width
            ),
            child: CustomText(
              title: title,
              fontWeight: FontWeight.normal,
              fontSize: 14,
              lineHeight: 18 / 14,
              colorText: CustomColors.blacktext,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputUnit(
                  borderColor: CustomColors.blueBorder,
                  onChanged: (value) {
                    if (value != null) {
                      final money = int.tryParse(value);
                      if (money != null) {
                        bloc.add(OnChangedWage(
                            money,
                            bloc.state.inputSalary.hourlyWage != 0
                                ? Wage.hourlyWage
                                : Wage.monthlyWage));
                      }
                    }
                  },
                  textAlign: TextAlign.end,
                  unit: 'VND',
                  inititialValue: bloc.state.inputSalary.hourlyWage != 0
                      ? bloc.state.inputSalary.hourlyWage.toString()
                      : bloc.state.inputSalary.monthlyWage.toString()),
              const SizedBox(height: 8),
              SizedBox(
                height: 32,
                child: CustomOutLineButtonPopUp(
                    vertical: 2,
                    horizontal: 6,
                    textColor: CustomColors.blacktext,
                    backgroundColor: Colors.white,
                    borderSideColor: CustomColors.blueBorder,
                    borderRadius: 8,
                    widthRadius: 1,
                    onChanged: (value) {
                      if (value != null) {
                        bloc.add(OnChangedWage(
                            bloc.state.inputSalary.hourlyWage != 0
                                ? bloc.state.inputSalary.hourlyWage
                                : bloc.state.inputSalary.monthlyWage,
                            convertOptionSalary(value)));
                      }
                    },
                    selectedValue: "oncePerDay".tr(),
                    options: ["oncePerDay".tr(), "oncePerMonth".tr()]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String convertIdOptiontoOption(int index) {
  devtool.log("convertIdOptiontoOption");
  if (index == EnumType.day.indexEnum) {
    devtool.log(EnumType.day.indexEnum.toString());
    devtool.log(EnumType.day.content);
    return EnumType.day.content;
  } else {
    devtool.log(EnumType.month.indexEnum.toString());
    devtool.log(EnumType.month.content);
    return EnumType.month.content;
  }
}

Wage convertOptionSalary(String option) {
  devtool.log("convertOptionSalary");
  if (option == EnumType.day.content) {
    devtool.log(EnumType.day.content);
    return Wage.hourlyWage;
  } else {
    devtool.log(EnumType.month.content);
    return Wage.monthlyWage;
  }
}
