abstract class ConfirmScheduleEvent {}

class LoadDataConfirmScheduleEvent extends ConfirmScheduleEvent {
  final String babysisterId;
  LoadDataConfirmScheduleEvent({required this.babysisterId});
}

class NextMonthEvent extends ConfirmScheduleEvent {
  NextMonthEvent();
}

class PrevMonthEvent extends ConfirmScheduleEvent {
  PrevMonthEvent();
}

class CheckItemEvent extends ConfirmScheduleEvent {
  final int index;
  final bool value;
  CheckItemEvent({required this.index, required this.value});
}
