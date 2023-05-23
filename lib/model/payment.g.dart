// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payment _$$_PaymentFromJson(Map<String, dynamic> json) => _$_Payment(
      paymentMonth: json['payment_month'] as String,
      labourCost: json['labour_cost'] as int,
      hourWorking: json['hour_woking'] as int,
      hourlyWage: json['hourly_wage'] as int,
      paymentAmount: json['payment_amount'] as int,
      paymentStatus: json['payment_status'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaymentToJson(_$_Payment instance) =>
    <String, dynamic>{
      'payment_month': instance.paymentMonth,
      'labour_cost': instance.labourCost,
      'hour_woking': instance.hourWorking,
      'hourly_wage': instance.hourlyWage,
      'payment_amount': instance.paymentAmount,
      'payment_status': instance.paymentStatus,
      'items': instance.items,
    };
