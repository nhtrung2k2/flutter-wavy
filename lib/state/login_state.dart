import 'package:equatable/equatable.dart';
import 'package:wavy/state/email.dart';
import 'package:wavy/state/password.dart';

import '../utils/form_submission_status.dart';

enum LoginStatus { pure, valid, invalid }

class LoginState extends Equatable {
  final Email email;
  final Password password;
  final String language;
  final LoginStatus status;
  final String? errorMessage;
  final FormSubmissionStatus formStatus;
  const LoginState({
    required this.email,
    required this.password,
    required this.language,
    required this.status,
    required this.formStatus,
    this.errorMessage,
  });
  factory LoginState.initial() => const LoginState(
      email: Email.pure(),
      password: Password.pure(),
      language: 'en',
      status: LoginStatus.pure,
      errorMessage: null,
      formStatus: FormSubmissionStatus.initial);
  @override
  List<Object?> get props =>
      [email, password, language, status, errorMessage, formStatus];
  LoginState copyWith(
      {Email? email,
      Password? password,
      String? language,
      LoginStatus? status,
      String? errorMessage,
      FormSubmissionStatus? formStatus}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      language: language ?? this.language,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
