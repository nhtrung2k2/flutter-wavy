import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/model/input_salary.dart';
import 'package:wavy/model/schedule.dart';
import 'package:wavy/service/employeesApi.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'dart:developer' as devtool;

import 'package:wavy/service/iterable.dart';

class EmployeesRepository {
  EmployeesRepository(this._sharedPreferences)
      : _employeeApi = ServiceLocator.locator.get<EmployeesApi>();

  final EmployeesApi _employeeApi;
  final SharedPreferences _sharedPreferences;
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

  Future<Employee_Detail> fetchEmployDetail(String babySisterId) async {
    try {
      final employeeDetail =
          await _employeeApi.fetchEmployeDetail(babySisterId);
      devtool.log(employeeDetail.toString());
      if (employeeDetail == null) {
        throw Exception("Can't not find this employee");
      }
      return employeeDetail;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> saveScheduleToCache(List<Schedule> listSchedule) async {
    List<Map<String, dynamic>> jsonList =
        listSchedule.mapIndexed((e, index) => e.toJson()).toList();
    String json = jsonEncode(jsonList);
    await _sharedPreferences.setString("schedule_employee", json);
  }

  Future<List<Schedule>> getScheduleFromCache() async {
    final jsonString = _sharedPreferences.getString("schedule_employee");
    if (jsonString != null) {
      final jsonData = jsonDecode(jsonString);

      final Iterable<dynamic> jsonList = jsonData;
      final List<Schedule> employeeList = jsonList
          .mapIndexed((json, index) => Schedule.fromJson(index, json))
          .toList();
      return employeeList;
    }
    return [];
  }

  Future<InputSalary?> getInputSalary() async {
    final jsonString = _sharedPreferences.getString("input_salary");
    if (jsonString != null) {
      final jsonData = jsonDecode(jsonString);
      final inputSalary = InputSalary.fromJson(jsonData);
      return inputSalary;
    }
    return null;
  }

  Future<void> saveInputSalaryToCache(InputSalary inputSalary) async {
    final json = jsonEncode(inputSalary.toJson());
    await _sharedPreferences.setString("input_salary", json);
  }
}
