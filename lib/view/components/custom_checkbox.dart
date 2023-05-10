import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/bloc/schedule_cubic.dart';
import 'package:wavy/state/schedule.dart';
import 'package:wavy/utils/colors/custom_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.day});
  final DayOfWeek day;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ScheduleCubic>();
    final selected = context
        .select((ScheduleCubic cubit) =>
            cubit.state.listSchedule.where((element) => element.day == day))
        .first
        .notHaveAvailable;
    return InkWell(
      onTap: () {
        bloc.pickAvailable(day, !selected);
      },
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
            color: selected ? CustomColors.blueBorder : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1, color: CustomColors.blueBorder)),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4.25),
            child: selected
                ? Image.asset("assets/images/tick.png",
                    color: selected ? Colors.white : Colors.transparent)
                : Container()),
      ),
    );
  }
}
