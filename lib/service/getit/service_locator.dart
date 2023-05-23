import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/bloc/confirm_the_schedule_bloc.dart';
import 'package:wavy/bloc/employee_bloc.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/repository/user_repository.dart';
import 'package:wavy/service/auth_api.dart';
import 'package:wavy/service/employeesApi.dart';

import '../../bloc/employee_search_bloc.dart';
import '../../bloc/salary_bloc.dart';
import '../../bloc/schedule_cubic.dart';

class ServiceLocator {
  static final locator = GetIt.instance;
  static void registerAll() {
    locator.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
    locator.registerSingleton<Dio>(Dio());
    locator.registerSingleton<AuthApi>(AuthApi());
    locator.registerSingletonWithDependencies<UserRepository>(
        () => UserRepository(),
        dependsOn: [SharedPreferences]);
    locator.registerSingletonWithDependencies<LoginBloc>(
        () => LoginBloc(locator.get<UserRepository>()),
        dependsOn: [UserRepository]);
    locator.registerSingleton<EmployeesApi>(EmployeesApi());

    locator.registerSingletonWithDependencies<EmployeesRepository>(
        () => EmployeesRepository(locator.get<SharedPreferences>()),
        dependsOn: [SharedPreferences]);

    locator.registerSingletonWithDependencies<EmployeeBloc>(
        () => EmployeeBloc(locator.get<EmployeesRepository>()),
        dependsOn: [EmployeesRepository]);

    locator.registerSingletonWithDependencies<EmployeeSearchBloc>(
        () => EmployeeSearchBloc(locator.get<EmployeesRepository>()),
        dependsOn: [EmployeesRepository]);
    locator.registerSingletonWithDependencies<ScheduleCubic>(
        () => ScheduleCubic(locator.get<EmployeesRepository>()),
        dependsOn: [EmployeesRepository]);
    locator.registerSingletonWithDependencies<SalaryBloc>(
        () => SalaryBloc(locator.get<EmployeesRepository>()),
        dependsOn: [EmployeesRepository]);
    locator.registerSingleton<ConfirmTheScheduleBloc>(ConfirmTheScheduleBloc());
    locator.registerLazySingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
  }
}
