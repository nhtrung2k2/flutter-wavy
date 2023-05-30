import 'package:wavy/model/input_salary.dart';
import 'package:wavy/model/input_shift.dart';
import 'package:wavy/model/schedule.dart';

abstract class ChangeSettingEvent {
  const ChangeSettingEvent();
}

class OnFetchChangeSettingEvent extends ChangeSettingEvent {
  const OnFetchChangeSettingEvent(this.shiftId);
  final int shiftId;

  @override
  List<Object?> get props => [shiftId];
}

class OnSubmmitedChangeSettingEvent extends ChangeSettingEvent {
  final InputSalary inputSalary;
  final List<Schedule> inputShifts;
  final int? shiftId;
  final String babysistterId;
  OnSubmmitedChangeSettingEvent({
    required this.babysistterId,
    required this.inputShifts,
    required this.inputSalary,
    required this.shiftId,
  });
}
