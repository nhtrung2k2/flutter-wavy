abstract class ConfirmScheduleEvent {}

class LoadDataConfirmScheduleEvent extends ConfirmScheduleEvent {
  final String babysisterId;
  final int shiftId;
  LoadDataConfirmScheduleEvent({required this.babysisterId, required this.shiftId});
}

class NextMonthEvent extends ConfirmScheduleEvent {
  final int shiftId;
  NextMonthEvent({required this.shiftId});
}

class PrevMonthEvent extends ConfirmScheduleEvent {
  final int shiftId;
  PrevMonthEvent({required this.shiftId});
}

class CheckItemEvent extends ConfirmScheduleEvent {
  final int amountId;
  final bool value;
  CheckItemEvent({required this.amountId, required this.value});
}
