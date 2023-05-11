import 'package:wavy/model/employee.dart';

class EmployeesState {
  const EmployeesState(
      {this.isLoading = false, this.employees = const [], this.errorMessage});
  final bool isLoading;
  final List<Employee> employees;
  final String? errorMessage;
  factory EmployeesState.loading() => const EmployeesState(isLoading: true);
  factory EmployeesState.loaded(List<Employee> employees) =>
      EmployeesState(employees: employees);
  factory EmployeesState.error(String errorMessage) =>
      EmployeesState(errorMessage: errorMessage);
}
