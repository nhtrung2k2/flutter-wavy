// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cost _$$_CostFromJson(Map<String, dynamic> json) => _$_Cost(
      amountDate: json['amount_date'] as String,
      labourCost: json['labour_cost'] as int,
      workingTime: json['working_time'] as String,
      hourWorking: json['hour_woking'] as int,
      hourlyWave: json['hourly_wage'] as int,
      amount: json['amount'] as int,
      confirmFlag: json['confirm_flag'] as int,
      paymentStatus: json['payment_status'] as int,
      picture1: json['picture_1'] as String?,
      picture2: json['picture_2'] as String?,
      picture3: json['picture_3'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CostToJson(_$_Cost instance) => <String, dynamic>{
      'amount_date': instance.amountDate,
      'labour_cost': instance.labourCost,
      'working_time': instance.workingTime,
      'hour_woking': instance.hourWorking,
      'hourly_wage': instance.hourlyWave,
      'amount': instance.amount,
      'confirm_flag': instance.confirmFlag,
      'payment_status': instance.paymentStatus,
      'picture_1': instance.picture1,
      'picture_2': instance.picture2,
      'picture_3': instance.picture3,
      'items': instance.items,
    };
