import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/event/employees_event.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';

import '../state/employee_state.dart';
import 'dart:developer' as devtool;

class EmployeeBloc extends Bloc<EmployeesEvent, EmployeesState> {
  EmployeeBloc() : super(const EmployeesState()) {
    on<FetchEmployees>(_fetchEmployees);
  }
  final employeeRepository = ServiceLocator.locator.get<EmployeesRepository>();
  Future<void> _fetchEmployees(
    FetchEmployees event,
    Emitter<EmployeesState> emit,
  ) async {
    try {
      emit(EmployeesState.loading());
      devtool.log("fetch");
      final employees = await employeeRepository.fetchEmployees();
      devtool.log("emplyees");
      emit(EmployeesState.loaded(employees));
    } catch (e) {
      emit(EmployeesState.error(e.toString()));
    }
  }
}
