import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:wavy/bloc/app_bloc.dart';
import 'package:wavy/event/login_event.dart';
import 'package:wavy/model/User.dart';
import 'dart:developer' as devtool;
import 'package:wavy/repository/user_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/login_state.dart';

import '../state/email.dart';
import '../state/password.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository =
      ServiceLocator.locator.get<UserRepository>();
  // final AppBloc _appBloc;
  LoginBloc()
      // : _appBloc = appBloc,
      : super(LoginState.initial()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LanguageChanged>(_onLanguageChanged);
    on<Validate>(_validate);
    on<LoginButtonPressed>(_onSubmitted);
    on<LoginRestart>(_loginRestart);
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
      ),
    );
  }

  void _onLanguageChanged(
    LanguageChanged event,
    Emitter<LoginState> emit,
  ) {
    final language = event.language;
    emit(
      state.copyWith(language: language),
    );
  }

  void _validate(
    Validate event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    final password = Password.dirty(event.password);
    emit(state.copyWith(
        status: Formz.validate([email, password])
            ? LoginStatus.valid
            : LoginStatus.invalid));
  }

  void _loginRestart(
    LoginRestart event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(formStatus: FormSubmissionStatus.initial));
  }

  Future<void> _onSubmitted(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status == LoginStatus.valid) {
      emit(state.copyWith(formStatus: FormSubmissionStatus.formsubmitting));

      try {
        await _userRepository.login(
            state.email.value, state.password.value, state.language);

        emit(
            state.copyWith(formStatus: FormSubmissionStatus.submissionsuccess));
      } catch (_) {
        emit(state.copyWith(formStatus: FormSubmissionStatus.submissionfailed));
      }
    }
  }
}
