import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/salary_bloc.dart';
import 'package:wavy/bloc/schedule_cubic.dart';

import 'package:wavy/model/schedule.dart';
import 'package:wavy/utils/convert_id_to_name.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/back_next.dart';
import 'package:wavy/view/components/custom_row_divide.dart';
import 'package:wavy/view/pages/Input_salary.dart';

import '../../model/input_salary.dart';
import '../../utils/colors/custom_colors.dart';
import '../components/begin_to_match_new_babysiter.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_text.dart';

class ReigsterBasicSettingPage extends StatelessWidget {
  const ReigsterBasicSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          nameTitle: "Register new babysister",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: RegisterBasicSetting(),
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
              const CustomText(
                  title: "Registering with following informations",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  lineHeight: (18 / 16),
                  colorText: CustomColors.blacktext),
              const RegisterBasicSettingForm(),
            ])));
  }
}

class RegisterBasicSettingForm extends StatelessWidget {
  const RegisterBasicSettingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.resizeheight(context),
        ),
        const ShiftTime(),
        const Salary(),
        SizedBox(
          height: 16.resizeheight(context),
        ),
        const CustomText(
            title: '* You can change the details in "Basic setting"',
            fontWeight: FontWeight.normal,
            fontSize: 14,
            lineHeight: 18 / 16,
            colorText: CustomColors.blacktext),
        SizedBox(
          height: 42.resizeheight(context),
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
            context.goNamed("register_baby_sister_input_salary");
          },
        ),
      ],
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
        const CustomText(
            title: "Shift time",
            fontWeight: FontWeight.bold,
            fontSize: 20,
            lineHeight: 32 / 20,
            colorText: CustomColors.blueBorder),
        const SizedBox(
          height: 16,
        ),
        ...listSchedule.map((schedule) => CustomRowDevide(
            firstChild: CustomText(
                title: schedule.day.name,
                fontWeight: FontWeight.normal,
                fontSize: 16,
                lineHeight: 18 / 16,
                colorText: CustomColors.blacktext),
            secondChild: schedule.notHaveAvailable
                ? const CustomText(
                    title: "Not Available",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    lineHeight: 18 / 16,
                    colorText: CustomColors.blacktext)
                : CustomText(
                    title: '${schedule.timeStart} ~ ${schedule.timeEnd}',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    lineHeight: 18 / 16,
                    colorText: CustomColors.blacktext)))
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
        const CustomText(
            title: "Salary",
            fontWeight: FontWeight.bold,
            fontSize: 20,
            lineHeight: 32 / 20,
            colorText: CustomColors.blueBorder),
        const SizedBox(
          height: 16,
        ),
        CustomRowDevide(
            firstChild: CustomText(
                title: inputSalary.hourlyWage != 0
                    ? "Hourly Wage"
                    : "Monthly Wage",
                fontWeight: FontWeight.normal,
                fontSize: 16,
                lineHeight: 18 / 16,
                colorText: CustomColors.blacktext),
            secondChild: CustomText(
                title:
                    '${inputSalary.hourlyWage != 0 ? inputSalary.hourlyWage : inputSalary.monthlyWage} VND',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                lineHeight: 18 / 16,
                colorText: CustomColors.blacktext)),
        ...inputSalary.itemSalary.map((item) => CustomRowDevide(
            firstChild:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText(
                  title: convertIdToName(item.id),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  lineHeight: 18 / 16,
                  colorText: CustomColors.blacktext),
              CustomText(
                  title: convertIdOptiontoOption(item.option),
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  lineHeight: 1,
                  colorText: CustomColors.grayText)
            ]),
            secondChild: CustomText(
                title: '${item.price} VND',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                lineHeight: 18 / 16,
                colorText: CustomColors.blacktext)))
      ],
    );
  }
}
