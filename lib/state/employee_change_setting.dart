import 'package:equatable/equatable.dart';

import '../model/shift_salary_employee.dart';

abstract class ChangeSettingState extends Equatable {
  const ChangeSettingState();
}

class InitialState extends ChangeSettingState {
  const InitialState();

  @override
  List<Object?> get props => [];
}

class FetchLoading extends ChangeSettingState {
  const FetchLoading();

  @override
  List<Object> get props => [];
}

class FetchSuccess extends ChangeSettingState {
  final ShiftSalaryEmployee shiftSalaryEmployee;
  const FetchSuccess({required this.shiftSalaryEmployee});

  @override
  List<Object?> get props => [shiftSalaryEmployee];
}

class FetchError extends ChangeSettingState {
  final String errorMessage;
  const FetchError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class SubmittingChangeSetting extends ChangeSettingState {
  const SubmittingChangeSetting();
  @override
  List<Object?> get props => [];
}

class SubmittedSuccessChangeSetting extends ChangeSettingState {
  final ShiftSalaryEmployee shiftSalaryEmployee;
  const SubmittedSuccessChangeSetting({required this.shiftSalaryEmployee});

  @override
  List<Object?> get props => [shiftSalaryEmployee];
}

class SubmittedErrorChangeSetting extends ChangeSettingState {
  final String errorMessage;
  const SubmittedErrorChangeSetting({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
