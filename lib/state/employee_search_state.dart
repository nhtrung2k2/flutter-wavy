import 'package:equatable/equatable.dart';
import 'package:wavy/model/employee_detail.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class InitialState extends SearchState {
  const InitialState();

  @override
  List<Object?> get props => [];
}

class ChangedState extends SearchState {
  final String value;
  const ChangedState({required this.value});

  @override
  List<Object?> get props => [value];
}

class ChangedLoading extends SearchState {
  final bool isLoading;
  const ChangedLoading({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class SubmittedSuccess extends SearchState {
  final Employee_Detail employeeDetail;
  const SubmittedSuccess({required this.employeeDetail});

  @override
  List<Object?> get props => [employeeDetail];
}

class SubmittedError extends SearchState {
  final String? errorMessage;
  const SubmittedError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
