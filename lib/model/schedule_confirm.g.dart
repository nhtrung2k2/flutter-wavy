// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_confirm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleConfirm _$$_ScheduleConfirmFromJson(Map<String, dynamic> json) =>
    _$_ScheduleConfirm(
      amountId: json['amount_id'] as int,
      amountDate: json['amount_date'] as String,
      workingTime: json['working_time'] as String,
      amount: json['amount'] as int,
      confirmFlag: json['confirm_flag'] as int,
      paymentStatus: json['payment_status'] as int,
    );

Map<String, dynamic> _$$_ScheduleConfirmToJson(_$_ScheduleConfirm instance) =>
    <String, dynamic>{
      'amount_id': instance.amountId,
      'amount_date': instance.amountDate,
      'working_time': instance.workingTime,
      'amount': instance.amount,
      'confirm_flag': instance.confirmFlag,
      'payment_status': instance.paymentStatus,
    };
