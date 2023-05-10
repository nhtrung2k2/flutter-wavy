import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../model/Schedule.dart';
import '../state/schedule.dart';
import 'dart:developer' as devtool;

class ScheduleCubic extends Cubit<SheduleState> {
  ScheduleCubic()
      : super(SheduleListState([
          Schedule(
            day: DayOfWeek.Monday,
            timeStart: '',
            timeEnd: '',
          ),
          Schedule(
            day: DayOfWeek.Tuesday,
            timeStart: '12:00',
            timeEnd: '12:00',
          ),
          Schedule(
            day: DayOfWeek.Wednesday,
            timeStart: '12:00',
            timeEnd: '12:00',
          ),
          Schedule(
              day: DayOfWeek.Thursday, timeStart: '12:00', timeEnd: '12:00'),
          Schedule(day: DayOfWeek.Friday, timeStart: '12:00', timeEnd: '12:00'),
          Schedule(
              day: DayOfWeek.Saturday, timeStart: '12:00', timeEnd: '12:00'),
          Schedule(day: DayOfWeek.Sunday, timeStart: '12:00', timeEnd: '12:00')
        ]));
  void pickTimeStart(DayOfWeek day, TimeOfDay timeStart) {
    final listupdated = state.listSchedule.map((el) {
      if (el.day == day) {
        final element = el.copyWith(
            timeStart:
                '${timeStart.hour.toString().padLeft(2, '0')}:${timeStart.minute.toString().padLeft(2, '0')}');
        devtool.log(element.toString());
        return element;
      } else {
        return el;
      }
    }).toList();
    emit(PickTimeStartState(listupdated));
  }

  void pickTimeEnd(DayOfWeek day, TimeOfDay timeEnd) {
    final listupdated = state.listSchedule.map((el) {
      if (el.day == day) {
        final elementUpdated = el.copyWith(
            timeEnd:
                '${timeEnd.hour.toString().padLeft(2, '0')}:${timeEnd.minute.toString().padLeft(2, '0')}');
        devtool.log(elementUpdated.toString());
        return elementUpdated;
      } else {
        return el;
      }
    }).toList();

    emit(PickTimeStartState(listupdated));
  }

  void pickAvailable(DayOfWeek day, bool notHaveAvailable) {
    final listupdated = state.listSchedule.map((el) {
      if (el.day == day) {
        late final Schedule elementUpdated;
        if (notHaveAvailable == true) {
          elementUpdated = el.copyWith(
              timeStart: '', timeEnd: '', notHaveAvailable: notHaveAvailable);
        } else {
          elementUpdated = el.copyWith(notHaveAvailable: notHaveAvailable);
        }

        devtool.log(elementUpdated.toString());
        return elementUpdated;
      } else {
        return el;
      }
    }).toList();
    emit(PickTimeStartState(listupdated));
  }

  void submitSchedule() {
    //submit
    emit(SubmittedSchedule(state.listSchedule));

    //success
    emit(SuccessSchedule(state.listSchedule));

    //error
  }
}
