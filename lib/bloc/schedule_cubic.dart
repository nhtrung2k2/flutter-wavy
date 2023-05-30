import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wavy/service/getit/service_locator.dart';

import '../model/schedule.dart';
import '../repository/employees_repository.dart';
import '../state/schedule.dart';
import 'dart:developer' as devtool;

class ScheduleCubic extends Cubit<SheduleState> {
  final EmployeesRepository employeeRepo;

  ScheduleCubic(this.employeeRepo) : super(const SheduleListState([])) {
    // employeeRepo.getScheduleFromCache().then((listSchedule) {
    //   if (listSchedule.isNotEmpty) {
    //     emit(SheduleListState(listSchedule));
    //   } else {
    devtool.log("constructorScheduleCubic");
    emit(SheduleListState([
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
      Schedule(day: DayOfWeek.Thursday, timeStart: '12:00', timeEnd: '12:00'),
      Schedule(day: DayOfWeek.Friday, timeStart: '12:00', timeEnd: '12:00'),
      Schedule(day: DayOfWeek.Saturday, timeStart: '12:00', timeEnd: '12:00'),
      Schedule(day: DayOfWeek.Sunday, timeStart: '12:00', timeEnd: '12:00')
    ]));
  }
  // });
  // }
  void fetch(List<Schedule> listSchedule) async {
    devtool.log("fetch_schedule");
    devtool.log(listSchedule.toString());
    emit(ScheduleFetch(listSchedule));
  }

  void pickTimeStart(DayOfWeek day, TimeOfDay timeStart) {
    final listupdated = state.listSchedule.map((el) {
      if (el.day == day) {
        final element = el.copyWith(
            timeStart:
                '${timeStart.hour.toString().padLeft(2, '0')}:${timeStart.minute.toString().padLeft(2, '0')}');
        // devtool.log(element.toString());
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
        // devtool.log(elementUpdated.toString());
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

        // devtool.log(elementUpdated.toString());
        return elementUpdated;
      } else {
        return el;
      }
    }).toList();
    emit(PickTimeStartState(listupdated));
  }

  Future<void> submitSchedule() async {
    //submit
    devtool.log(state.listSchedule.toString());
    try {
      emit(SubmittedLoading(state.listSchedule));
      // await employeeRepo.saveScheduleToCache(state.listSchedule);
      //success

      emit(SuccessSchedule(state.listSchedule));
    } catch (e) {
      emit(FailSchedule(state.listSchedule, e.toString()));
    }

    //error
  }
}
