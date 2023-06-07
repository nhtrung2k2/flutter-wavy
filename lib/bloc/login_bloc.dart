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
import '../utils/form_submission_status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  // final AppBloc _appBloc;
  LoginBloc(this._userRepository)
      // : _appBloc = appBloc,
      : super(LoginState.initial()) {
    on<LoginIniTial>(_loginInitial);
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LanguageChanged>(_onLanguageChanged);
    on<Validate>(_validate);
    on<LoginButtonPressed>(_onSubmitted);
    on<LoginRestart>(_loginRestart);
  }

  void _loginInitial(
    LoginIniTial event,
    Emitter<LoginState> emit,
  ) {
    emit(LoginState.initial());
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      invalidError: null,
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
        invalidError: null,
        password: password,
      ),
    );
  }

  void _onLanguageChanged(
    LanguageChanged event,
    Emitter<LoginState> emit,
  ) {
    final language = event.language;
    _userRepository.setLanguage(language);
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
    final invalidError = statusValidate(email, password);
    emit(state.copyWith(
        invalidError: invalidError,
        status: Formz.validate([email, password])
            ? LoginStatus.valid
            : LoginStatus.invalid));
  }

  InvalidError? statusValidate(Email email, Password password) {
    if (Formz.validate([email, password])) {
      return null;
    } else {
      if (email.isNotValid && password.isNotValid) {
        return InvalidError.invalidEmailAndPassword;
      } else if (password.isNotValid) {
        return InvalidError.invalidPassword;
      } else if (email.isNotValid) {
        return InvalidError.invalidEmail;
      }
    }
  }

  void _loginRestart(
    LoginRestart event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
        invalidError: null, formStatus: FormSubmissionStatus.initial));
  }

  Future<void> _onSubmitted(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status == LoginStatus.valid) {
      emit(state.copyWith(formStatus: FormSubmissionStatus.formsubmitting));

      try {
        devtool.log(event.language);
        User? user = await _userRepository.login(
            state.email.value, state.password.value, state.language);
        if (user == null) {
          throw Exception("Some thing went wrong with user infor");
        }
        emit(state.copyWith(
            user: user, formStatus: FormSubmissionStatus.submissionsuccess));
      } catch (e) {
        emit(state.copyWith(
            formStatus: FormSubmissionStatus.submissionfailed,
            errorMessage: e.toString()));
      }
    }
  }
}
