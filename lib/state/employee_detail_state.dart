import 'package:equatable/equatable.dart';

import '../model/employee_detail.dart';

abstract class EmployeeDetailState extends Equatable {
  const EmployeeDetailState();
}

class InitialEmployeeDetailState extends EmployeeDetailState {
  const InitialEmployeeDetailState();

  @override
  List<Object?> get props => [];
}

class SubmittedEmployeeDetailLoadingState extends EmployeeDetailState {
  const SubmittedEmployeeDetailLoadingState();

  @override
  List<Object?> get props => [];
}

class SubmittedEmployeeDetailSuccessState extends EmployeeDetailState {
  final Employee_Detail employeeDetail;
  const SubmittedEmployeeDetailSuccessState({required this.employeeDetail});

  @override
  List<Object?> get props => [employeeDetail];
}

class SubmittedEmployeeDetailErrorState extends EmployeeDetailState {
  final String? errorMessage;
  const SubmittedEmployeeDetailErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
