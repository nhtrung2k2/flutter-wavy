import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/model/shift_salary_employee.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/repository/user_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/employee_change_setting.dart';

import '../event/change_setting_event.dart';
import '../model/input_shift.dart';
import '../model/schedule.dart';
import 'dart:developer' as devtool;

class EmployeeChangeSettingBloc
    extends Bloc<ChangeSettingEvent, ChangeSettingState> {
  final EmployeesRepository _employeesRepository;

  EmployeeChangeSettingBloc(this._employeesRepository)
      : super(const InitialState()) {
    on<OnFetchChangeSettingEvent>(_fetch);
    on<OnSubmmitedChangeSettingEvent>(_submitted);
  }

  Future<void> _fetch(
    OnFetchChangeSettingEvent event,
    Emitter<ChangeSettingState> emit,
  ) async {
    try {
      emit(const FetchLoading());
      ShiftSalaryEmployee shiftSalaryEmployee =
          await _employeesRepository.getChangeSetting(event.shiftId);

      emit(FetchSuccess(shiftSalaryEmployee: shiftSalaryEmployee));
    } catch (e) {
      emit(FetchError(errorMessage: e.toString()));
    }
  }

  Future<void> _submitted(
    OnSubmmitedChangeSettingEvent event,
    Emitter<ChangeSettingState> emit,
  ) async {
    try {
      emit(const SubmittingChangeSetting());
      final userId =
          ServiceLocator.locator.get<SharedPreferences>().getString('userId');

      if (userId == null) {
        devtool.log("Have some problem with id user");
        throw Exception('Have some problem with id user');
      }
      devtool.log('EmployeeChangeSettingBloc');
      devtool.log(event.shiftId.toString());
      final ShiftSalaryEmployee shiftSalaryEmployee = ShiftSalaryEmployee(
        userId: userId,
        babysistterId: event.babysistterId,
        shiftId: event.shiftId,
        inputShift: convertScheduleListToInputShiftList(event.inputShifts),
        inputSalary: event.inputSalary,
      );
      // devtool.log("submitted");
      // convertScheduleListToInputShiftList(event.inputShifts).forEach((element) {
      //   devtool.log(element.toJson().toString());
      // });
      // devtool.log(event.inputSalary.toJson().toString());
      await _employeesRepository.saveChangeSetting(shiftSalaryEmployee);

      emit(SubmittedSuccessChangeSetting(
          shiftSalaryEmployee: shiftSalaryEmployee));
    } catch (e) {
      devtool.log(e.toString());
      emit(SubmittedErrorChangeSetting(errorMessage: e.toString()));
    }
  }
}

List<InputShift> convertScheduleListToInputShiftList(
    List<Schedule> scheduleList) {
  List<InputShift> list = [];
  for (int i = 0; i < scheduleList.length; i++) {
    list.add(InputShift.fromJson(scheduleList[i].toJson()));
  }
  return list;
}

List<Schedule> convertInputShiftListToScheduleList(
    List<InputShift> inputShift) {
  List<Schedule> list = [];
  for (int i = 0; i < inputShift.length; i++) {
    list.add(Schedule.fromJson(i, inputShift[i].toJson()));
  }
  return list;
}
