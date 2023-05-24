import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wavy/model/item_salary.dart';

part 'input_salary.freezed.dart';
part 'input_salary.g.dart';

@freezed
abstract class InputSalary with _$InputSalary {
  const factory InputSalary(
          {@JsonKey(name: 'hourly_wage') required int hourlyWage,
          @JsonKey(name: 'monthly_wage') required int monthlyWage,
          @JsonKey(name: 'item') required List<ItemSalary> itemSalary}) =
      _InputSalary;

  factory InputSalary.fromJson(Map<String, dynamic> json) =>
      _$InputSalaryFromJson(json);
}

ItemSalary? inputSalaryFromJson(dynamic json) {
  return ItemSalary.fromJson(json);
}

dynamic inputSalaryToJson(ItemSalary? itemSalary) {
  return itemSalary?.toJson();
}
