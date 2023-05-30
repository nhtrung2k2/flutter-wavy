// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_salary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemSalary _$$_ItemSalaryFromJson(Map<String, dynamic> json) =>
    _$_ItemSalary(
      id: json['item_type_id'] as int,
      price: json['price'] as int,
      option: json['option'] as int,
    );

Map<String, dynamic> _$$_ItemSalaryToJson(_$_ItemSalary instance) =>
    <String, dynamic>{
      'item_type_id': instance.id,
      'price': instance.price,
      'option': instance.option,
    };
