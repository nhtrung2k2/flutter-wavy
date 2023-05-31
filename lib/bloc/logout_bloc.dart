import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/event/search_event.dart';
import 'package:wavy/repository/user_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/logout_state.dart';

import '../event/logout_event.dart';
import '../repository/employees_repository.dart';
import '../state/employee_search_state.dart';
import 'dart:developer' as devtool;

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final UserRepository userRepo;
  LogoutBloc(this.userRepo) : super(const LogoutInit()) {
    on<LogoutPressed>(_onSubmitted);
  }

  Future<void> _onSubmitted(
      LogoutPressed event, Emitter<LogoutState> emit) async {
    emit(const LogoutStateLoading());
    try {
      devtool.log("logout bloc1");
      await userRepo.logout();
      devtool.log("logout bloc");
      emit(const LogoutStateSuccess());
    } catch (e) {
      emit(LogoutStateFail(e.toString()));
    }
  }
}
