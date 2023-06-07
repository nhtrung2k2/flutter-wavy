import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginRestart extends LoginEvent {
  LoginRestart();

  @override
  List<Object?> get props => [];
}

class LoginIniTial extends LoginEvent {
  LoginIniTial();
  @override
  List<Object?> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;
  final String language;
  LoginButtonPressed(
      {required this.email, required this.password, required this.language});
  @override
  List<Object?> get props => [email, password, language];
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  LoginEmailChanged({required this.email});
  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({required this.password});
  @override
  List<Object?> get props => [password];
}

class LanguageChanged extends LoginEvent {
  final String language;

  LanguageChanged({required this.language});
  @override
  List<Object?> get props => [language];
}

class Validate extends LoginEvent {
  final String email;
  final String password;
  Validate({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
