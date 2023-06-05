import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/bloc/confirm_the_schedule_bloc.dart';
import 'package:wavy/bloc/cost_list_bloc.dart';
import 'package:wavy/bloc/employee_bloc.dart';
import 'package:wavy/bloc/employee_change_setting.dart';
import 'package:wavy/bloc/employee_detail.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/bloc/payment_bloc.dart';
import 'package:wavy/bloc/review_bloc.dart';
import 'package:wavy/bloc/termination_contract_bloc.dart';
import 'package:wavy/repository/confirm_the_schedule_repository.dart';
import 'package:wavy/repository/cost_list_repository.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/repository/payment_repository.dart';
import 'package:wavy/repository/review_repository.dart';
import 'package:wavy/repository/termination_contract_repository.dart';
import 'package:wavy/repository/user_repository.dart';
import 'package:wavy/service/auth_api.dart';
import 'package:wavy/service/confirm_schedule_api.dart';
import 'package:wavy/service/cost_list_api.dart';
import 'package:wavy/service/employeesApi.dart';
import 'package:wavy/service/payment_api.dart';
import 'package:wavy/service/review_api.dart';
import 'package:wavy/service/termination_contract_api.dart';
import 'package:wavy/service/user_api.dart';

import '../../bloc/app_bloc.dart';
import '../../bloc/cancel_membership.dart';
import '../../bloc/employee_search_bloc.dart';
import '../../bloc/logout_bloc.dart';
import '../../bloc/salary_bloc.dart';
import '../../bloc/schedule_cubic.dart';

class ServiceLocator {
  static final locator = GetIt.instance;
  static void registerAll() {
    locator.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());

    locator.registerSingleton<Dio>(Dio());
    locator.registerSingleton<AuthApi>(AuthApi());
    locator.registerSingleton<UserApi>(UserApi());

    locator.registerSingletonWithDependencies<UserRepository>(
        () => UserRepository(),
        dependsOn: [SharedPreferences]);
    locator.registerSingletonWithDependencies<LoginBloc>(
        () => LoginBloc(locator.get<UserRepository>()),
        dependsOn: [UserRepository]);
    locator.registerSingletonWithDependencies(
        () => CancelMemberShipBloc(locator.get<UserRepository>()),
        dependsOn: [UserRepository]);
    locator.registerSingletonWithDependencies<LogoutBloc>(
        () => LogoutBloc(
            locator.get<UserRepository>(), locator.get<CancelMemberShipBloc>()),
        dependsOn: [UserRepository, CancelMemberShipBloc]);
    locator.registerSingletonWithDependencies<AppBloc>(
        () => AppBloc(locator.get<LogoutBloc>(), locator.get<LoginBloc>()),
        dependsOn: [LoginBloc, LogoutBloc]);
    locator.registerSingleton<EmployeesApi>(EmployeesApi());
    locator.registerSingletonWithDependencies<EmployeesRepository>(
        () => EmployeesRepository(locator.get<SharedPreferences>()),
        dependsOn: [SharedPreferences]);
    locator.registerSingletonWithDependencies<EmployeeDetailBloc>(
        () => EmployeeDetailBloc(locator.get<EmployeesRepository>()),
        dependsOn: [EmployeesRepository]);
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
    locator.registerSingletonWithDependencies<EmployeeChangeSettingBloc>(
        () => EmployeeChangeSettingBloc(locator.get<EmployeesRepository>()),
        dependsOn: [EmployeesRepository]);

    locator.registerSingleton<ScheduleConfirmApi>(ScheduleConfirmApi());
    locator.registerSingleton<ConfirmTheScheduleRepository>(
        ConfirmTheScheduleRepository());
    locator.registerSingletonWithDependencies<ConfirmTheScheduleBloc>(
        () => ConfirmTheScheduleBloc(locator.get<EmployeesRepository>()),
        dependsOn: [EmployeesRepository]);

    locator.registerSingleton<CostListApi>(CostListApi());
    locator.registerSingleton<CostListRepository>(CostListRepository());
    locator.registerSingleton<CostListBloc>(CostListBloc());

    locator.registerSingleton<PaymentApi>(PaymentApi());
    locator.registerSingleton<PaymentRepository>(PaymentRepository());
    locator.registerSingletonWithDependencies<PaymentBloc>(
        () => PaymentBloc(locator.get<EmployeesRepository>()),
        dependsOn: [EmployeesRepository]);

    locator.registerSingleton<ReviewApi>(ReviewApi());
    locator.registerSingleton<ReviewRepository>(ReviewRepository());
    locator.registerSingletonWithDependencies<ReviewBloc>(
        () => ReviewBloc(locator.get<EmployeesRepository>()),
        dependsOn: [EmployeesRepository]);

    locator.registerSingleton<TerminationContractApi>(TerminationContractApi());
    locator.registerSingleton<TerminationContractRepository>(
        TerminationContractRepository());
    locator.registerSingletonWithDependencies<TerminationContractBloc>(
        () => TerminationContractBloc(locator.get<EmployeesRepository>()),
        dependsOn: [EmployeesRepository]);
  }
}
