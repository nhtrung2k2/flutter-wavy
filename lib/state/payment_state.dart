import 'package:wavy/model/employee.dart';
import 'package:wavy/model/item.dart';
import 'package:wavy/model/payment.dart';

enum PaymentStateStatus {
  loading,
  success,
  failure
}

class PaymentState {
  final Employee? employee;
  final Payment? payment;
  final int month;
  final int year;
  final PaymentStateStatus paymentStateStatus;
  const PaymentState({
    required this.employee,
    required this.payment,
    required this.month,
    required this.year,
    required this.paymentStateStatus
  });
  factory PaymentState.initial() => PaymentState(
    employee: null,
    payment: null,
    month: DateTime.now().month,
    year: DateTime.now().year,
    paymentStateStatus: PaymentStateStatus.loading
  );

  PaymentState copyWith({
    Employee? employee,
    Payment? payment,
    int? month,
    int? year,
    PaymentStateStatus? paymentStateStatus
  }) {
    return PaymentState(
      employee: employee ?? this.employee,
      payment: payment ?? this.payment,
      month: month ?? this.month,
      year: year ?? this.year,
      paymentStateStatus: paymentStateStatus ?? this.paymentStateStatus
    );
  }

  int totalCost(){
    int total = payment?.labourCost ?? 0;
    for(Item item in payment?.items ?? []){
      total += item.includeInPayment == 1 ? item.itemAmount : 0;
    }
    return total;
  }

}
