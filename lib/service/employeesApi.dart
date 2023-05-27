import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/service/base_api.dart';
import 'package:wavy/service/getit/service_locator.dart';

import 'dart:convert';

import 'dart:developer' as devtool;

import '../model/shift_salary_employee.dart';

class EmployeesApi {
  final String baseUrl;
  final BaseAPI baseAPI;
  EmployeesApi()
      : baseUrl = "https://wavy-api.starboardasiavn.com",
        baseAPI = BaseAPI();
  Future<List<Employee>?> fetchEmloyees() async {
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString('token');
      final language = prefs.getString('language');
      final userId = prefs.getString('userId');

      final url = '$baseUrl/api/home/$userId';
      final response = await baseAPI.get(url,
          {'Authorization': 'Bearer $token', 'X-Localization': '$language'});

      if (response.statusCode == 200) {
        try {
          List<dynamic> data = response.data;
          List<Map<String, dynamic>> convertedList =
              data.map((e) => e as Map<String, dynamic>).toList();
          final List<Employee> employees =
              convertedList.map((json) => Employee.fromJson(json)).toList();
          return employees;
        } catch (e) {
          // devtool.log(e.toString());
          throw Exception(e.toString());
        }
      } else if (response.statusCode == 404) {
        throw Exception("Can't get list employees");
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Employee_Detail?> fetchEmployeDetail(
      String babySisterId, int? shiftId) async {
    final url = '$baseUrl/api/babysistter_detail';
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString('token');
      final language = prefs.getString('language');
      final response = await baseAPI.post(
          url,
          {'babysistter_id': babySisterId, 'shift_id': shiftId},
          {'Authorization': 'Bearer $token', 'X-Localization': language});
      // devtool.log(response.headers.toString());
      if (response.statusCode == 200) {
        final data = response.data;
        final employeeDetail = Employee_Detail.fromJson(data);
        return employeeDetail;
      } else if (response.statusCode == 400) {
        throw Exception("Token could not be parsed from the request.");
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> saveChangeSetting(
      ShiftSalaryEmployee shiftSalaryEmployee) async {
    final url = '$baseUrl/api/change_setting';
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString('token');
      final language = prefs.getString('language');
      devtool.log(shiftSalaryEmployee.toJson().toString());
      final response = await baseAPI.post(url, shiftSalaryEmployee.toJson(),
          {'Authorization': 'Bearer $token', 'X-Localization': language});
      // devtool.log(response.headers.toString());
      if (response.statusCode == 200) {
        // devtool.log("api success");
        return;
      } else if (response.statusCode == 400) {
        // devtool.log("api 400");
        throw Exception("Token could not be parsed from the request.");
      }
    } catch (e) {
      // devtool.log(e.toString());
      throw e.toString();
    }
  }

  Future<ShiftSalaryEmployee> getChangeSetting(int shiftId) async {
    final url = '$baseUrl/api/basic_setting/$shiftId';
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString('token');
      final language = prefs.getString('language');

      final response = await baseAPI.get(
          url, {'Authorization': 'Bearer $token', 'X-Localization': language});

      if (response.statusCode == 200) {
        final data = response.data;
        final shiftSalaryEmployee = ShiftSalaryEmployee.fromJson(data);
        return shiftSalaryEmployee;
      } else {
        throw Exception("Some thing went wrong with get change setting");
      }
    } catch (e) {
      // devtool.log(e.toString());
      throw e.toString();
    }
  }
}
