import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/bloc/schedule_cubic.dart';
import 'package:wavy/state/schedule.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/resize.dart';

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
        height: 32.resizeheight(context),
        width: 32.resizewidth(context),
        decoration: BoxDecoration(
            color: selected ? CustomColors.blueBorder : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1, color: CustomColors.blueBorder)),
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 5.resizeheight(context),
                horizontal: 4.25.resizeheight(context)),
            child: selected
                ? Image.asset("assets/images/tick.png",
                    color: selected ? Colors.white : Colors.transparent)
                : Container()),
      ),
    );
  }
}
