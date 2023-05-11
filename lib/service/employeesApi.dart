import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/service/base_api.dart';
import 'package:wavy/service/getit/service_locator.dart';

import 'dart:convert';

import 'package:wavy/view/pages/home.dart';
import 'dart:developer' as devtool;

class EmployeesApi {
  final String baseUrl;
  final BaseAPI baseAPI;
  EmployeesApi()
      : baseUrl = "https://wavy-api.starboardasiavn.com",
        baseAPI = BaseAPI();
  Future<List<Employee>?> fetchEmloyees() async {
    final loginUrl = '$baseUrl/api/home';
    try {
      devtool.log('api');
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString('token');
      final response = await baseAPI.get(loginUrl, token);
      devtool.log(response.toString());
      if (response.statusCode == 200) {
        final data = response.data;
        final jsonList = json.decode(data);
        final employees =
            jsonList.map((json) => Employee.fromJson(json)).toList();
        return employees;
      } else if (response.statusCode == 404) {
        throw Exception("Can't get list employees");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
