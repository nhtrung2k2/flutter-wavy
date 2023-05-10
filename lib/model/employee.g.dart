// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      city: json['city'] as String,
      avatar: json['avatar'] as String? ??
          'https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png',
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'avatar': instance.avatar,
      'city': instance.city,
    };
