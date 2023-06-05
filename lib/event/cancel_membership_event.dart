abstract class CancelMembershipEvent {}

class CancelMembershipPressed extends CancelMembershipEvent {
  CancelMembershipPressed();
}

class CancelMembershipConfirmEvent extends CancelMembershipEvent {
  CancelMembershipConfirmEvent();
}
