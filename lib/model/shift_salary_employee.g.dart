// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_salary_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShiftSalaryEmployee _$$_ShiftSalaryEmployeeFromJson(
        Map<String, dynamic> json) =>
    _$_ShiftSalaryEmployee(
      userId: json['user_id'] as String,
      babysistterId: json['babysistter_id'] as String,
      inputShift: (json['input_shift'] as List<dynamic>)
          .map((e) => InputShift.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputSalary:
          InputSalary.fromJson(json['input_salary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ShiftSalaryEmployeeToJson(
        _$_ShiftSalaryEmployee instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'babysistter_id': instance.babysistterId,
      'input_shift': instance.inputShift,
      'input_salary': instance.inputSalary,
    };
