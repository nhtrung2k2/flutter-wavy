import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wavy/model/input_salary.dart';

import 'input_shift.dart';

part 'shift_salary_employee.freezed.dart';
part 'shift_salary_employee.g.dart';

@freezed
abstract class ShiftSalaryEmployee with _$ShiftSalaryEmployee {
  const factory ShiftSalaryEmployee({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'babysistter_id') required String babysistterId,
    @JsonKey(name: 'input_shift') required List<InputShift> inputShift,
    @JsonKey(name: 'input_salary') required InputSalary inputSalary,
  }) = _ShiftSalaryEmployee;

  factory ShiftSalaryEmployee.fromJson(Map<String, dynamic> json) =>
      _$_ShiftSalaryEmployee.fromJson(json);
}
