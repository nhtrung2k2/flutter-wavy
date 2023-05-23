
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wavy/model/item.dart';

part 'cost.freezed.dart';
part 'cost.g.dart';

@freezed
abstract class Cost with _$Cost {
  const factory Cost({
    @JsonKey(name: 'amount_date')
    required String amountDate,
    @JsonKey(name: 'labour_cost')
    required int labourCost,
    @JsonKey(name: 'working_time')
    required String workingTime,
    @JsonKey(name: 'hour_woking')
    required int hourWorking,
    @JsonKey(name: 'hourly_wage')
    required int hourlyWave,
    @JsonKey(name: 'amount')
    required int amount,
    @JsonKey(name: 'confirm_flag')
    required int confirmFlag,
    @JsonKey(name: 'payment_status')
    required int paymentStatus,
    @JsonKey(name: 'picture_1')
    required String? picture1,
    @JsonKey(name: 'picture_2')
    required String? picture2,
    @JsonKey(name: 'picture_3')
    required String? picture3,
    @JsonKey(name: 'items')
    required List<Item> items,
  }) = _Cost;

  factory Cost.fromJson(Map<String, dynamic> json) => _$CostFromJson(json);
}