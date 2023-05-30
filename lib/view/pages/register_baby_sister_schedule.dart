import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/schedule_cubic.dart';

import 'package:wavy/state/schedule.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_checkbox.dart';
import 'package:wavy/view/components/custom_ouline_button.dart';
import 'package:wavy/view/components/custom_text.dart';

import '../../utils/colors/custom_colors.dart';
import '../components/back_next.dart';
import '../components/begin_to_match_new_babysiter.dart';
import 'dart:developer' as devtool;

class RegisterBabySisterSchedulePage extends StatelessWidget {
  const RegisterBabySisterSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          nameTitle: "Register new babysister",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: RegisterBabySisterScheduleInfor(),
    );
  }
}

class RegisterBabySisterScheduleInfor extends StatelessWidget {
  const RegisterBabySisterScheduleInfor({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ScheduleCubic>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const BeginToMatchBabySister(),
          SizedBox(
            height: 20.resizeheight(context),
          ),
          const CustomText(
            title: "Please input shift",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            lineHeight: (18 / 16),
            colorText: CustomColors.blacktext,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 16.resizeheight(context),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(children: [
              CustomText(
                title: "Not available",
                fontWeight: FontWeight.normal,
                fontSize: 14,
                lineHeight: (18 / 14).resizeheight(context),
                colorText: CustomColors.blacktext,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.resizeheight(context),
              ),
            ]),
          ),
          const RegisterBabySisterScheduleForm(),
          SizedBox(
            height: 36.resizeheight(context),
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
              if (bloc.state is! SubmittedLoading) {
                bloc.submitSchedule().then((value) => {
                      if (bloc.state is SuccessSchedule)
                        {context.goNamed("register_baby_sister_input_salary")}
                    });
              }
            },
          ),
        ]),
      ),
    );
  }
}

class RegisterBabySisterScheduleForm extends StatelessWidget {
  const RegisterBabySisterScheduleForm({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.watch<ScheduleCubic>().state.listSchedule;
    devtool.log(context.watch<ScheduleCubic>().toString());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [for (final item in list) TimePickerRow(day: item.day)],
    );
  }
}

Future<TimeOfDay?> _showTimePicker(BuildContext context) async {
  final TimeOfDay? time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child ?? Container(),
      );
    },
  );
  return time;
}

@immutable
class TimePickerRow extends StatelessWidget {
  TimePickerRow({super.key, required this.day});
  final DayOfWeek day;

  bool isNotAvailable = true;
  @override
  Widget build(BuildContext context) {
    final row = context
        .select((ScheduleCubic cubit) =>
            cubit.state.listSchedule.where((element) => element.day == day))
        .first;
    // final bloc = context.read<ScheduleCubic>();
    // if (row.timeStart != "" && row.timeEnd != "") {
    //   devtool.log("pick available");
    //   bloc.pickAvailable(day, true);
    // }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 18.resizeheight(context),
          width: 90.resizewidth(context),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              title: day.name,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              lineHeight: (18 / 14).resizeheight(context),
              colorText: CustomColors.blacktext,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 60.resizewidth(context),
                child: CustomOutLineButton(
                    title: row.timeStart,
                    vertical: 0,
                    horizontal: 0,
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    borderSideColor: CustomColors.blueBorder,
                    borderRadius: 8,
                    widthRadius: 1,
                    onPressed: () {
                      TimeOfDay? timeStart;
                      _showTimePicker(context).then((value) => {
                            timeStart = value,
                            context.read<ScheduleCubic>().pickTimeStart(
                                day, timeStart ?? TimeOfDay.now())
                          });
                    }),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  child: CustomText(
                    title: "~",
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    lineHeight: (18 / 14),
                    colorText: CustomColors.blacktext,
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                width: 60.resizewidth(context),
                child: CustomOutLineButton(
                    title: row.timeEnd,
                    vertical: 0,
                    horizontal: 0,
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    borderSideColor: CustomColors.blueBorder,
                    borderRadius: 8,
                    widthRadius: 1,
                    onPressed: () {
                      TimeOfDay? timeEnd;
                      _showTimePicker(context).then((value) => {
                            timeEnd = value,
                            context
                                .read<ScheduleCubic>()
                                .pickTimeEnd(day, timeEnd ?? TimeOfDay.now()),
                          });
                    }),
              ),
            ],
          ),
        ),
        SizedBox(
            width: 90.resizewidth(context),
            child: Align(
                alignment: Alignment.center, child: CustomCheckBox(day: day)))
      ]),
    );
  }
}
