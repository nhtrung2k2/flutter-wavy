import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wavy/event/confirm_schedule_event.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/model/schedule_confirm.dart';
import 'package:wavy/repository/confirm_the_schedule_repository.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/confirm_the_schedule_state.dart';

class ConfirmTheScheduleBloc extends Bloc<ConfirmScheduleEvent, ConfirmTheScheduleState> {

  final EmployeesRepository _employeesRepository;
  final ConfirmTheScheduleRepository _confirmTheScheduleRepository = ServiceLocator.locator.get<ConfirmTheScheduleRepository>();

  ConfirmTheScheduleBloc(this._employeesRepository) : super(ConfirmTheScheduleState.initial()) {
    on<LoadDataConfirmScheduleEvent>(_onLoadData);
    on<NextMonthEvent>(_onNextMonth);
    on<PrevMonthEvent>(_onPrevMonth);
    on<CheckItemEvent>(_onCheckItem);
  }

  Future<void> _onLoadData(
    LoadDataConfirmScheduleEvent event,
    Emitter<ConfirmTheScheduleState> emit,
  ) async {

    emit(state);

    try {
      // Employee_Detail employee_detail = await _employeesRepository.fetchEmployDetail(event.babysisterId);
      // List<ScheduleConfirm> scheduleConfirms = await _confirmTheScheduleRepository.fetchScheduleConfirm(event.shiftId, DateFormat('yyyy-MM').format(DateTime.now()));
      emit(state.copyWith(
        employee: Employee(id: '1', name: 'Test Babysister', age: '30', city: 'Ho Chi Minh', shiftId: 1, cancel__contract_date: DateTime(2025, 01, 01)),
        schedule: [false, false, false, false, false, false, false, false, false, false, false, false, false],
        informationStatus: InformationStatus.success,
        monthScheduleStatus: MonthScheduleStatus.success
      ));
    } catch (e) {
      emit(state.copyWith(
        informationStatus: InformationStatus.failure,
        monthScheduleStatus: MonthScheduleStatus.failure
      ));
    }

  }

  Future<void> _onNextMonth(
      NextMonthEvent event,
      Emitter<ConfirmTheScheduleState> emit,
      ) async {


    emit(state.nextMonth());

    try {
      //await function to get schedule data
      emit(state.copyWith(
          schedule: [false, false, false, false, false, false, false, false, false, false, false, false, false],
          monthScheduleStatus: MonthScheduleStatus.success
      ));
    } catch (_) {
      emit(state.copyWith(
          monthScheduleStatus: MonthScheduleStatus.failure
      ));
    }

  }

  Future<void> _onPrevMonth(
      PrevMonthEvent event,
      Emitter<ConfirmTheScheduleState> emit,
      ) async {


    emit(state.prevMonth());

    try {
      //await function to get schedule data
      emit(state.copyWith(
          schedule: [false, false, false, false, false, false, false, false, false, false, false, false, false],
          monthScheduleStatus: MonthScheduleStatus.success
      ));
    } catch (_) {
      emit(state.copyWith(
          monthScheduleStatus: MonthScheduleStatus.failure
      ));
    }

  }

  Future<void> _onCheckItem(
      CheckItemEvent event,
      Emitter<ConfirmTheScheduleState> emit,
      ) async {

    emit(state.checkItem(event.index, event.value));

  }

}
