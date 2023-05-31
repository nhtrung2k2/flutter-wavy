import 'package:equatable/equatable.dart';

abstract class CancelMembershipState extends Equatable {
  const CancelMembershipState();
  @override
  List<Object?> get props => [];
}

class CancelMembershipInit extends CancelMembershipState {
  const CancelMembershipInit();
}

class CancelMembershipStateLoading extends CancelMembershipState {
  const CancelMembershipStateLoading();
}

class CancelMembershipStateFail extends CancelMembershipState {
  const CancelMembershipStateFail(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}

class CancelMembershipStateSuccess extends CancelMembershipState {
  const CancelMembershipStateSuccess();
}
