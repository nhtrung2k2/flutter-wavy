import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/event/employees_event.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';

import '../repository/user_repository.dart';
import '../state/employee_state.dart';
import 'dart:developer' as devtool;

class EmployeeBloc extends Bloc<EmployeesEvent, EmployeesState> {
  EmployeeBloc(this.employeeRepository) : super(const EmployeesState()) {
    on<FetchEmployees>(_fetchEmployees);
  }
  final EmployeesRepository employeeRepository;

  Future<void> _fetchEmployees(
    FetchEmployees event,
    Emitter<EmployeesState> emit,
  ) async {
    try {
      emit(EmployeesState.loading());

      final employees = await employeeRepository.fetchEmployees();

      emit(EmployeesState.loaded(employees));
    } catch (e) {
      emit(EmployeesState.error(e.toString()));
    }
  }
}
