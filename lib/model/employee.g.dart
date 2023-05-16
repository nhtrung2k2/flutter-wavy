// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Employee _$$_EmployeeFromJson(Map<String, dynamic> json) => _$_Employee(
      id: json['babysistter_id'] as String,
      name: json['name'] as String,
      age: json['age'] as String,
      city: json['city'] as String,
      shiftId: json['shift_id'] as int,
      cancel__contract_date: json['cancel_contract_date'] == null
          ? null
          : DateTime.parse(json['cancel_contract_date'] as String),
      avatar: json['avatar'] as String? ??
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png",
    );

Map<String, dynamic> _$$_EmployeeToJson(_$_Employee instance) =>
    <String, dynamic>{
      'babysistter_id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'city': instance.city,
      'shift_id': instance.shiftId,
      'cancel_contract_date': instance.cancel__contract_date?.toIso8601String(),
      'avatar': instance.avatar,
    };
