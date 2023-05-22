import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_shift.freezed.dart';
part 'input_shift.g.dart';

@freezed
abstract class InputShift with _$InputShift {
  const factory InputShift(
          {@JsonKey(name: 'from') required String from,
          @JsonKey(name: 'to') required String to,
          @JsonKey(name: 'not_available') required bool notAvailable}) =
      _InputShift;

  factory InputShift.fromJson(Map<String, dynamic> json) =>
      _$InputShiftFromJson(json);
}
