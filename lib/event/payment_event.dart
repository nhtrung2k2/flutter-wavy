abstract class PaymentEvent {}

class LoadPaymentDataEvent extends PaymentEvent {
  final String babysisterId;
  final int shiftId;
  LoadPaymentDataEvent({required this.babysisterId, required this.shiftId});
}

class ChangeMonthEvent extends PaymentEvent {
  final DateTime dateTime;
  final int shiftId;
  ChangeMonthEvent({required this.shiftId, required this.dateTime});
}

class IncludeInPaymentEvent extends PaymentEvent {
  final int index;
  final bool value;
  IncludeInPaymentEvent({required this.index, required this.value});
}

class AddItemEvent extends PaymentEvent {
  final int itemId;
  final int price;
  final int optionId;
  AddItemEvent({required this.itemId, required this.price, required this.optionId});
}

class RemoveItemEvent extends PaymentEvent {
  final int index;
  RemoveItemEvent({required this.index});
}

class PayEvent extends PaymentEvent {
  PayEvent();
}