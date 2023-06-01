import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/bloc/cancel_membership.dart';
import 'package:wavy/event/search_event.dart';
import 'package:wavy/repository/user_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/cancel_membership_state.dart';
import 'package:wavy/state/logout_state.dart';

import '../event/logout_event.dart';
import '../repository/employees_repository.dart';
import '../state/employee_search_state.dart';
import 'dart:developer' as devtool;

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final UserRepository userRepo;
  final CancelMemberShipBloc _cancelMemberShipBloc =
      ServiceLocator.locator.get<CancelMemberShipBloc>();
  LogoutBloc(this.userRepo) : super(const LogoutInit()) {
    on<LogoutInitEvent>(_onLogoutInit);
    on<LogoutPressed>(_onSubmitted);
    _cancelMemberShipBloc.stream.listen((event) {
      if (state is CancelMembershipStateSuccess) {
        add(LogoutPressed());
      }
    });
  }
  void _onLogoutInit(LogoutInitEvent event, Emitter<LogoutState> emit) {
    emit(const LogoutInit());
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
