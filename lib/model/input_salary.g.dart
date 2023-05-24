// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_salary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InputSalary _$$_InputSalaryFromJson(Map<String, dynamic> json) =>
    _$_InputSalary(
      hourlyWage: json['hourly_wage'] as int,
      monthlyWage: json['monthly_wage'] as int,
      itemSalary: (json['item'] as List<dynamic>)
          .map((e) => ItemSalary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InputSalaryToJson(_$_InputSalary instance) =>
    <String, dynamic>{
      'hourly_wage': instance.hourlyWage,
      'monthly_wage': instance.monthlyWage,
      'item': instance.itemSalary,
    };
