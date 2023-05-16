import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/bloc/employee_bloc.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/repository/user_repository.dart';
import 'package:wavy/service/auth_api.dart';
import 'package:wavy/service/employeesApi.dart';

import '../../bloc/employee_search_bloc.dart';

class ServiceLocator {
  static final locator = GetIt.instance;
  static void registerAll() {
    locator.registerSingleton<Dio>(Dio());
    locator.registerSingleton<AuthApi>(AuthApi());
    locator.registerSingleton<UserRepository>(UserRepository());
    locator.registerSingleton<LoginBloc>(LoginBloc());
    locator.registerSingleton<EmployeesApi>(EmployeesApi());
    locator.registerSingleton<EmployeesRepository>(EmployeesRepository());
    locator.registerSingleton<EmployeeBloc>(EmployeeBloc());
    locator.registerLazySingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
    locator.registerSingleton<EmployeeSearchBloc>(EmployeeSearchBloc());
  }
}
