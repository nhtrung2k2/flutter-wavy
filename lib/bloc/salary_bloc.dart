import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:wavy/bloc/employee_change_setting.dart';
import 'package:wavy/event/salary_event.dart';
import 'package:wavy/model/item_salary.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/utils/form_submission_status.dart';

import '../state/salary_state.dart';
import 'dart:developer' as devtool;

class SalaryBloc extends Bloc<SalaryEvent, SalaryInputState> {
  //   final EmployeeChangeSettingBloc changeSettingBloc;
  // StreamSubscription todosSubscription;
  final EmployeesRepository _employeesRepository;
  SalaryBloc(this._employeesRepository) : super(SalaryInputState.initial()) {
    on<InitialFetch>(_fetchInputSalary);
    on<OnChangedWage>(_onChangeWage);
    on<AddItem>(_addItem);
    on<OnChangedOption>(_onChangedOption);
    on<OnSubmmited>(_onSubmmited);
    on<OnChangedValueItem>(_onChangeValueItem);
    on<ResetSucess>(_onResetSuccess);
    on<OnDeleteItem>(_onDelete);
  }
  // Future<void> _fetchInputSalary(
  //     InitialFetch event, Emitter<SalaryInputState> emit) async {
  //   final inputSalary = await _employeesRepository.getInputSalary();
  //   if (inputSalary != null) {
  //     emit(state.copywith(inputSalary: inputSalary));
  //   }
  // }
  Future<void> _fetchInputSalary(
      InitialFetch event, Emitter<SalaryInputState> emit) async {
    emit(state.copywith(
      inputSalary: event.inputSalary,
    ));
  }

  Future<void> _onDelete(
    OnDeleteItem event,
    Emitter<SalaryInputState> emit,
  ) async {
    final List<ItemSalary> newList = List.from(state.inputSalary.itemSalary);
    newList.removeWhere((element) => element.id == event.id);
    final inputSalary = state.inputSalary.copyWith(itemSalary: newList);
    emit(state.copywith(inputSalary: inputSalary));
  }

  Future<void> _onChangeValueItem(
    OnChangedValueItem event,
    Emitter<SalaryInputState> emit,
  ) async {
    final List<ItemSalary> listItemSalary = state.inputSalary.itemSalary;
    int index = listItemSalary.indexWhere((element) => element.id == event.id);
    ItemSalary updatedItemSalary =
        listItemSalary[index].copyWith(price: event.value);
    final List<ItemSalary> updatedList = List.from(listItemSalary);
    updatedList[index] = updatedItemSalary;
    final inputSlary = state.inputSalary.copyWith(itemSalary: updatedList);
    emit(state.copywith(inputSalary: inputSlary));
  }

  Future<void> _onChangeWage(
    OnChangedWage event,
    Emitter<SalaryInputState> emit,
  ) async {
    final inputSalary = state.inputSalary.copyWith(
        hourlyWage:
            addMoneyBasedOnType(event.value, Wage.hourlyWage, event.type),
        monthlyWage:
            addMoneyBasedOnType(event.value, Wage.monthlyWage, event.type));
    emit(state.copywith(inputSalary: inputSalary));
  }

  Future<void> _onResetSuccess(
    ResetSucess event,
    Emitter<SalaryInputState> emit,
  ) async {
    emit(state.copywith(formStatus: FormSubmissionStatus.initial));
  }

  Future<void> _addItem(
    AddItem event,
    Emitter<SalaryInputState> emit,
  ) async {
    final List<ItemSalary> newList = List.from(state.inputSalary.itemSalary);
    newList.add(event.item);
    final inputSalary = state.inputSalary.copyWith(itemSalary: newList);
    emit(state.copywith(inputSalary: inputSalary));
  }

  Future<void> _onChangedOption(
    OnChangedOption event,
    Emitter<SalaryInputState> emit,
  ) async {
    final List<ItemSalary> listItemSalary = state.inputSalary.itemSalary;
    int index = listItemSalary.indexWhere((element) => element.id == event.id);
    ItemSalary updatedItemSalary =
        listItemSalary[index].copyWith(option: event.option);
    final List<ItemSalary> updatedList = List.from(listItemSalary);
    updatedList[index] = updatedItemSalary;
    final inputSlary = state.inputSalary.copyWith(itemSalary: updatedList);
    emit(state.copywith(inputSalary: inputSlary));
  }

  Future<void> _onSubmmited(
    OnSubmmited event,
    Emitter<SalaryInputState> emit,
  ) async {
    try {
      emit(state.copywith(formStatus: FormSubmissionStatus.formsubmitting));
      // await _employeesRepository.saveInputSalaryToCache(state.inputSalary);
      // devtool.log(state.toString());
      // devtool.log(state.inputSalary.toString());
      // devtool.log(state.inputSalary.itemSalary.toString());
      // devtool.log(state.inputSalary.hourlyWage.toString());
      // devtool.log(state.inputSalary.monthlyWage.toString());
      emit(state.copywith(formStatus: FormSubmissionStatus.submissionsuccess));
    } catch (e) {
      emit(state.copywith(
          formStatus: FormSubmissionStatus.submissionfailed,
          errorMessage: e.toString()));
    }
  }
}

int addMoneyBasedOnType(int money, Wage typestate, Wage real) {
  if (typestate == real) {
    return money;
  } else {
    return 0;
  }
}
