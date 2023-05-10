import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:wavy/state/schedule.dart';
import 'dart:developer' as devtool;

int differMinutes(String timeStart, String timeEnd) {
  List<String> parts1 = timeStart.split(':');
  final hourStart = int.parse(parts1[0]);
  final minuteStart = int.parse(parts1[1]);
  final minutesTimeStart = hourStart * 60 + minuteStart;
  List<String> parts2 = timeEnd.split(':');
  final hourEnd = int.parse(parts2[0]);
  final minuteEnd = int.parse(parts2[1]);
  final minutesTimeEnd = hourEnd * 60 + minuteEnd;
  if (minutesTimeEnd - minutesTimeStart > 0) {
    devtool.log(">0");
    devtool.log(minutesTimeEnd.toString());
    devtool.log(minutesTimeStart.toString());

    return minutesTimeEnd - minutesTimeStart;
  } else {
    if (hourEnd == 0) {
      devtool.log("=0");
      devtool.log(minutesTimeEnd.toString());
      devtool.log(minutesTimeStart.toString());
      return 24 * 60 - minutesTimeStart;
    } else {
      devtool.log("<0");
      devtool.log(minutesTimeEnd.toString());
      devtool.log(minutesTimeStart.toString());
      return minutesTimeEnd - minutesTimeStart;
    }
  }
}

@immutable
class Schedule extends Equatable {
  Schedule({
    required this.day,
    required this.timeStart,
    required this.timeEnd,
  })  : isError = timeStart != '' && timeEnd != ''
            ? (differMinutes(timeStart, timeEnd) <= 0)
            : false,
        notHaveAvailable = timeStart == '' && timeEnd == '';

  final DayOfWeek day;
  final String timeStart;
  final String timeEnd;
  final bool notHaveAvailable;
  final bool isError;
  Schedule copyWith({
    DayOfWeek? day,
    String? timeStart,
    String? timeEnd,
    bool? notHaveAvailable,
  }) {
    return Schedule(
      day: day ?? this.day,
      timeStart: timeStart ?? this.timeStart,
      timeEnd: timeEnd ?? this.timeEnd,
    );
  }

  @override
  List<Object?> get props => [day, timeStart, timeEnd, notHaveAvailable];
}
