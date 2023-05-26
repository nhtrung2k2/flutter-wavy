import 'package:wavy/model/employee.dart';
import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/model/item.dart';
import 'package:wavy/model/payment.dart';

enum PaymentStateStatus {
  loading,
  success,
  failure,
  emptyPayment,
  paying,
  paid,
  payFailed
}

enum CanPayStatus{
  beingCalculated,
  payNow,
  paid
}

class PaymentState {
  final Employee_Detail? employee;
  final Payment? payment;
  final int month;
  final int year;
  final PaymentStateStatus paymentStateStatus;
  final CanPayStatus canPayStatus;
  const PaymentState({
    required this.employee,
    required this.payment,
    required this.month,
    required this.year,
    required this.paymentStateStatus,
    required this.canPayStatus
  });
  factory PaymentState.initial() => PaymentState(
    employee: null,
    payment: null,
    month: DateTime.now().month,
    year: DateTime.now().year,
    paymentStateStatus: PaymentStateStatus.loading,
    canPayStatus: CanPayStatus.beingCalculated
  );

  PaymentState copyWith({
    Employee_Detail? employee,
    Payment? payment,
    int? month,
    int? year,
    PaymentStateStatus? paymentStateStatus,
    CanPayStatus? canPayStatus
  }) {
    return PaymentState(
      employee: employee ?? this.employee,
      payment: payment ?? this.payment,
      month: month ?? this.month,
      year: year ?? this.year,
      paymentStateStatus: paymentStateStatus ?? this.paymentStateStatus,
      canPayStatus: canPayStatus ?? this.canPayStatus
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
