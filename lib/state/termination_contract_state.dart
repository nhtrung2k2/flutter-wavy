import 'package:wavy/model/employee_detail.dart';

enum TerminationContractStatus {
  loading,
  confirming,
  loadFailed,
  terminating,
  terminated,
  terminateFailed
}

class TerminationContractState {
  final Employee_Detail? employee;
  final TerminationContractStatus terminationContractStatus;
  final Map<String, dynamic>? messages;
  const TerminationContractState({
    required this.employee,
    required this.terminationContractStatus,
    required this.messages
  });
  factory TerminationContractState.initial() => const TerminationContractState(
      employee: null,
      terminationContractStatus: TerminationContractStatus.loading,
      messages: {}
  );

  TerminationContractState copyWith({
    Employee_Detail? employee,
    TerminationContractStatus? terminationContractStatus,
    Map<String, dynamic>? messages,
  }) {
    return TerminationContractState(
        employee: employee ?? this.employee,
        terminationContractStatus: terminationContractStatus ?? this.terminationContractStatus,
        messages: messages ?? this.messages
    );
  }

}
