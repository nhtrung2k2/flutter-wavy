import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/service/employeesApi.dart';
import 'package:wavy/service/getit/service_locator.dart';

class EmployeesRepository {
  EmployeesRepository()
      : _employeeApi = ServiceLocator.locator.get<EmployeesApi>();
  final EmployeesApi _employeeApi;
  Future<List<Employee>> fetchEmployees() async {
    try {
      final employees = await _employeeApi.fetchEmloyees();
      if (employees == null) {
        return [];
      }
      return employees;
    } catch (e) {
      throw e.toString();
    }
  }
}
