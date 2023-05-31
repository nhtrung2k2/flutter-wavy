abstract class TerminationContractEvent {}

class LoadingTerminationContractEvent extends TerminationContractEvent {
  final String babysistterId;
  final int shiftId;
  LoadingTerminationContractEvent({required this.babysistterId, required this.shiftId});
}

class ConfirmTerminationContractEvent extends TerminationContractEvent {
  final int shiftId;
  ConfirmTerminationContractEvent({required this.shiftId});
}