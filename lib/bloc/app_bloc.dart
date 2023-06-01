import 'package:bloc/bloc.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/event/app_event.dart';
import 'package:wavy/repository/user_repository.dart';
import 'package:wavy/state/app_state.dart';
import 'package:wavy/state/logout_state.dart';
import 'package:wavy/utils/form_submission_status.dart';

import '../event/login_event.dart';
import '../event/logout_event.dart';
import 'logout_bloc.dart';
import 'dart:developer' as devtool;

class AppBloc extends Bloc<AppEvent, AppState> {
  final LogoutBloc _logoutBloc;
  final LoginBloc _loginBloc;
  AppBloc(LogoutBloc logoutBloc, LoginBloc loginBloc)
      : _logoutBloc = logoutBloc,
        _loginBloc = loginBloc,
        super(AppState.unknow()) {
    on<AppLogined>(_login);
    on<AppLogoutRequested>(_logout);
    _logoutBloc.stream.listen((state) {
      if (state is LogoutStateSuccess) {
        _loginBloc.add(LoginIniTial());
        add(const AppLogoutRequested());
      }
    });
    _loginBloc.stream.listen((state) {
      if (state.formStatus == FormSubmissionStatus.submissionsuccess) {
        add(const AppLogined());
      }
    });
  }

  void _logout(AppLogoutRequested event, Emitter<AppState> emit) {
    emit(AppState.unauthenticated());
  }

  void _login(AppLogined event, Emitter<AppState> emit) {
    emit(AppState.authenticated());
  }
}
