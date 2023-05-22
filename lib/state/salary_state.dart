import 'package:wavy/model/input_salary.dart';

import '../utils/form_submission_status.dart';

class SalaryInputState {
  final InputSalary inputSalary;
  final FormSubmissionStatus formStatus;
  final String? errorMessage;
  const SalaryInputState(
      {required this.inputSalary, required this.formStatus, this.errorMessage});
  factory SalaryInputState.initial() => const SalaryInputState(
      inputSalary:
          InputSalary(hourlyWage: 50000, monthlyWage: 0, itemSalary: []),
      formStatus: FormSubmissionStatus.initial);
  SalaryInputState copywith({
    InputSalary? inputSalary,
    FormSubmissionStatus? formStatus,
    String? errorMessage,
  }) {
    return SalaryInputState(
      inputSalary: inputSalary ?? this.inputSalary,
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
