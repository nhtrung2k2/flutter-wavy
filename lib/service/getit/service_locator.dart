import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/repository/user_repository.dart';
import 'package:wavy/service/AuthApi.dart';

class ServiceLocator {
  static final locator = GetIt.instance;
  static void registerAll() {
    locator.registerSingleton<Dio>(Dio());
    locator.registerSingleton<AuthApi>(AuthApi());
    locator.registerSingleton<UserRepository>(UserRepository());
    locator.registerSingleton<LoginBloc>(LoginBloc());
  }
}
