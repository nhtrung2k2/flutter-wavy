import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wavy/event/payment_event.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/model/item.dart';
import 'package:wavy/model/payment.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/repository/payment_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {

  final EmployeesRepository _employeesRepository;
  final PaymentRepository _paymentRepository = ServiceLocator.locator.get<PaymentRepository>();

  PaymentBloc(this._employeesRepository) : super(PaymentState.initial()) {
    on<LoadPaymentDataEvent>(_onLoadData);
    on<ChangeMonthEvent>(_onChangeMonth);
    on<IncludeInPaymentEvent>(_onIncludeItemInPayment);
    on<AddNewItemEvent>(_onAddNewItem);
    on<ChangePriceEvent>(_onChangePrice);
    on<RemoveItemEvent>(_onRemoveItem);
    on<PayEvent>(_onPay);
  }

  Future<void> _onLoadData(
      LoadPaymentDataEvent event,
      Emitter<PaymentState> emit,
      ) async {

    emit(state.copyWith(
        month: DateTime.now().month,
        year: DateTime.now().year,
        paymentStateStatus: PaymentStateStatus.loading
    ));

    try {
      Employee_Detail employeeDetail = await _employeesRepository.fetchEmployDetail(event.babysisterId, event.shiftId);
      emit(state.copyWith(employee: employeeDetail));

      Payment paymentData = await _paymentRepository.fetchPaymentData(event.shiftId, DateFormat('yyyy-MM').format(DateTime(state.year, state.month)));

      DateTime now = DateTime.now();
      int lastDayOfThisMonth = DateTime(now.year, now.month + 1, 0).day;
      CanPayStatus canPay = paymentData.paymentStatus == 1 ? CanPayStatus.paid : (lastDayOfThisMonth == now.day ? CanPayStatus.payNow : CanPayStatus.beingCalculated);
      List<Item> items = [];
      items.addAll(paymentData.items.map((e) => e.copyWith(
          canRemove: false
      )));

      emit(state.copyWith(
          payment: paymentData.copyWith(items: items),
          paymentStateStatus: PaymentStateStatus.success,
          canPayStatus: canPay
      ));
    } catch (e) {
      if(e.toString().contains('EMPTY_PAYMENT')){
        emit(state.copyWith(
            paymentStateStatus: PaymentStateStatus.emptyPayment
        ));
      }
      else{
        emit(state.copyWith(
            paymentStateStatus: PaymentStateStatus.failure
        ));
      }
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
      Payment paymentData = await _paymentRepository.fetchPaymentData(event.shiftId, DateFormat('yyyy-MM').format(DateTime(state.year, state.month)));

      DateTime now = DateTime.now();
      int lastDayOfThisMonth = DateTime(now.year, now.month + 1, 0).day;
      CanPayStatus canPay = paymentData.paymentStatus == 1 ? CanPayStatus.paid : (lastDayOfThisMonth == now.day ? CanPayStatus.payNow : CanPayStatus.beingCalculated);
      List<Item> items = [];
      items.addAll(paymentData.items.map((e) => e.copyWith(
          canRemove: false
      )));
      emit(state.copyWith(
          payment: paymentData.copyWith(items: items),
          paymentStateStatus: PaymentStateStatus.success,
          canPayStatus: canPay
      ));
    } catch (e) {
      if(e.toString().contains('EMPTY_PAYMENT')){
        emit(state.copyWith(
            paymentStateStatus: PaymentStateStatus.emptyPayment
        ));
      }
      else{
        emit(state.copyWith(
            paymentStateStatus: PaymentStateStatus.failure
        ));
      }
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

  Future<void> _onAddNewItem(
      AddNewItemEvent event,
      Emitter<PaymentState> emit,
      ) async {

    List<Item> items = [];
    items.addAll(state.payment?.items ?? []);
    items.add(Item(itemId: event.itemId, itemName: itemCost.singleWhere((element) => element['id']==event.itemId)['name'], itemAmount: 0));

    emit(state.copyWith(
        payment: state.payment!.copyWith(
            items: items
        ),
        paymentStateStatus: PaymentStateStatus.updatedItem
    ));

  }

  Future<void> _onChangePrice(
      ChangePriceEvent event,
      Emitter<PaymentState> emit,
      ) async {

    List<Item> items = [];
    List<Item> oldItems = state.payment?.items ?? [];
    for(int i = 0; i < oldItems.length; i++){
      if(event.index == i){
        items.add(oldItems[i].copyWith(itemAmount: event.price));
      }
      else {
        items.add(oldItems[i]);
      }
    }

    emit(state.copyWith(
        payment: state.payment!.copyWith(
            items: items
        ),
        paymentStateStatus: PaymentStateStatus.priceChanging
    ));

  }

  Future<void> _onRemoveItem(
      RemoveItemEvent event,
      Emitter<PaymentState> emit,
      ) async {

    List<Item> items = [];
    items.addAll(state.payment?.items ?? []);
    items.removeAt(event.index);

    emit(state.copyWith(
        payment: state.payment!.copyWith(
            items: items
        ),
        paymentStateStatus: PaymentStateStatus.updatedItem
    ));

  }

  Future<void> _onPay(
      PayEvent event,
      Emitter<PaymentState> emit,
      ) async {

    emit(state.copyWith(paymentStateStatus: PaymentStateStatus.paying));

    try {
      await _paymentRepository.updateItemPayment(state.payment!);

      emit(state.copyWith(paymentStateStatus: PaymentStateStatus.paid));
    } catch (e) {
      emit(state.copyWith(paymentStateStatus: PaymentStateStatus.payFailed));
    }

  }

}