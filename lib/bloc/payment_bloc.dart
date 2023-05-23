import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/event/payment_event.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/model/item.dart';
import 'package:wavy/model/payment.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/repository/payment_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {

  final EmployeesRepository _employeesRepository = ServiceLocator.locator.get<EmployeesRepository>();
  final PaymentRepository _paymentRepository = ServiceLocator.locator.get<PaymentRepository>();

  PaymentBloc() : super(PaymentState.initial()) {
    on<LoadPaymentDataEvent>(_onLoadData);
    on<ChangeMonthEvent>(_onChangeMonth);
    on<IncludeInPaymentEvent>(_onIncludeItemInPayment);
  }

  Future<void> _onLoadData(
    LoadPaymentDataEvent event,
    Emitter<PaymentState> emit,
  ) async {

    emit(state);

    try {
      // Employee_Detail employee_detail = await _employeesRepository.fetchEmployDetail(event.babysisterId);
      // Payment paymentData = await _paymentRepository.fetchPaymentData(event.shiftId, DateFormat('yyyy-MM').format(DateTime.now()));
      emit(state.copyWith(
        employee: Employee(id: '1', name: 'Test Babysister', age: '30', city: 'Ho Chi Minh', shiftId: 1),
        payment: Payment.fromJson(paymentDummyJson),
        paymentStateStatus: PaymentStateStatus.success
      ));
    } catch (e) {
      emit(state.copyWith(
        paymentStateStatus: PaymentStateStatus.failure
      ));
    }

  }

  Future<void> _onChangeMonth(
      ChangeMonthEvent event,
      Emitter<PaymentState> emit,
      ) async {

    emit(state.copyWith(
      year: event.dateTime.year,
      month: event.dateTime.month,
      paymentStateStatus: PaymentStateStatus.loading
    ));

    try {
      // Employee_Detail employee_detail = await _employeesRepository.fetchEmployDetail(event.babysisterId);
      // Payment paymentData = await _paymentRepository.fetchPaymentData(event.shiftId, DateFormat('yyyy-MM').format(DateTime.now()));
      emit(state.copyWith(
          employee: Employee(id: '1', name: 'Test Babysister', age: '30', city: 'Ho Chi Minh', shiftId: 1),
          payment: Payment.fromJson(paymentDummyJson),
          paymentStateStatus: PaymentStateStatus.success
      ));
    } catch (e) {
      emit(state.copyWith(
          paymentStateStatus: PaymentStateStatus.failure
      ));
    }

  }

  Future<void> _onIncludeItemInPayment(
      IncludeInPaymentEvent event,
      Emitter<PaymentState> emit,
      ) async {

    Payment payment = state.payment!;
    List<Item> items = [];
    for(int i=0; i<payment.items.length; i++){
      if(i==event.index){
        items.add(payment.items[i].copyWith(
          includeInPayment: event.value ? 1 : 0
        ));
      }
      else{
        items.add(payment.items[i]);
      }
    }

    emit(state.copyWith(
      payment: state.payment?.copyWith(
        items: items
      )
    ));

  }

}

const paymentDummyJson = {
  "payment_month": "2023-05",
  "labour_cost": 8000000,
  "hour_woking": 8,
  "hourly_wage": 50000,
  "payment_amount": 600000,
  "payment_status" : 0,
  "items": [
    {
      "item_id": 8,
      "item_name": "Tet bonus",
      "item_amount": 500000,
      "include_in_payment" : 0
    },
    {
      "item_id": 9,
      "item_name": "Contract-end bonus",
      "item_amount": 500000,
      "include_in_payment" : 1
    },
  ]
};