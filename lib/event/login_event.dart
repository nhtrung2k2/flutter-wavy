abstract class LoginEvent {}

class LoginRestart extends LoginEvent {
  LoginRestart();
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;
  final String language;
  LoginButtonPressed(
      {required this.email, required this.password, required this.language});
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  LoginEmailChanged({required this.email});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LanguageChanged extends LoginEvent {
  final String language;

  LanguageChanged({required this.language});
}

class Validate extends LoginEvent {
  final String email;
  final String password;
  Validate({required this.email, required this.password});
}
