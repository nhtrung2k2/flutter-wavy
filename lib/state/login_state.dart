import 'package:equatable/equatable.dart';
import 'package:wavy/state/email.dart';
import 'package:wavy/state/password.dart';

import '../model/user_model.dart';
import '../utils/form_submission_status.dart';

enum LoginStatus { pure, valid, invalid }

enum InvalidError { invalidPassword, invalidEmail, invalidEmailAndPassword }

class LoginState extends Equatable {
  final Email email;
  final Password password;
  final String language;
  final LoginStatus status;
  final String? errorMessage;
  final FormSubmissionStatus formStatus;
  final InvalidError? invalidError;
  final UserModel? user;
  final bool isSavePassword;
  const LoginState(
      {required this.email,
      required this.password,
      required this.language,
      required this.status,
      required this.formStatus,
      required this.user,
      required this.invalidError,
      this.errorMessage,
      required this.isSavePassword});
  factory LoginState.initial() => const LoginState(
        email: Email.pure(),
        password: Password.pure(),
        language: 'en',
        status: LoginStatus.pure,
        invalidError: null,
        errorMessage: null,
        user: null,
        formStatus: FormSubmissionStatus.initial,
        isSavePassword: false,
      );
  @override
  List<Object?> get props => [
        email,
        password,
        language,
        status,
        errorMessage,
        formStatus,
        user,
        invalidError,
        isSavePassword,
      ];
  LoginState copyWith({
    Email? email,
    Password? password,
    String? language,
    LoginStatus? status,
    String? errorMessage,
    FormSubmissionStatus? formStatus,
    UserModel? user,
    InvalidError? invalidError,
    bool? isSavePassword,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        language: language ?? this.language,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        formStatus: formStatus ?? this.formStatus,
        user: user ?? this.user,
        invalidError: invalidError,
        isSavePassword: isSavePassword ?? this.isSavePassword);
  }
}
