// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      itemId: json['item_id'] as int,
      itemName: json['item_name'] as String? ?? '',
      itemAmount: json['item_amount'] as int,
      option: json['option'] as int? ?? 1,
      includeInPayment: json['include_in_payment'] as int?,
      canRemove: json['canRemove'] as bool? ?? true,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'item_amount': instance.itemAmount,
      'option': instance.option,
      'include_in_payment': instance.includeInPayment,
      'canRemove': instance.canRemove,
    };
