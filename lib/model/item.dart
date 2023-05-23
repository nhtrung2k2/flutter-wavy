
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
abstract class Item with _$Item {
  const factory Item({
    @JsonKey(name: 'item_id')
    required int itemId,
    @JsonKey(name: 'item_name')
    required String itemName,
    @JsonKey(name: 'item_amount')
    required int itemAmount,
    @JsonKey(name: 'include_in_payment', nullable: true)
    int? includeInPayment
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}