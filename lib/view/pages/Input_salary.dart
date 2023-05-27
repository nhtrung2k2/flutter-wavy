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

class InputSalaryPage extends StatelessWidget {
  const InputSalaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          nameTitle: "Register new babysistter",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: InputSalaryView(),
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
              const CustomText(
                title: "Please input salary",
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
                firstButton: "Back",
                secondButton: "Next",
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
  // List<ItemSalary> listItem = const [
  //   ItemSalary(id: 1, price: 10, option: 1),
  //   ItemSalary(id: 2, price: 10, option: 1),
  //   ItemSalary(id: 3, price: 10, option: 2),
  //   ItemSalary(id: 4, price: 10, option: 2),
  // ];
  @override
  Widget build(BuildContext context) {
    List<ItemSalary> listItem =
        context.select((SalaryBloc bloc) => bloc.state.inputSalary.itemSalary);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: ItemSalaryRowNonSlidable(
            title: "Wage",
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
            title: '+ Add more item',
            vertical: 8,
            horizontal: 16,
            textColor: Colors.white,
            backgroundColor: CustomColors.blueBorder,
            borderRadius: 8,
            onPressed: () {
              showChoiceDialog(context, const [
                ItemSalary(id: 1, price: 0, option: 1),
                ItemSalary(id: 2, price: 0, option: 1),
                ItemSalary(id: 3, price: 0, option: 2),
                ItemSalary(id: 4, price: 0, option: 2),
              ]);
            }),
      ],
    );
  }
}

class ItemSalaryRowSlidable extends StatelessWidget {
  const ItemSalaryRowSlidable({
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
              label: 'Delete',
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
                            selectedValue: "Once per day",
                            options: const ['Once per month', 'Once per day']),
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

class ItemSalaryRowNonSlidable extends StatelessWidget {
  const ItemSalaryRowNonSlidable({
    super.key,
    required this.title,
  });

  final String title;

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
                    selectedValue: "Once per day",
                    options: const ['Once per month', 'Once per day']),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

int convertOption(String option) {
  switch (option) {
    case "Once per day":
      return 2;
    case "Once per month":
      return 1;
    default:
      return 2;
  }
}

String convertIdOptiontoOption(int option) {
  switch (option) {
    case 2:
      return "Once per day";
    case 1:
      return "Once per month";
    default:
      return "Once per day";
  }
}

Wage convertOptionSalary(String option) {
  switch (option) {
    case "Once per day":
      return Wage.hourlyWage;
    case "Once per month":
      return Wage.monthlyWage;
    default:
      return Wage.hourlyWage;
  }
}
