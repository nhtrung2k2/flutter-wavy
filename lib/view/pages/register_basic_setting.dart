import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/employee_change_setting.dart';
import 'package:wavy/bloc/employee_search_bloc.dart';
import 'package:wavy/bloc/salary_bloc.dart';
import 'package:wavy/bloc/schedule_cubic.dart';
import 'package:wavy/event/change_setting_event.dart';

import 'package:wavy/model/schedule.dart';
import 'package:wavy/utils/convert_id_to_name.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/back_next.dart';
import 'package:wavy/view/components/custom_row_divide.dart';
import 'package:wavy/view/pages/Input_salary.dart';

import '../../model/input_salary.dart';
import '../../state/employee_change_setting.dart';
import '../../state/employee_search_state.dart';
import '../../utils/colors/custom_colors.dart';
import '../components/begin_to_match_new_babysiter.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_text.dart';
import 'dart:developer' as devtool;
import '../pages/login.dart';

class ReigsterBasicSettingPage extends StatelessWidget {
  const ReigsterBasicSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          nameTitle: "registerNewBabysitter".tr(),
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: const RegisterBasicSetting(),
    );
  }
}

class RegisterBasicSetting extends StatelessWidget {
  const RegisterBasicSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              const BeginToMatchBabySister(),
              SizedBox(
                height: 20.resizeheight(context),
              ),
              CustomText(
                title: "registeringWithFollowingInformations".tr(),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                lineHeight: (18 / 16),
                colorText: CustomColors.blacktext,
                textAlign: TextAlign.start,
              ),
              const RegisterBasicSettingForm(),
            ])));
  }
}

class RegisterBasicSettingForm extends StatelessWidget {
  const RegisterBasicSettingForm({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeChangeSettingBloc = context.read<EmployeeChangeSettingBloc>();
    final searchBloc = context.read<EmployeeSearchBloc>();
    final inputSalaryBloc = context.read<SalaryBloc>();
    final scheduleBloc = context.read<ScheduleCubic>();
    return BlocListener<EmployeeChangeSettingBloc, ChangeSettingState>(
      listener: (context, state) {
        devtool.log(state.toString());
        if (state is SubmittedSuccessChangeSetting) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
        if (state is SubmittedErrorChangeSetting) {
          showErrorDialog(context, "Error",
              "theBabysitterWasRegisteredContract".tr(), "yes".tr(), () {
            context.pop();
            Navigator.of(context).popUntil((route) => route.isFirst);
          });
        }
      },
      child: Column(
        children: [
          SizedBox(
            height: 16.resizeheight(context),
          ),
          const ShiftTime(),
          const Salary(),
          SizedBox(
            height: 16.resizeheight(context),
          ),
          CustomText(
            title: 'youCanChangeTheDetailsInBasicSetting'.tr(),
            fontWeight: FontWeight.normal,
            fontSize: 14,
            lineHeight: 18 / 16,
            colorText: CustomColors.blacktext,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 42.resizeheight(context),
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
              employeeChangeSettingBloc.add(OnSubmmitedChangeSettingEvent(
                  shiftId: null,
                  babysistterId:
                      (searchBloc.state as SubmittedSuccess).employeeDetail.id,
                  inputShifts: (scheduleBloc.state.listSchedule),
                  inputSalary: (inputSalaryBloc.state.inputSalary)));
            },
          ),
        ],
      ),
    );
  }
}

class ShiftTime extends StatelessWidget {
  const ShiftTime({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Schedule> listSchedule =
        context.select((ScheduleCubic cubic) => cubic.state.listSchedule);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: "shiftTime".tr(),
          fontWeight: FontWeight.bold,
          fontSize: 20,
          lineHeight: 32 / 20,
          colorText: CustomColors.blueBorder,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 16,
        ),
        ...listSchedule.map((schedule) => CustomRowDevide(
            firstChild: CustomText(
              title: schedule.day.name.tr(),
              fontWeight: FontWeight.normal,
              fontSize: 16,
              lineHeight: 18 / 16,
              colorText: CustomColors.blacktext,
              textAlign: TextAlign.start,
            ),
            secondChild: schedule.notHaveAvailable
                ? CustomText(
                    title: "notAvailable".tr(),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    lineHeight: 18 / 16,
                    colorText: CustomColors.blacktext,
                    textAlign: TextAlign.end,
                  )
                : CustomText(
                    title: '${schedule.timeStart} ~ ${schedule.timeEnd}',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    lineHeight: 18 / 16,
                    colorText: CustomColors.blacktext,
                    textAlign: TextAlign.end)))
      ],
    );
  }
}

class Salary extends StatelessWidget {
  const Salary({super.key});

  @override
  Widget build(BuildContext context) {
    final InputSalary inputSalary =
        context.select((SalaryBloc bloc) => bloc.state.inputSalary);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: "salary".tr(),
          fontWeight: FontWeight.bold,
          fontSize: 20,
          lineHeight: 32 / 20,
          colorText: CustomColors.blueBorder,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomRowDevide(
          firstChild: CustomText(
            title: inputSalary.hourlyWage != 0
                ? "hourlyWage".tr()
                : "monthlyWage".tr(),
            fontWeight: FontWeight.normal,
            fontSize: 16,
            lineHeight: 18 / 16,
            colorText: CustomColors.blacktext,
            textAlign: TextAlign.start,
          ),
          secondChild: CustomText(
              title:
                  '${inputSalary.hourlyWage != 0 ? inputSalary.hourlyWage : inputSalary.monthlyWage} VND',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              lineHeight: 18 / 16,
              colorText: CustomColors.blacktext,
              textAlign: TextAlign.start),
        ),
        ...inputSalary.itemSalary.map((item) => CustomRowDevide(
            firstChild:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText(
                title: convertIdToName(item.id),
                fontWeight: FontWeight.normal,
                fontSize: 16,
                lineHeight: 18 / 16,
                colorText: CustomColors.blacktext,
                textAlign: TextAlign.start,
              ),
              CustomText(
                title: convertIdOptiontoOption(item.option),
                fontWeight: FontWeight.normal,
                fontSize: 14,
                lineHeight: 1,
                colorText: CustomColors.grayText,
                textAlign: TextAlign.start,
              )
            ]),
            secondChild: CustomText(
                title: '${item.price} VND',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                lineHeight: 18 / 16,
                colorText: CustomColors.blacktext,
                textAlign: TextAlign.end)))
      ],
    );
  }
}
