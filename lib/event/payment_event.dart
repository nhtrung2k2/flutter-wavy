abstract class PaymentEvent {}

class LoadPaymentDataEvent extends PaymentEvent {
  final int shiftId;
  LoadPaymentDataEvent({required this.shiftId});
}

class ChangeMonthEvent extends PaymentEvent {
  final DateTime dateTime;
  ChangeMonthEvent({required this.dateTime});
}

class IncludeInPaymentEvent extends PaymentEvent {
  final int index;
  final bool value;
  IncludeInPaymentEvent({required this.index, required this.value});
}