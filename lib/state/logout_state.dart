import 'package:equatable/equatable.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();
  @override
  List<Object?> get props => [];
}

class LogoutInit extends LogoutState {
  const LogoutInit();
}

class LogoutStateLoading extends LogoutState {
  const LogoutStateLoading();
}

class LogoutStateFail extends LogoutState {
  const LogoutStateFail(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}

class LogoutStateSuccess extends LogoutState {
  const LogoutStateSuccess();
}
