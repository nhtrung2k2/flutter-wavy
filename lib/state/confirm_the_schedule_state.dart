import 'package:wavy/model/employee.dart';

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
  final Employee? employee;
  final int month;
  final int year;
  final List<bool> schedule;
  final InformationStatus inforStatus;
  final MonthScheduleStatus monthScheduleStatus;
  const ConfirmTheScheduleState({
    required this.employee,
    required this.month,
    required this.year,
    required this.schedule,
    required this.inforStatus,
    required this.monthScheduleStatus
  });
  factory ConfirmTheScheduleState.initial() => ConfirmTheScheduleState(
    employee: null,
    month: DateTime.now().month,
    year: DateTime.now().year,
    schedule: [],
    inforStatus: InformationStatus.loading,
    monthScheduleStatus: MonthScheduleStatus.loading
  );

  ConfirmTheScheduleState copyWith({
    Employee? employee,
    int? month,
    int? year,
    List<bool>? schedule,
    InformationStatus? informationStatus,
    MonthScheduleStatus? monthScheduleStatus
  }) {
    return ConfirmTheScheduleState(
      employee: employee ?? this.employee,
      month: month ?? this.month,
      year: year ?? this.year,
      schedule: schedule ?? this.schedule,
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

  checkItem(int index, bool value){
    schedule[index] = value;
    return ConfirmTheScheduleState(
        employee: employee,
        month: month,
        year: year,
        schedule: schedule,
        inforStatus: inforStatus,
        monthScheduleStatus: MonthScheduleStatus.success
    );
  }

  _monthChange(int del){
    var m = month + del;
    return ConfirmTheScheduleState(
        employee: employee,
        month: m == 0 ? 12 : (m == 13 ? 1 : m),
        year: m == 0 ? year - 1 : (m == 13 ? year + 1: year),
        schedule: schedule,
        inforStatus: inforStatus,
        monthScheduleStatus: MonthScheduleStatus.loading
    );
  }
}
