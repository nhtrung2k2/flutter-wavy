import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/model/schedule_confirm.dart';

enum InformationStatus {
  loading,
  success,
  failure
}

enum MonthScheduleStatus{
  change,
  loading,
  success,
  failure
}

class ConfirmTheScheduleState {
  final Employee_Detail? employee;
  final int month;
  final int year;
  final List<ScheduleConfirm> scheduleConfirms;
  final InformationStatus inforStatus;
  final MonthScheduleStatus monthScheduleStatus;
  const ConfirmTheScheduleState({
    required this.employee,
    required this.month,
    required this.year,
    required this.scheduleConfirms,
    required this.inforStatus,
    required this.monthScheduleStatus
  });
  factory ConfirmTheScheduleState.initial() => ConfirmTheScheduleState(
    employee: null,
    month: DateTime.now().month,
    year: DateTime.now().year,
    scheduleConfirms: [],
    inforStatus: InformationStatus.loading,
    monthScheduleStatus: MonthScheduleStatus.loading
  );

  ConfirmTheScheduleState copyWith({
    Employee_Detail? employee,
    int? month,
    int? year,
    List<ScheduleConfirm>? scheduleConfirms,
    InformationStatus? informationStatus,
    MonthScheduleStatus? monthScheduleStatus
  }) {
    return ConfirmTheScheduleState(
      employee: employee ?? this.employee,
      month: month ?? this.month,
      year: year ?? this.year,
      scheduleConfirms: scheduleConfirms ?? this.scheduleConfirms,
      inforStatus: informationStatus ?? inforStatus,
      monthScheduleStatus: monthScheduleStatus ?? this.monthScheduleStatus
    );
  }

  nextMonth(){
    return _monthChange(1);
  }

  prevMonth(){
    return _monthChange(-1);
  }

  _monthChange(int del){
    var m = month + del;
    return ConfirmTheScheduleState(
        employee: employee,
        month: m == 0 ? 12 : (m == 13 ? 1 : m),
        year: m == 0 ? year - 1 : (m == 13 ? year + 1: year),
        scheduleConfirms: scheduleConfirms,
        inforStatus: inforStatus,
        monthScheduleStatus: MonthScheduleStatus.loading
    );
  }
}
