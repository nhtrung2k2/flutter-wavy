// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Employee_Detail _$$_Employee_DetailFromJson(Map<String, dynamic> json) =>
    _$_Employee_Detail(
      id: json['babysistter_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      cancel__contract_date: json['cancel_contract_date'] == null
          ? null
          : DateTime.parse(json['cancel_contract_date'] as String),
      avatar: json['avatar'] as String? ??
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png",
    );

Map<String, dynamic> _$$_Employee_DetailToJson(_$_Employee_Detail instance) =>
    <String, dynamic>{
      'babysistter_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'cancel_contract_date': instance.cancel__contract_date?.toIso8601String(),
      'avatar': instance.avatar,
    };
